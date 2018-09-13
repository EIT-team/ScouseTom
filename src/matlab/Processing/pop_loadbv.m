% pop_loadbv() - load Brain Vision Data Exchange format dataset and
%                return EEGLAB EEG structure
%
% Usage:
%   >> [EEG, com] = pop_loadbv; % pop-up window mode
%   >> [EEG, com] = pop_loadbv(path, hdrfile);
%   >> [EEG, com] = pop_loadbv(path, hdrfile, srange);
%   >> [EEG, com] = pop_loadbv(path, hdrfile, [], chans);
%   >> [EEG, com] = pop_loadbv(path, hdrfile, srange, chans);
%
% Optional inputs:
%   path      - path to files
%   hdrfile   - name of Brain Vision vhdr-file (incl. extension)
%   srange    - scalar first sample to read (up to end of file) or
%               vector first and last sample to read (e.g., [7 42];
%               default: all)
%   chans     - vector channels channels to read (e.g., [1:2 4];
%               default: all)
%
% Outputs:
%   EEG       - EEGLAB EEG structure
%   com       - history string
%
% Author: Andreas Widmann & Arnaud Delorme, 2004-

%123456789012345678901234567890123456789012345678901234567890123456789012

% Copyright (C) 2004 Andreas Widmann, University of Leipzig, widmann@uni-leipzig.de
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

% $Id: pop_loadbv.m,v 1.3 2009-07-01 01:08:54 arno Exp $

function [EEG, com] = pop_loadbv(path, hdrfile, srange, chans)

    com = '';
    EEG = [];

    if nargin < 2
        [hdrfile path] = uigetfile2('*.vhdr', 'Select Brain Vision vhdr-file - pop_loadbv()');
        if hdrfile(1) == 0, return; end

        drawnow;
        uigeom = {[1 0.5] [1 0.5]};
        uilist = {{ 'style' 'text' 'string' 'Interval (samples; e.g., [7 42]; default: all):'} ...
                  { 'style' 'edit' 'string' ''} ...
                  { 'style' 'text' 'string' 'Channels (e.g., [1:2 4]; default: all):'} ...
                  { 'style' 'edit' 'string' ''}};
        result = inputgui(uigeom, uilist, 'pophelp(''pop_loadbv'')', 'Load a Brain Vision Data Exchange format dataset');
        if isempty(result), return, end
        if ~isempty(result{1}),
            srange = str2num(result{1});
        end
        if ~isempty(result{2}),
            chans = str2num(result{2});
        end
    end

    % Header file
    disp('pop_loadbv(): reading header file');
    hdr = readconfig(path, hdrfile);

    % Common Infos
    try
        EEG = eeg_emptyset;
    catch
    end
    EEG.comments = ['Original file: ' hdr.commoninfos.datafile];
    hdr.commoninfos.numberofchannels = str2double(hdr.commoninfos.numberofchannels);
    EEG.srate = 1000000 / str2double(hdr.commoninfos.samplinginterval);
    
    % Binary Infos
    if strcmpi(hdr.commoninfos.dataformat, 'binary')
        switch lower(hdr.binaryinfos.binaryformat)
            case 'int_16',        binformat = 'int16'; bps = 2;
            case 'uint_16',       binformat = 'uint16'; bps = 2;
            case 'ieee_float_32', binformat = 'float32'; bps = 4;
            otherwise, error('Unsupported binary format');
        end
    end

    % Channel Infos
    if ~exist('chans', 'var')
        chans = 1:hdr.commoninfos.numberofchannels;
        EEG.nbchan = hdr.commoninfos.numberofchannels;
    elseif isempty(chans)
        chans = 1:hdr.commoninfos.numberofchannels;
        EEG.nbchan = hdr.commoninfos.numberofchannels;
    else
        EEG.nbchan = length(chans);
    end
    if any(chans < 1) || any(chans > hdr.commoninfos.numberofchannels)
        error('chans out of available channel range');
    end
    if isfield(hdr, 'channelinfos')
        for chan = 1:length(chans)
            [EEG.chanlocs(chan).labels, chanlocs(chan).ref, chanlocs(chan).scale, chanlocs(chan).unit] = strread(hdr.channelinfos{chans(chan)}, '%s%s%s%s', 1, 'delimiter', ',');
            EEG.chanlocs(chan).labels = char(EEG.chanlocs(chan).labels);
            chanlocs(chan).scale = str2double(char(chanlocs(chan).scale));
%             chanlocs(chan).unit = native2unicode(double(char(chanlocs(chan).scale)), 'UTF-8');
%             EEG.chanlocs(chan).datachan = chans(chan);
        end
        if isempty([chanlocs.scale])
            chanlocs = rmfield(chanlocs, 'scale');
        end
    end;
%     [EEG.chanlocs.type] = deal([]);

    % Coordinates
    if isfield(hdr, 'coordinates')
        hdr.coordinates(end+1:length(chans)) = { [] };
        for chan = 1:length(chans)
            if ~isempty(hdr.coordinates{chans(chan)})
                [EEG.chanlocs(chan).sph_radius, theta, phi] = strread(hdr.coordinates{chans(chan)}, '%f%f%f', 'delimiter', ',');
                if EEG.chanlocs(chan).sph_radius == 0 && theta == 0 && phi == 0
                    EEG.chanlocs(chan).sph_radius = [];
                    EEG.chanlocs(chan).sph_theta = [];
                    EEG.chanlocs(chan).sph_phi = [];
                else
                    EEG.chanlocs(chan).sph_theta = phi - 90 * sign(theta);
                    EEG.chanlocs(chan).sph_phi = -abs(theta) + 90;
                end
            end;
        end
        try,
            [EEG.chanlocs, EEG.chaninfo] = pop_chanedit(EEG.chanlocs, 'convert', 'sph2topo');
            [EEG.chanlocs, EEG.chaninfo] = pop_chanedit(EEG.chanlocs, 'convert', 'sph2cart');
        catch, end
    end

    % Open data file and find the number of data points
    % -------------------------------------------------
    disp('pop_loadbv(): reading EEG data');
    [IN, message] = fopen(fullfile(path, hdr.commoninfos.datafile));
    if IN == -1
        [IN, message] = fopen(fullfile(path, lower(hdr.commoninfos.datafile)));
        if IN == -1
            error(message)
        end;
    end
    if isfield(hdr.commoninfos, 'datapoints')
        hdr.commoninfos.datapoints = str2double(hdr.commoninfos.datapoints);
    elseif strcmpi(hdr.commoninfos.dataformat, 'binary')
        fseek(IN, 0, 'eof');
        hdr.commoninfos.datapoints = ftell(IN) / (hdr.commoninfos.numberofchannels * bps);
        fseek(IN, 0, 'bof');
    else
        hdr.commoninfos.datapoints = NaN;
    end
       
    if ~strcmpi(hdr.commoninfos.dataformat, 'binary') % ASCII
        tmppoint = hdr.commoninfos.datapoints;
        tmpchan = fscanf(IN, '%s', 1);
        tmpdata = fscanf(IN, '%f', inf);
        hdr.commoninfos.datapoints = length(tmpdata);
        chanlabels = 1;
        if str2double(tmpchan) == 0, 
            hdr.commoninfos.datapoints = hdr.commoninfos.datapoints+1; 
            chanlabels = 0;
        end;
        if ~isnan(tmppoint) 
            if tmppoint ~= hdr.commoninfos.datapoints
                error('Error in computing number of data points; try exporting in a different format');
            end;
        end;
    end;
        
    % Sample range
    if ~exist('srange', 'var') || isempty(srange)
        srange = [ 1 hdr.commoninfos.datapoints];
        EEG.pnts = hdr.commoninfos.datapoints;
    elseif length(srange) == 1
        EEG.pnts = hdr.commoninfos.datapoints - srange(1) + 1;
    else
        EEG.pnts = srange(2) - srange(1) + 1;
    end
    if any(srange < 1) || any(srange > hdr.commoninfos.datapoints)
        error('srange out of available data range');
    end
    
    % Read data
    if strcmpi(hdr.commoninfos.dataformat, 'binary')
        switch lower(hdr.commoninfos.dataorientation)
            case 'multiplexed'
                if EEG.nbchan == hdr.commoninfos.numberofchannels % Read all channels
                    fseek(IN, (srange(1) - 1) * EEG.nbchan * bps, 'bof');
                    EEG.data = fread(IN, [EEG.nbchan, EEG.pnts], [binformat '=>float32']);
                else % Read channel subset
                    EEG.data = repmat(single(0), [EEG.nbchan, EEG.pnts]); % Preallocate memory
                    for chan = 1:length(chans)
                        fseek(IN, (srange(1) - 1) * hdr.commoninfos.numberofchannels * bps + (chans(chan) - 1) * bps, 'bof');
                        EEG.data(chan, :) = fread(IN, [1, EEG.pnts], [binformat '=>float32'], (hdr.commoninfos.numberofchannels - 1) * bps);
                    end
                end
            case 'vectorized'
                if isequal(EEG.pnts, hdr.commoninfos.datapoints) && EEG.nbchan == hdr.commoninfos.numberofchannels % Read entire file
                    EEG.data = fread(IN, [EEG.pnts, EEG.nbchan], [binformat '=>float32']).';
                else % Read fraction of file
                    EEG.data = repmat(single(0), [EEG.nbchan, EEG.pnts]); % Preallocate memory
                    for chan = 1:length(chans)
                        fseek(IN, ((chans(chan) - 1) * hdr.commoninfos.datapoints + srange(1) - 1) * bps, 'bof');
                        EEG.data(chan, :) = fread(IN, [1, EEG.pnts], [binformat '=>float32']);
                    end
                end
            otherwise
                error('Unsupported data orientation')
        end
    else % ASCII data
        disp('If this function does not work, export your data in binary format');
        EEG.data = repmat(single(0), [EEG.nbchan, EEG.pnts]);
        if strcmpi(lower(hdr.commoninfos.dataorientation), 'vectorized')
            count = 1;
            fseek(IN, 0, 'bof');
            len = inf;
            for chan = 1:hdr.commoninfos.numberofchannels
                if chanlabels, tmpchan = fscanf(IN, '%s', 1); end;
                tmpdata = fscanf(IN, '%f', len); len = length(tmpdata);
                if ismember(chan, chans)
                    EEG.data(count, :) = tmpdata(srange(1):srange(2))';
                    count = count + 1;
                end;
            end;
        elseif strcmpi(lower(hdr.commoninfos.dataorientation), 'multiplexed')
            fclose(IN);
            error('ASCII multiplexed reading not implemeted yet; export as a different format');
        end;
    end;
            
    fclose(IN);
    EEG.trials = 1;
    EEG.xmin   = 0;
    EEG.xmax   = (EEG.pnts - 1) / EEG.srate;

    % Convert to EEG.data to double for MATLAB < R14
    if str2double(version('-release')) < 14
        EEG.data = double(EEG.data);
    end

    % Scale data
    if exist('chanlocs', 'var') && isfield(chanlocs, 'scale')
        disp('pop_loadbv(): scaling EEG data');
        for chan = 1:EEG.nbchan
            if ~isnan(chanlocs(chan).scale)
                EEG.data(chan, :) = EEG.data(chan, :) * chanlocs(chan).scale;
            end;
        end
    end

    % Marker file
    if isfield(hdr.commoninfos, 'markerfile')
        disp('pop_loadbv(): reading marker file');
        mrk = readconfig(path, hdr.commoninfos.markerfile);

        if hdr.commoninfos.datafile ~= mrk.commoninfos.datafile
            disp('pop_loadbv() warning: data files in header and marker files inconsistent.');
        end

        % Marker infos
        if isfield(mrk, 'markerinfos')
            for index = 1:length(mrk.markerinfos)
                [mrktype, mrkdesc, EEG.event(index).latency, mrksizepnts, mrkchan, mrktime] = ...
                    strread(mrk.markerinfos{index}, '%s%s%f%d%d%d', 'delimiter', ',');
                if strcmpi(mrktype, 'New Segment') || strcmpi(mrktype, 'DC Correction')
                    EEG.event(index).type = 'boundary';
                    EEG.event(index).code = char(mrktype);
                    EEG.event(index).duration = mrksizepnts;
                else
                    EEG.event(index).type = char(mrkdesc);
                    EEG.event(index).code = char(mrktype);
                    EEG.event(index).duration = mrksizepnts;
                end
                EEG.event(index).channel = mrkchan;
                EEG.event(index).bvtime = mrktime;
                EEG.event(index).latency = EEG.event(index).latency - srange(1) + 1;
                EEG.event(index).urevent = index;
            end

            EEG.event = EEG.event([EEG.event.latency] >= 1 & [EEG.event.latency] <= EEG.pnts);
            EEG.urevent = rmfield(EEG.event, 'urevent');

            % find if boundaries at homogenous intervals
            % ------------------------------------------
            boundaries = strmatch('boundary', {EEG.event.type});
            boundlats = unique([EEG.event(boundaries).latency]);
            if (isfield(hdr.commoninfos, 'segmentationtype') && (strcmpi(hdr.commoninfos.segmentationtype, 'markerbased') || strcmpi(hdr.commoninfos.segmentationtype, 'fixtime'))) && length(boundaries) > 1 && length(unique(diff([boundlats EEG.pnts + 1]))) == 1
                EEG.trials = length(boundlats);
                EEG.pnts   = EEG.pnts / EEG.trials;
                EEG.event(boundaries) = [];

                % adding epoch field
                % ------------------
                for index = 1:length(EEG.event)
                    EEG.event(index).epoch = ceil(EEG.event(index).latency / EEG.pnts);
                end

                % finding minimum time
                % --------------------
                tles = strmatch('time 0', lower({EEG.event.code}))';
                if ~isempty(tles)
                    [EEG.event(tles).type] = deal('TLE');
                    EEG.xmin = -(EEG.event(tles(1)).latency - 1) / EEG.srate;
                end
            end
        end
    end

    EEG.ref = 'common';

    try
        EEG = eeg_checkset(EEG);
    catch
    end

    if nargout == 2
        com = sprintf('EEG = pop_loadbv(''%s'', ''%s'', %s, %s);', path, hdrfile, mat2str(srange), mat2str(chans));
    end

% Read config file
function config = readconfig(path, file)

    if nargin < 2
        error('Not enough input arguments');
    end

    % Open and read file
    [IN, message] = fopen(fullfile(path,file));
    if IN == -1
        [IN, message] = fopen(fullfile(path,lower(file)));
        if IN == -1
            error(message);
        end;
    end
    raw={};
    while ~feof(IN)
        raw = [raw; {fgetl(IN)}];
    end
    fclose(IN);

    % Remove comments and empty lines
    raw(strmatch(';', raw)) = [];
    raw(cellfun('isempty', raw) == true) = [];

    % Find sections
    sections = [strmatch('[', raw)' length(raw) + 1];
    for section = 1:length(sections) - 1

        % Convert section name
        fieldname = lower(char(strread(raw{sections(section)}, '[%s', 'delimiter', ']')));
        fieldname(isspace(fieldname) == true) = [];

        % Fill structure with parameter value pairs
        switch fieldname
            case {'commoninfos' 'binaryinfos'}
                for line = sections(section) + 1:sections(section + 1) - 1
                    [parameter, value] = strread(raw{line}, '%s%s', 'delimiter', '=');
                    config.(fieldname).(lower(char(parameter))) = char(value);
                end
            case {'channelinfos' 'coordinates' 'markerinfos'}
                for line = sections(section) + 1:sections(section + 1) - 1
                    [parameter, value] = strread(raw{line}, '%s%s', 'delimiter', '=');
                    config.(fieldname)(str2double(parameter{1}(3:end))) = value;
                end
            case 'comment'
                config.(fieldname) = raw(sections(section) + 1:sections(section + 1) - 1);
        end
    end