function [  ] = CSScrolltext(CurrentSource, scrolltext,window,varargin )
%Scrolltext Scrolls longer string of text to either top or bottom window of
%Keithley Current Source
%   Inputs:
%   scrolltext - text to display
%   window - top(1) or bottom(2) window
%   speed(optional) - seconds to pause between updates. default 0.02

if window ==1
    ss=20;
elseif window ==2
    ss=30;
end

if isempty(varargin) ==1
    pp=0.02;
end

sendtxt=repmat(' ',1,ss);
scrolltext=[scrolltext, sendtxt];


for ii=1:length(scrolltext)
    sendtxt(1:end-1)=sendtxt(2:end);
    sendtxt(end)=scrolltext(ii);
if window ==1
    fprintf(CurrentSource,['DISP:TEXT "', sendtxt ,'"']);
else
        
    fprintf(CurrentSource,['DISP:WIND2:TEXT "', sendtxt ,'"']);
end
    pause(pp)
end

end

