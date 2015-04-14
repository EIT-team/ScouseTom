function [ Zall ] = ScouseTom_ProcessZ( varargin )
% Gets contact Impedances from "Contact Check" in biosemi file. Assumes only 1 contact
% impedance check at the moment.
%   assumes input order:

% ExpSetup - if not given explicitly then a ExperimentalInfo.mat is found
% in the same or above folder. If still not found then user is prompted
% filename (fullfile) - user prompted if not given
% HDR(opt) - if not given then filename-HDR.mat is searched, or is
% calculated
% SWW(opt) - if not given then is calculated


%
% Written by Tactile and Tawdry Jimmy 2014


%% load file

%prompt user if no inputs
if isempty(varargin) == 1
    
    [filename, pathname] = uigetfile('*.bdf', 'Choose which Biosemi file with Zcheck to load');
    if isequal(filename,0) || isequal(pathname,0)
        error('User pressed cancel')
    else
        disp(['User selected ', fullfile(pathname, filename)])
    end
    
    fname =fullfile(pathname,filename);
end

if nargin == 1
    ExpSetup=varargin{1};
    [filename, pathname] = uigetfile('*.bdf', 'Choose which Biosemi file with Zcheck to load',ExpSetup.dname);
    if isequal(filename,0) || isequal(pathname,0)
        error('User pressed cancel')
    else
        disp(['User selected ', fullfile(pathname, filename)])
    end
    
    fname =fullfile(pathname,filename);
end



if nargin == 2
    ExpSetup=varargin{1};
    fname=varargin{2};
    
end

if nargin == 3
    ExpSetup=varargin{1};
    fname=varargin{2};
    HDR=varargin{3};
end

if nargin == 4
    ExpSetup=varargin{1};
    fname=varargin{2};
    HDR=varargin{3};
    SWW=varargin{4};
end



[pathstr,bdfname]=fileparts(fname); % get just the first bits of the filenames for later



%% load experimental info

%if ExpSetup was not passed to function
if exist('ExpSetup','var') == 0
    
    %first see if there is the structure in the same path OR in the one above -
    %this is assuming the file structure as created in ScouseTom_Setup
    
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





%% get experimental info

%check for errors in loading
if exist('ExpSetup','var') == 1
    fieldsneeded={'Ampl','Elec_num','Protocol','Info','Freq'};
    if any(~isfield(ExpSetup,fieldsneeded)) ==1
        error('Fields Missing from ExpSetup!');
    else
        disp('All Experimental Info loaded OK');
    end
else
    error('ExpSetup Missing!');
end


N_elec=ExpSetup.Elec_num; %number of electrodes
N_prt=N_elec; %this is the same as N_elec as the protocol lines is equal to number of electrodes for contact checks
Amp=ExpSetup.Ampl; %amplitude of injection

%% load data header file


if exist('HDR','var') ==0
    
    %check if HDR .mat exists - load it to avoid having to load it again
    
    hdrfname=fullfile(pathstr,[bdfname, '-HDR.mat']);
    
    
    if exist(hdrfname,'file') ==2
        disp('HDR .mat already exists for this file, loading that to avoid laborious processing');
        load(hdrfname);
        disp('Making New FID and storing in Matfile');
        fidnew=fopen(HDR.FileName,[HDR.FILE.PERMISSION,'b'],'ieee-le');
        HDR.FILE.FID=fidnew;
        save(hdrfname,'HDR','ExpSetup');
        disp('IF YOU GET FILE FSEEK INVALID FILE INDENTIFIER ERRORS THEN DELETE THIS .MAT AND TRY AGAIN');

    else
        disp('About to open BioSemi file and create HDR');
        disp('HERE WE GOOOOOOOOOO');
        % create header file for loading data, turn off overflowdetecion
        % warnings and only load the injection channels - in case there was a
        % reference channel included
        HDR=sopen(fname,'r',[1:N_elec],['OVERFLOWDETECTION:OFF']);
        save(hdrfname,'HDR','ExpSetup');
        
    end
    
    Fs=HDR.SampleRate;
    
    disp('----------------------');
    
    
else
    disp('Biosemi Header already loaded');
end
Fs=HDR.SampleRate;



%% get events

if exist('SWW','var')==0;
    disp('Reading Events in Biosemi File');
    SWW=ScouseTom_ReadEvents(HDR);
else
    disp('Events already found');
end


%% Run each impedance check separately

% run each
Z_checks_num=length(SWW.ContactFirst);

for iZ = 1:Z_checks_num
    
    
    %% read portion of interest and segment
    
    %sread needs integer seconds
    Data_start=floor(SWW.ContactFirst(iZ)/Fs);
    Data_end=ceil(SWW.ContactLast(iZ)/Fs);
    Data_length=fix(Data_end-Data_start);
    
    Data_start_s=Data_start*Fs;
    Data_end_s=Data_end*Fs;
    
    %load the data
    disp(['Reading relevant data for contact check :', num2str(iZ)]);
    V=sread(HDR,Data_length,Data_start);
    
    
    %segmentdata
    Vseg=segment_ind(V(:,1:N_elec),SWW.ContactCheckSwitches(:,iZ)-Data_start_s,0.0001,N_elec,N_elec,Fs);
    
    %% get filter coeffs and demod trim values
    
    [trim_demod,B,A,Fc]=ScouseTom_GetFilterTrim( Vseg(1,:,1),Fs,0 );
    
    
    
    %% demodulate
    
    disp('Demodulating');
    
    Vsegdemod=demod_seg2(Vseg,Fs,N_prt,N_elec,1,B,A);
    
    
    %get boundary voltages
    BV=seg2BV(Vsegdemod,trim_demod,'please dont reshape thank youu please');
    
    %This checks for the error from the older version of the switching thing
    %which ended a switch early
    
    [~,badness]=ScouseTom_EstimateInjPair(BV(end,:));
    
    if badness ==1
        disp('The last result is fucked - this is likely due to the buggy version of the contact switch code which didnt have the last one. setting to Nan');
        BV(end,:)=nan;
    end
    
    
    
    
    
    
    %only interested in the injection voltages
    
    Injchn=[1:N_elec; circshift(1:N_elec,[1 -1])]';
    InjchnV=nan(size(Injchn));
    Injchndiff=nan(N_elec,1);
    
    
    %get the injection voltages from each pair as well as the "legacy"
    %difference measurements
    for iElec=1:N_elec;
        
        InjchnV(iElec,:)=BV(iElec,Injchn(iElec,:));
        Injchndiff(iElec)=diff(InjchnV(iElec,:));
    end
    
    
    %convert into impedances using peak amplitude values and convert uV to V
    
    %use peak values as peak values calculated during demod
    
    %scale factor - impedance conversion
    ZSF=1/((1e6)*Amp);
    
    %biosemi max line
    biosemimax=500e3; %500mV max input range of biosemi
    
    MaxZ=biosemimax*ZSF;
    
    %calc impedances and align each repeat for electrode
    Z=InjchnV*ZSF;
    Z=[Z(:,1), circshift(Z(:,2),[1 1])];
    %calc the "legacy" UCH 2 channel one too
    dZ=Injchndiff*ZSF;
    
    
    %take average of the two readings for each electrode
    Zave=nanmean(Z,2);
    
    %date stamp for this z check
    datestart=HDR.T0;
    datestart(6)=datestart(6)+Data_start;
    datestart=datenum(datestart);
    
    
    
    
    figure
    
    title([datestr(datestart), ': Contact Z @ ', num2str(Fc), ' Hz, and ', num2str(Amp), ' A'])
    hold on
    bar(Zave)
    line([0 N_elec],[MaxZ MaxZ],'color','r','linewidth',5)
    hold off
    set(gca,'Xtick',[1:N_elec])
    
    
    
    
    
    Zout.Zi=Z;
    Zout.Z=Zave;
    Zout.dZ=dZ;
    Zout.ExpSetup=ExpSetup;
    Zout.info.B=B;
    Zout.info.A=A;
    Zout.info.Fc=Fc;
    Zout.info.trim_demod=trim_demod;
    Zout.info.bdf_filename=bdfname;
    Zout.TimeNum=datestart;
    Zout.TimeVec=datevec(datestart);
    
    Zall(iZ)=Zout;
    
    
    %% save data
    
    %Zchecks should all be stuck in the same folder - Zcheck. So check if this
    %does not exist then keep the Zcheck result in the same folder as the bdf
    %to avoid making shitloads of folders everywhere by mistake
    
    
    %find if the Zcheck directory exists by going up one directory and seeing
    %if Zcheck exists.
    
    %find file separators
    k=strfind(pathstr,filesep);
    %Zcheck path
    Zcheckpathstr=[pathstr(1:k(end)), 'Zcheck'];
    
    if exist(Zcheckpathstr,'dir') ~= 7
        %if this doesnt exist, then just save it in the folder of the
        %bdf file
        Zcheckpathstr=pathstr;
        
        if Z_checks_num > 1
            
            Zfilename=[bdfname, '-Zcheck' num2str(iZ) '.mat'];
        else
            Zfilename=[bdfname, '-Zcheck.mat'];
        end
    else
        %make filename with timestamp for zcheck folder
        
        
        
        
        
        
        Zfilename=sprintf('Zcheck_%d-%d-%d_%d-%d-%d.mat',datevec(datestart));
    end
    
    
    
    
    %save
    save(fullfile(Zcheckpathstr,Zfilename),'Zout');
    disp('----------------------');
    
end
disp('Z Check Finished');
disp('----------------------');



end

