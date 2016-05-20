SNR =nan(29,19);
freq = 3000:500:12000;



Fs=100000;
N_bin = round(T_window*Fs);
w = (1:N_bin)-round(N_bin*0.5);    % window around trigger
T = 1e3*w/Fs;

for i = [4,9,12,25,16,7,22]
    for j = 1:length(EIT)
        sig = EIT{j}.dZ_avg(:,i);
        val = min(sig(T>0.5 & T<2));
        noise = std(sig(T<-1));
        if noise<10
            SNR(i,j) = val/noise;
        else
            SNR(i,j) = NaN;
        end
    end
end
[b,a] = butter(1,1/3);
ave = abs((nanmean(SNR)));
%figure; 
plot(freq,ave,'--ok')
ss = nanstd(SNR)/sqrt(7);
hold on
plot ([freq;freq], [ave-ss;ave+ss],'' );
ylim([0,20]);

xlabel('frequency, Hz');
ylabel('SNR, SD');