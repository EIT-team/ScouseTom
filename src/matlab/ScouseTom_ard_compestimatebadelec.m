function [ BadElecs ] = ScouseTom_ard_compestimatebadelec( BadArray,Protocol )
%SCOUSETOM_ARD_COMPESTIMATEBADELEC Estimate which electodes are bad from
%array of compliance status - from  ard_complianceprocess. If an electrode
%is bad every time it is used then it is flagged as bad. There may be
%smarter ways of doing this....
%   Detailed explanation goes here

%% Check the inputs here
%i cant remember if the output is a logical or not
BadArray=logical(BadArray);

if ~(any(BadArray))
    %return nothing is none are bad
    
    BadElecs =[];
    return
end

%Find electrodes used
AllElec=unique(Protocol(:));
ElecCount=histc(Protocol(:),AllElec);



%% Find the injections belonging to bad compliances

%take only the protocol lines with bad compliance
BadProtLines=Protocol(BadArray,:);

%make all onecolumn
BadProtLines=BadProtLines(:);
%find the unique values
PossBadElecs=unique(BadProtLines);
[~,ElecIdx]=ismember(PossBadElecs,AllElec);
%find the number of times
BadCount=histc(BadProtLines,PossBadElecs);

% if the number of times it is bad is three quarters of the number of times it is used then
% it is bad 

BadElecs=PossBadElecs((BadCount >= 0.75*ElecCount(ElecIdx)));



end

