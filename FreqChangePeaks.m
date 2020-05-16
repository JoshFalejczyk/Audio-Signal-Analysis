%   Filename:       FreqChangePeaks.m
%   Author:         Josh Falejczyk
%   Date:           March 30, 2020
%   Version:        1.0
%   Description:
%       A script that performs FFT's on two audio signals (each an average 
%       of 3 samples), displays both FFT's for visual comparison, then
%       plots the difference in frequency peaks in both a ratio and
%       percentage manner.
%
%       NOTE: This script was largely used for testing external variables
%       early on in the research, hence the names of the files last read
%       in for analysis.
%
%       This script is based off the MATLAB examples provided at:
%       https://www.mathworks.com/help/matlab/ref/fft.html
%
%       Generated Figures:
%       Figure 1 - Fast-Fourier Transforms on frequency domains for each 
%       audio signal analyzed
%       Figure 2 - Representations of the change in frequencies peak-to-
%       peak.  The first plot shows this as a unitless difference in peak-
%       to-peak ratios, and the second is a conversion of this data to
%       percent difference

% Set up sample 1a
[y1a,fs1a] = audioread('E Note Dry.wav');
ydft1a = fft(y1a);
% FFT Vector (Y Axis)
ydft1a = ydft1a(1:length(y1a)/2+1);
% Frequency Vector (X Axis)
freq1a = fs1a*(0:length(y1a)/2)/(length(y1a));
% Resize for range of frequencies observed
freq1a = freq1a(1:1:2500);
ydft1a = ydft1a(1:1:2500);

% Set up sample 1b
%[y1b,fs1b] = audioread('Soft E Note 2.wav');
%ydft1b = fft(y1b);
% FFT Vector (Y Axis)
%ydft1b = ydft1b(1:length(y1b)/2+1);
% Frequency Vector (X Axis)
%freq1b = fs1b*(0:length(y1b)/2)/(length(y1b));
% Resize for range of frequencies observed
%freq1b = freq1b(1:1:2500);
%ydft1b = ydft1b(1:1:2500);

% Set up sample 1c
%[y1c,fs1c] = audioread('Soft E Note 3.wav');
%ydft1c = fft(y1c);
% FFT Vector (Y Axis)
%ydft1c = ydft1c(1:length(y1c)/2+1);
% Frequency Vector (X Axis)
%freq1c = fs1c*(0:length(y1c)/2)/(length(y1c));
% Resize for range of frequencies observed
%freq1c = freq1c(1:1:2500);
%ydft1c = ydft1c(1:1:2500);

% Take averages for consolidated Sample 1
%freq1 = (freq1a + freq1b + freq1c) / 3;
%ydft1 = (ydft1a + ydft1b + ydft1c) / 3;
% Plot first FFT (Sample 1)
figure(1)
subplot(2, 1, 1);
% Ignore negative y-values
plot(freq1a,abs(ydft1a));
ylim([0 3250]);
title('Fast-Fourier Transform of Dry E Note');
xlabel('Frequency (Hz)');
ylabel('Voltage (mV)');

% Set up sample 2a
[y2a,fs2a] = audioread('E Note D100 F0 V50.wav');
ydft2a = fft(y2a);
% FFT Vector (Y Axis)
ydft2a = ydft2a(1:length(y2a)/2+1);
% Frequency Vector (X Axis)
freq2a = fs2a*(0:length(y2a)/2)/(length(y2a));
% Resize for range of frequencies observed
freq2a = freq2a(1:1:2500);
ydft2a = ydft2a(1:1:2500);

% Set up sample 2b
%[y2b,fs2b] = audioread('Strong E Note 2.wav');
%ydft2b = fft(y2b);
% FFT Vector (Y Axis)
%ydft2b = ydft2b(1:length(y2b)/2+1);
% Frequency Vector (X Axis)
%freq2b = fs2b*(0:length(y2b)/2)/(length(y2b));
% Resize for range of frequencies observed
%freq2b = freq2b(1:1:2500);
%ydft2b = ydft2b(1:1:2500);

% Set up sample 2c
%[y2c,fs2c] = audioread('Strong E Note 3.wav');
%ydft2c = fft(y2c);
% FFT Vector (Y Axis)
%ydft2c = ydft2c(1:length(y2c)/2+1);
% Frequency Vector (X Axis)
%freq2c = fs2c*(0:length(y2c)/2)/(length(y2c));
% Resize for range of frequencies observed
%freq2c = freq2c(1:1:2500);
%ydft2c = ydft2c(1:1:2500);

% Take averages for consolidated Sample 2
%freq2 = (freq2a + freq2b + freq2c) / 3;
%ydft2 = (ydft2a + ydft2b + ydft2c) / 3;
% Plot second FFT (Sample 2)
subplot(2, 1, 2);
% Ignore negative y-values
plot(freq2a,abs(ydft2a));
ylim([0 3250]);
title('Fast-Fourier Transform of E Note 100% Distortion');
xlabel('Frequency (Hz)');
ylabel('Voltage (mV)');

% NOTE: The peaks here below were measured manually as I ran into issues
% with Matlab's findPeaks() function (it was not as accurate with the 
% complex numbers of the plot's y-values/fft output)

% Signal 1 peaks
max1 = [376.5, 867.9, 414.8, 397.3, 377.9, 206.1, 130.7, 69.99, 25.78];
% Signal 2 peaks
max2 = [937.8, 1801, 1182, 1127, 1598, 810.5, 566.7, 230.3, 161.9];
maxratio1 = zeros(1, 8);
maxratio2 = zeros(1, 8);
% Take ratios from peak to peak for each Sample to display standardized 
% change in frequency
for i = 1:8
   
   maxratio1(i) = max1(i) / max1(i + 1); % Sample 1's ratios
   maxratio2(i) = max2(i) / max2(i + 1); % Sample 2's ratios
    
end
% Compute difference in ratios (difference in inter-harmonic relationship)
maxdiff = maxratio2 - maxratio1;
% Each value of xaxis represents the ratio between a peak
xaxis = [1, 2, 3, 4, 5, 6, 7, 8];
% Plot difference in peak ratios
figure(2)
subplot(2, 1, 1);
plot(xaxis, maxdiff, 'o', 'markerfacecolor', 'red', 'markeredgecolor', 'black');
title('Difference In Comparative Voltage Peak Ratios');
xlabel('Ratio (Peak to Peak)');
ylabel('Quantity (Unitless)');

% Convert peak ratio difference to a percent change
maxpercent = (maxdiff ./ maxratio1) .* 100;
% Plot percent difference of peak ratios
subplot(2, 1, 2);
plot(xaxis, maxpercent, 'o', 'markerfacecolor', 'red', 'markeredgecolor', 'black');
title('Percent Difference In Comparative Voltage Peak Ratios');
xlabel('Ratio (Peak to Peak)');
ylabel('Percentage (%)');