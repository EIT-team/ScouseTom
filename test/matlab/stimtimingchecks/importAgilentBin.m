function [timeVector, voltageVector] = importAgilentBin(inputFilename, varargin)
% ImportAgilentBin reads the Agilent Binary Waveform filetype.
% [timeVector, voltageVector] = importAgilentBin(inputFilename)
% [timeVector, voltageVector] = importAgilentBin(inputFilename, waveform_index)
% if waveformIndex is not provided, the first waveform will be read
% voltageVector may contain two columns [MIN, MAX]

if (~exist(inputFilename))
    error('inputFilename missing.');
end

fileId = fopen(inputFilename, 'r');

% read file header
fileCookie = fread(fileId, 2, 'char');
fileVersion = fread(fileId, 2, 'char');
fileSize = fread(fileId, 1, 'int32');
nWaveforms = fread(fileId, 1, 'int32');

% verify cookie
fileCookie = char(fileCookie');
if (~strcmp(fileCookie, 'AG'))
    fclose(fileId);
    error('Unrecognized file format.');
end

% determine which waveform to read
waveformSelect = 1;
if (size(varargin) == 1 & varargin{1} <= nWaveforms)
    waveformSelect = varargin{1};
end

for waveformIndex = 1:nWaveforms
    % read waveform header
    headerSize = fread(fileId, 1, 'int32'); bytesLeft = headerSize - 4;
    waveformType = fread(fileId, 1, 'int32'); bytesLeft = bytesLeft - 4;
    nWaveformBuffers = fread(fileId, 1, 'int32'); bytesLeft = bytesLeft - 4;
    nPoints = fread(fileId, 1, 'int32'); bytesLeft = bytesLeft - 4;
    count = fread(fileId, 1, 'int32');  bytesLeft = bytesLeft - 4;
    xDisplayRange = fread(fileId, 1, 'float32');  bytesLeft = bytesLeft - 4;
    xDisplayOrigin = fread(fileId, 1, 'double');  bytesLeft = bytesLeft - 8;
    xIncrement = fread(fileId, 1, 'double');  bytesLeft = bytesLeft - 8;
    xOrigin = fread(fileId, 1, 'double');  bytesLeft = bytesLeft - 8;
    xUnits = fread(fileId, 1, 'int32');  bytesLeft = bytesLeft - 4;
    yUnits = fread(fileId, 1, 'int32');  bytesLeft = bytesLeft - 4;
    dateString = fread(fileId, 16, 'char'); bytesLeft = bytesLeft - 16;
    timeString = fread(fileId, 16, 'char'); bytesLeft = bytesLeft - 16;
    frameString = fread(fileId, 24, 'char'); bytesLeft = bytesLeft - 24;
    waveformString = fread(fileId, 16, 'char'); bytesLeft = bytesLeft - 16;
    timeTag = fread(fileId, 1, 'double'); bytesLeft = bytesLeft - 8;
    segmentIndex = fread(fileId, 1, 'uint32'); bytesLeft = bytesLeft - 4;

    % skip over any remaining data in the header
    fseek(fileId, bytesLeft, 'cof');

    % generate time vector from xIncrement and xOrigin values
    if (waveformIndex == waveformSelect)
        timeVector = (xIncrement * [0:(nPoints-1)]') + xOrigin;
    end

    for bufferIndex = 1:nWaveformBuffers
        % read waveform buffer header
        headerSize = fread(fileId, 1, 'int32'); bytesLeft = headerSize - 4;
        bufferType = fread(fileId, 1, 'int16'); bytesLeft = bytesLeft - 2;
        bytesPerPoint = fread(fileId, 1, 'int16'); bytesLeft = bytesLeft - 2;
        bufferSize = fread(fileId, 1, 'int32'); bytesLeft = bytesLeft - 4;

        % skip over any remaining data in the header
        fseek(fileId, bytesLeft, 'cof');

        if (waveformIndex == waveformSelect)
            if ((bufferType == 1) | (bufferType == 2) | (bufferType == 3))
                % bufferType is PB_DATA_NORMAL, PB_DATA_MIN, or PB_DATA_MAX (float)
                voltageVector(:, bufferIndex) = fread(fileId, nPoints, 'float');
            elseif (bufferType == 4)
                % bufferType is PB_DATA_COUNTS (int32)
                voltageVector(:, bufferIndex) = fread(fileId, nPoints, '*int32');
            elseif (bufferType == 5)
                % bufferType is PB_DATA_LOGIC (int8)
                voltageVector(:, bufferIndex) = fread(fileId, nPoints, '*uint8');
            else
                % unrecognized bufferType read as unformated bytes
                voltageVector(:, bufferIndex) = fread(fileId, bufferSize, '*uint8');
            end
        else
            fseek(fileId, bufferSize, 'cof');
        end
    end
end
fclose(fileId);
