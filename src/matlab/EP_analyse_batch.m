function [ Area,Peak,TimeToPeak,OutputFull] = EP_analyse_batch( dirname )
%SCOUSETOM_PROCESSBATCH Summary of this function goes here
%   Detailed explanation goes here

%% Check or get directory

if exist('dirname','var') ==0
    %user chooses directory where all the .bdfs are
    dirname=uigetdir('','Pick the directory where the data is located');
    if isempty(dirname)
        error('User Pressed Cancel');
    end
end
%% find all the eeg files in the directory

bdffiles=dir([dirname filesep '*.bdf']);
eegfiles=dir([dirname filesep '*.eeg']);

% check if there are scans actually found
if isempty(bdffiles) && isempty(eegfiles)
    error('No eeg or bdf files found!');
end

nbdffiles=length(bdffiles);
neegfiles=length(eegfiles);

disp(['Found ' num2str(nbdffiles) ' .bdf files in directory']);
disp(['Found ' num2str(neegfiles) ' .eeg files in directory']);

%ignore small files <1Mb as these are empty

smallbdffile=cell2mat({bdffiles.bytes})/1e6;
smallbdffile = smallbdffile < 1;

if any(smallbdffile)
    fprintf(2,'WARNING! %d VERY SMALL (<1 Mb) bdf file(s) were detected! These will be ignored\n',nnz(smallbdffile));
    bdffiles(smallbdffile)=[];
end

smalleegfile=cell2mat({bdffiles.bytes})/1e6;
smalleegfile = smalleegfile < 1;

if any(smalleegfile)
    fprintf(2,'WARNING! %d VERY SMALL (<1 Mb) eeg file(s) were detected! These will be ignored\n',nnz(smalleegfile));
    bdffiles(smalleegfile)=[];
end

nbdffiles=length(bdffiles);
neegfiles=length(eegfiles);

brokenfiles=0;


%% Setup variables for global values
FileCounter=1;
Area=nan(nbdffiles+neegfiles,3);
Peak=nan(nbdffiles+neegfiles,1);
TimeToPeak=nan(nbdffiles+neegfiles,1);
OutputFull=cell(nbdffiles+neegfiles,3);


%% process each bdf!
if (nbdffiles > 0)
    tic
    for iFile =1:nbdffiles
        disp(['Processing bdf file ' num2str(iFile) ' of ' num2str(nbdffiles) ': ' bdffiles(iFile).name]);
        try
            
            Out=EP_analyse(fullfile(dirname,bdffiles(iFile).name));
            
            for iSep = 1:3
                if size(Out{iSep}.A,2) ==1
                    Area(FileCounter,iSep)=Out{iSep}.A;
                    Peak(FileCounter,iSep)=Out{iSep}.P;
                    TimeToPeak(FileCounter,iSep)=Out{iSep}.T_p;
                end
            end
            
            OutputFull(FileCounter,:)=Out;
            
        catch
            fprintf(2,'OH NO! Problem loading file! \n');
            brokenfiles=brokenfiles+1;
        end
        FileCounter=FileCounter+1;
        disp('=========================================================');
    end
    el=toc;
    fprintf('All .BDF Processing finished in : %.2f seconds\r\n',el);
end
%% process each eeg
if (neegfiles > 0)
    tic
    for iFile =1:neegfiles
        disp(['Processing eeg file ' num2str(iFile) ' of ' num2str(neegfiles) ': ' eegfiles(iFile).name]);
        try
            EP_analyse(fullfile(dirname,eegfiles(iFile).name));
        catch
            fprintf(2,'OH NO! Problem loading file! \n');
            brokenfiles=brokenfiles+1;
        end
        
        disp('=========================================================');
    end
    el=toc;
    fprintf('All .EEG Processing finished in : %.2f seconds\n',el);
end

%%

fprintf('ALL FILES DONE! AWW YISSSS\n');

if brokenfiles
    fprintf(2,'THERE WERE ERRORS IN %d FILES\n',brokenfiles);
end

%% save

save(fullfile(dirname,'EP_analyse_batch'),'Area','Peak','TimeToPeak','OutputFull');




end

