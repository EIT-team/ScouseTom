function [ BV, Z, ExpSetup ] = ScouseTom_ProcessInject( varargin )
%ScouseTom_ProcessInject Processes the data in bdf file created with
%scousetom system. Zchecks are calculated first before performing the bulk
%of the processing of the voltages into boundary voltages. Continuous
%measures of the contact impedances are also calculated.
% The values are stored in a Matrix

%   assumes input order:
% ExpSetup - if not given explicitly then a ExperimentalInfo.mat is found
% in the same or above folder. If still not found then user is prompted
% filename (fullfile) - user prompted if not given

% The function saves the data to filename-BV.mat and the HDR to
% filename-HDR.mat. IF YOU ARE GETTING FSEEK ERRORS THEN DELETE THIS
% MATFILE!!!!!!!!



% Written by The Evocative Daredevil Jimmy 2014

%% parse inputs

disp('----------------------');
%prompt user if no inputs
if isempty(varargin) == 1
    
    [filename, pathname] = uigetfile('*.bdf', 'Choose which Biosemi file with Protocol Injection to load');
    if isequal(filename,0) || isequal(pathname,0)
        error('User pressed cancel')
    else
        disp(['User selected ', fullfile(pathname, filename)])
    end
    
    fname =fullfile(pathname,filename);
end

%if 1 input then choose biosemi file from directory found
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

[pathstr,bdfname]=fileparts(fname); % get just the first bits of the filenames for later



%% load experimental info

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
%% data info - this can be infered from data but better explicit from ExpSetup

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

%rename some variables as they used below

Prot=ExpSetup.Protocol;
N_prt=size(Prot,1);
N_elec=ExpSetup.Elec_num;

%% make keep and rem_idx

injs=ExpSetup.Protocol;
chn=N_elec;
vp=(1:chn)';
vm=ones(size(vp))*(chn+1); %always against a ground electrode

prt_mat=[];
for iii=1:size(injs,1)
    temp=[repmat(injs(iii,:),chn,1) vp vm];
    prt_mat=[prt_mat ; temp];
end

%find keep index
prt_full=prt_mat;
prt=prt_mat;
rem_idx=[];
for iPrt = 1:size(prt,1)
    if any(ismember(prt_full(iPrt,1:2),prt(iPrt,3:4))) ==1
        rem_idx=[rem_idx,iPrt];
    end
end
keep_idx=setdiff(1:length(prt_full),rem_idx);
%% load biosemi file - this might take up shitloads of ram

%check if HDR .mat exists - load it to avoid having to load it again

hdrfname=fullfile(pathstr,[bdfname, '-HDR.mat']);


% if exist(hdrfname,'file') ==2
%     disp('HDR .mat already exists for this file, loading that to avoid laborious processing');
%     load(hdrfname);
% else
disp('About to open BioSemi file and create HDR');
disp('HERE WE GOOOOOOOOOO');
% create header file for loading data, turn off overflowdetecion
% warnings and only load the injection channels - in case there was a
% reference channel included
HDR=sopen(fname,'r',[1:N_elec],['OVERFLOWDETECTION:OFF']);
%     save(hdrfname,'HDR','ExpSetup');

% end

Fs=HDR.SampleRate;

disp('----------------------');

%% read events

disp('Reading Events in Biosemi File');


%ad hoc fixes
% HDR.EVENT.TYP(2:end)=mode(HDR.EVENT.TYP);


SWW=ScouseTom_ReadEvents(HDR);

%% if there was contact check in this data then do this too

if ~isempty(SWW.ContactFirst)
    disp('Contact Check in File. Calculating that first')
    
    Zc=ScouseTom_ProcessZ(ExpSetup,fname,HDR,SWW);
    disp('Contact Check Finished');
    
end
%% now the big one - load the actual data!

if isempty(SWW.InjectionFirst)
    disp('NO INJECTIONS IN FILE!');
    BV=[];
    return
end

%sread needs integer seconds
Data_start=floor(SWW.InjectionFirst(1)/Fs);
Data_end=ceil(SWW.InjectionLast(1)/Fs);
Data_length=fix(Data_end-Data_start);
Data_start_sample=Data_start*Fs;

Data_max=HDR.NRec; % max number of seconds - length of file

Data_start_s=Data_start*Fs;
Data_end_s=Data_end*Fs;

%% create matfile object for saving data

% create object

%matfilename

info.bdfname=bdfname;
info.TimeNum=datenum(HDR.T0);
info.TimeVec=HDR.T0;

bigmat=matfile(fullfile(pathstr,[bdfname '-BV.mat']),'Writable',true);

bigmat.SWW=SWW;

bigmat.ExpSetup=ExpSetup;

bigmat.info=info;

bigmat.keep_idx=keep_idx;
bigmat.rem_idx=rem_idx;
bigmat.prt_full=prt_full;

%% get injection channels for use in contact impedance calculations

%loop through protocol - find which lines in the BV the injection
%electrodes belong to then add then to an array for each electrode.

%Electrode Injections
Elec_inj=nan(N_elec,N_prt);

for iPrt = 1:N_prt
    Prt_cur=Prot(iPrt,:);
    start_idx=((iPrt-1)*N_elec);
    BV_chn=start_idx+Prt_cur;
    
    Elec_inj(Prt_cur,iPrt)=BV_chn;
end

Elec_inj=sort(Elec_inj,2);

%clear up matrix
Elec_inj(:,all(isnan(Elec_inj),1))=[];

%scale factor - impedance conversion
ZSF=1/((1e6)*ExpSetup.Ampl);
%% get data in chunks!

% this bit is pretty badly written but i think it makes sense! chunks were
% taken in time rather than number of events as perhaps the injections were
% for a long time which would again cause out of memory errors

%start timer
tstart=tic;

%chunksize in seconds
chunk_time=10*60; %10 minutes

%finished flag
finished =0;
%first flag
first=1;

%datawindow - the first seconds to be loaded
datawindow_s=[0 chunk_time];

%last sw used
next_sw=0;

%find the first line of the protocol - MAKE THIS CHECK RATHER THAN DO IT
lastprt=0;

disp('----------------------');
disp('----------------------');

%it
iteration=0;


while finished == 0
    
    iteration=iteration+1;
    
    if iteration ==16
        %         disp('this should pause now');
    end
    
    
    %convert window into samples to samples
    datawindow=(datawindow_s*Fs)+Data_start_sample;
    
    
    if first ==1
        %for first run find the start position
        idx_f=find(SWW.InjectionSwitches > datawindow(1),1);
        %             first =0;
    else
        idx_f=next_sw;
    end
    
    % find last COMPLETE switch in recording
    idx_l=find(SWW.InjectionSwitches > datawindow(2),1)-2;
    
    if isempty(idx_l) ==1;
        %if no more switches in file then this is the last iteration
        finished=1;
        idx_l=length(SWW.InjectionSwitches);
        
    end
    
    %store this variable for next loop
    next_sw=idx_l+1;
    
    %find repeat - separate first case as var does not exist
    if first ==1
        start_rep=1;
    else
        start_rep=start_rep+N_rep;
    end
    
    
    disp(['Loading data between ', num2str(datawindow_s(1)), 's and ', num2str(datawindow_s(2)), 's']);
    
    V=sread(HDR,datawindow_s(2)-datawindow_s(1),datawindow_s(1)+Data_start);
    V(:,N_elec+1:end)=[]; %remove extra channels in case reference was loaded too
    
    disp('----------------------');
    
    %for first time only - find the injecting electrodes - query if it isnt the
    %first line in the protocol. This is to allow for files where the biosemi
    %stopped recording and we carried on.
    
    if first ==1
        %take either the first injection or the first second
        
        tmp=SWW.InjectionSwitches(idx_f+1)-SWW.InjectionSwitches(idx_f);
        if tmp > Fs
            tmp=Fs;
        end
        
        tmpidx=SWW.InjectionSwitches(idx_f)-datawindow(1):SWW.InjectionSwitches(idx_f)-datawindow(1)+tmp;
        
        %estimate the injection pairs from the two largest RMS values
        [InjPairs, estimatebadness]=ScouseTom_EstimateInjPair(V(tmpidx,:));
        
        %get the injection pair from the protocol
        ProtPairs=Prot(1,:)';
        
        %if the estimation is OK then calculate automatically
        
        if estimatebadness == 0
            
            %if the injection channels match then crack on
            if all(sort(InjPairs)==sort(ProtPairs)) ==1
                disp('Data starts with first protocol line');
                lastprt=0; %this is already set above but being didactic
            else
                disp('Data DOES NOT start with first protocol line');
                
                %find matching protocl line
                start_poss=find(all([InjPairs(1)==Prot(:,1) InjPairs(2)==Prot(:,2)],2));
                disp(['Starting injection pair was found to be : ', num2str(start_poss)])
                disp('Data processing carrying on now...');
                
                lastprt=start_poss-1;
            end
            
        else
            %THIS IS TO FIX MY BUG IN SWITCHESSERIALV3 WHERE THE SWITCHES
            %WERE NOT SET UNTIL THE SECOND ITERATION
            %estimate is ambiguous so try the next injection
            
            disp('Result was ambiguous for first switch, trying the second one');
            
            
            % redo the whole thing but with the next injection
            tmp=SWW.InjectionSwitches(idx_f+2)-SWW.InjectionSwitches(idx_f+1);
            if tmp > Fs
                tmp=Fs;
            end
            
            tmpidx=SWW.InjectionSwitches(idx_f+1)-datawindow(1):SWW.InjectionSwitches(idx_f+1)-datawindow(1)+tmp;
            
            %estimate the injection pairs from the two largest RMS values
            [InjPairs, estimatebadness]=ScouseTom_EstimateInjPair(V(tmpidx,:));
            
            if estimatebadness == 0
                
                %if the injection channels match then crack on
                if all(sort(InjPairs)==sort(ProtPairs)) ==1
                    disp('Data starts with first protocol line');
                    lastprt=0; %this is already set above but being didactic
                else
                    disp('Data DOES NOT start with first protocol line');
                    
                    %find matching protocl line
                    start_poss=find(all([InjPairs(1)==Prot(:,1) InjPairs(2)==Prot(:,2)],2));
                    disp(['Starting injection pair was found to be : ', num2str(start_poss)])
                    disp('Data processing carrying on now...');
                    
                    lastprt=start_poss-1;
                end
                
            else
                
                %if it is still ambiguous - ask the user what to do
                msgbox('Starting injection pair is ambiguous! Please check the graph and enter manually','Uh Oh!');
                
                %plot the voltages for this swithc
                figure;
                plot(V(tmpidx,:));
                title('starting injection data - ambiguous injection');
                
                %ask them to input which protocol line this
                start_poss=input('Please enter the protocol line or leave empty to use best guess:');
                
                %is its empty just use best guess
                if isempty(start_poss)
                    disp('FINE! I will just use the possibly wrong guess then shall I?');
                    start_poss=find(all([InjPairs(1)==Prot(:,1) InjPairs(2)==Prot(:,2)],2));
                    
                    disp(['Starting injection pair was found to be : ', num2str(start_poss)'])
                    disp('Data processing carrying on now...');
                end
                lastprt=start_poss-1;
            end
            
        end
        
    end
    
    
    disp('----------------------');
    disp('Segmenting data');
    
    %next protocol line to use is one on from last one
    nextprt=lastprt+1;
    
    %segment this data between the complete protocol lines starting
    %from correct protocol line
    [Vseg, lastprt]=segment_ind(V,SWW.InjectionSwitches(idx_f:idx_l)-datawindow(1),0.0001,N_prt,N_elec,Fs,nextprt);
    
    % for the first time only - determine carrier frequency, filter coeffs,
    % samples to trim in demodulation
    
    if first ==1
        disp('----------------------');
        %using first injection, find the best filter coefficients
        [trim_demod,B,A,Fc]=ScouseTom_GetFilterTrim( Vseg(nextprt,:,Prot(nextprt,1),1),Fs,0 );
        disp('----------------------');
        info.B=B;
        info.A=A;
        info.trim_demod=trim_demod;
        info.Fc=Fc;
        %save to .mat file
        bigmat.info=info;
    end
    
    
    %     clear V
    
    %   If there are any left overs then stick them at the beginning
    
    
    if exist('Vsegleftover','var') ==1
        
        if size(Vseg,2) == size(Vsegleftover,2)
            Vseg(1:size(Vsegleftover,1),:,:,1)=Vsegleftover;
        else if size(Vseg,2) > size(Vsegleftover,2)
                Vseg(1:size(Vsegleftover,1),1:size(Vsegleftover,2),:,1)=Vsegleftover;
            else
                Vseg(1:size(Vsegleftover,1),:,:,1)=Vsegleftover(:,1:size(Vseg,2),:);
            end
        end
        
        clear Vsegleftover
    end
    
    
    %take the incomplete repeat and trim matrix
    if lastprt ~= N_prt && ndims(Vseg) == 4
        Vsegleftover=Vseg(1:lastprt,:,:,end);
        Vseg(:,:,:,end)=[];
    end
    
    %number of
    N_rep=size(Vseg,4);
    N_sample=size(Vseg,2);
    
    disp(['Number of complete repeats in chunk : ', num2str(N_rep)]);
    
    %demodulate data
    disp('Demodulating data');
    Vseg_demod=demod_seg2(Vseg,Fs,N_prt,N_elec,N_rep,B,A);
    
    disp('Getting Boundary Voltages');
    
    %get boundary voltages by taking mean
    [BV, STD]=seg2BV(Vseg_demod,trim_demod);
    %     clear V_seg_demod
    
    Z=nan(N_elec,N_rep);
    Zstd=nan(size(Z));
    %get contact impedance values from BV
    for iElec=1:N_elec
        
        if all(isnan(Elec_inj(iElec,:)))
            Z(iElec,:)=nan;
            Zst(iElec,:)=nan;
        else
            
            Z(iElec,:)=ZSF*nanmean(BV(Elec_inj(iElec,~isnan(Elec_inj(iElec,:))),:),1);
            Zstd(iElec,:)=ZSF*nanstd(BV(Elec_inj(iElec,~isnan(Elec_inj(iElec,:))),:),1);
        end
    end
    
    %save them
    bigmat.BV(1:size(BV,1),start_rep:start_rep+N_rep-1)=BV;
    bigmat.STD(1:size(STD,1),start_rep:start_rep+N_rep-1)=STD;
    bigmat.Z(1:size(Z,1),start_rep:start_rep+N_rep-1)=Z;
    bigmat.Zstd(1:size(Zstd,1),start_rep:start_rep+N_rep-1)=Zstd;
    
    
    %get noise for kdawgs correction - from up to the the middle samples 1000 after trim demod of the
    %second repeat (not using first as we get those spikes sometimes which
    %fuck things up)
    if first ==1
        
        samp_est=(N_sample-trim_demod)-trim_demod;
        if samp_est > 1000
            samp_est = 1000;
        end
        
        est_f=fix((N_sample/2) - (samp_est/2));
        
        %which repeat to use for noiseest? if there is more than 1 repeat
        %then use the second
        
        if N_rep >1
            noiserep=2;
        else
            noiserep=1;
        end
        
        
        noiseest=getnoise_k(squeeze(Vseg_demod(:,est_f:est_f+samp_est-1,:,noiserep)));
        bigmat.noiseest=noiseest;
    end
    
    %     clear BV STD
    
    disp(['Finished processing data between ', num2str(datawindow_s(1)), 's and ', num2str(datawindow_s(2)), 's']);
    
    %calculate the percentage complete
    percent_complete=100*(datawindow_s(2)/Data_max);
    
    if percent_complete >100
        percent_complete=100;
    end
    
    %display it visually
    winlength=40;
    decdone=floor(percent_complete/(100/winlength));
    percentind=repmat('.',1,winlength);
    percentind(1:decdone-1)=repmat('-',1,decdone-1);
    if decdone >0
        percentind(decdone)='>';
    end
    
    disp(percentind);
    fprintf('%.1f %% complete\r',percent_complete);
    
    
    
    %calculate new datablock
    
    if finished ==0
        
        %data window starts in second which includes next switch
        datawindow_s(1)=floor(SWW.InjectionSwitches(next_sw)/Fs)-Data_start;
        %data window ends at next chunk
        datawindow_s(2)=datawindow_s(2)+chunk_time;
        
        if datawindow_s(2) >= Data_end
            datawindow_s(2) = Data_end;
        end
        
    end
    
    %this is no longer the first iteration!
    if first == 1
        first =0;
    end
    
    
end



disp('All processing finished! At f--ing last!');
teatime=toc(tstart);
fprintf('That took : %.1f seconds \r',teatime);

BV=bigmat.BV;

%% calc mean of recordings and remove bad ones

%bad recodring threshold in num std devs
bad_thres=3;

%chan thres - percentages of channels that need to be bad to remove that
%recording
num_thres=0.25;



BVtemp=BV;

bvs=std(BVtemp,0,2); % get STD of recordings
bvm=mean(BVtemp,2);
bve=abs(BVtemp(:,:)-repmat(bvm,1,size(BVtemp,2))); %error from mean

bvesc=bve./repmat(bvs,1,size(BVtemp,2)); %as number of standard devs

Badness=(bvesc >bad_thres); % above threshold?

rem_idx=[];
for i=1:size(BVtemp,2)
    if nnz(Badness(:,i)) > size(BVtemp,1)*num_thres
        rem_idx=[rem_idx i];
    end
end

if ~isempty(rem_idx)
    disp([ num2str(length(rem_idx)) ' of ' num2str(size(BV,2)) ' recordings removed from average']);
    BVtemp(:,rem_idx)=[];
end

BVave=mean(BVtemp,2);

bigmat.BVave=BVave;




end


function [ noiseout ] = getnoise_k( Vin )
%getnoise_k gets the noise on each combination for kirills corrections
%   uses the first <=500 samples from the noise and calculates the differnce
%   from the mean in that combination. Vin is Prt x sample x chn

N_prt=size(Vin,1);
N_elec=size(Vin,3);
N_sample=size(Vin,2);
noiseout=nan(N_prt*N_elec,N_sample);
V=nan(size(noiseout));

%reshape into full prt x sample
for iPrt =1:N_prt
    idx=((iPrt-1)*N_elec) +1;
    V(idx:idx+N_elec-1,:)=squeeze(Vin(iPrt,1:N_sample,:))';
end

for iComb=1:size(V,1)
    noiseout(iComb,:)=V(iComb,:)-mean(V(iComb,:));
end




end
