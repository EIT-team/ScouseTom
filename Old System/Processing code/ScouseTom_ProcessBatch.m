function [ output_args ] = ScouseTom_ProcessBatch( ExpSetup )
%ScouseTom_ProcessBatch - Batch processing all .bdf files in a single
%directory
%   Processing all bdfs using ScouseTom_processinject - ignores very small
%   files (<1mb) as these were files that the user created but forgot to
%   hit start on the biosemi software (I have done this a lot)

% cobbled together in a hurry by the sentimental yet crepuscular Jimmy 


%user chooses directory where all the .bdfs are
dirname=uigetdir('','Pick the directory where the data is located');
if isempty(dirname)
    error('User Pressed Cancel');
end

%% find all the .bdfs in the directory

files=dir([dirname filesep '*.bdf']);

% check if there are scans actually found
if isempty(files)
    error('No scan files found!');
end

nfiles=length(files);

disp(['Found ' num2str(nfiles) ' .bdf files in directory']);

%ignore small files <1Mb as these are empty 

smallfile=cell2mat({files.bytes})/1e6;
smallfile = smallfile < 1;

if any(smallfile)
    disp(['WARNING! ' num2str(nnz(smallfile)) ' VERY SMALL (<1 Mb) file(s) were detected! These will be ignored']);
    files(smallfile)=[];

end

nfiles=length(files);

    
%% check to see if expsetup given

if exist('ExpSetup','var') ==0
    %if expsetup not given then check the folder and the one above for
    %ExperimentalInfo.mat
    
pathstr=dirname;
matfname=fullfile(pathstr,'ExperimentInfo.mat');

if exist(matfname,'file') == 2
    disp('ExperimentInfo Matfile found in the same directory as .bdf file, loading that one');
    load(matfname);
else
    %most like it is NOT in the same directory but one directory up
    k=strfind(pathstr,filesep);
    newpathstr=pathstr(1:k(end));
    newmatfname=fullfile(newpathstr,'ExperimentInfo.mat');
    
    if exist(newmatfname,'file')==2
        disp('ExperimentInfo Matfile found in the directory above the which contains the bdf file - loading that one');
        load(newmatfname);
        
    else
        %if this doesnt exist then promt user to select one or enter
        %manually
        disp('No ExperimentalInfo Matfile found - asking user to point to one');
        
        [expfilename, exppathname] = uigetfile('*.mat', 'Choose ExperimentInfo Matfile. Hit Cancel to add relevant info manually',pathstr);
        if isequal(expfilename,0) || isequal(exppathname,0)
            disp('User pressed cancel on ExperimentInfo select, enterring manually');
            
            prompt={'Amplitude (A)','Frequency (Hz)','Number of electrodes                              '};
            dlg_title='Please enter the relevant info for this dataset';
            def={'250e-6','2000','16'};
            
            manualstuffs=inputdlg(prompt,dlg_title,1,def);
            
            if isempty(manualstuffs) ==1
                error('user pressed cancel');
            end
            
            %read the inputs
            ExpSetup.Ampl=sscanf(manualstuffs{1},'%f');
            ExpSetup.Freq=sscanf(manualstuffs{2},'%f');
            ExpSetup.Elec_num=sscanf(manualstuffs{3},'%f');
            
            %get the protocol file
            
            [pfilename, ppathname] = uigetfile({'*.txt;*.prt','Protocol Files (*.txt,*.prt)';}, 'Choose which Protocol file to load',pathstr);
            if isequal(pfilename,0) || isequal(ppathname,0)
                error('User pressed cancel on protocol select')
            else
                disp(['User selected protocol file:  ', fullfile(ppathname, pfilename)])
            end
            
            pfname =fullfile(ppathname,pfilename);
            
            Prot=load(pfname);
            
            ExpSetup.Protocol=Prot;
            
            %do some extra stuff
            ExpSetup.Info.Desc='This structure created automatically from manually enterred values';
            
            %get timestamp for file creation
            
            ExpSetup.Info.TimeStamp=now;
            ExpSetup.Info.DateStr=datestr(now);
            
            % save this to avoid this rigmarole next time
            disp(['Saving ExpSetup to ', matfname, ' for future use']);
            save(matfname,'ExpSetup');
            
            
        else
            disp(['User selected ExperimentInfo file:  ', fullfile(exppathname, expfilename)]);
            load(fullfile(exppathname, expfilename));
        end
        
    end
end

end

%% process each bdf!

tic 
for iFile =1:nfiles
    disp(['Processing file ' num2str(iFile) ' of ' num2str(nfiles) ': ' files(iFile).name]);
    
    ScouseTom_ProcessInject(ExpSetup,fullfile(dirname,files(iFile).name));
    
    disp('==================================');
    
end

el=toc;

fprintf('All Processing finished in : %.2f seconds\r\n',el);

disp('AWW YISSSS');

















end






