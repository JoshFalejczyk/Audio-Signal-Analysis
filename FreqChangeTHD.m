%   Filename:       FreqChangeTHD.m
%   Author:         Josh Falejczyk
%   Date:           April 24, 2020
%   Version:        1.0
%   Description:
%       A script that displays the concept of Total Harmonic Distortion and
%       its application to this research.  The various distortion samples
%       I've gathered across all pedals can be analyzed in one spot here
%       with this metric on distortion.
%
%       This script is based off the MATLAB examples provided at:
%       https://www.mathworks.com/help/matlab/ref/fft.html
%
%       Generated Figures:
%       Figures 1:N - Fast-Fourier Transforms on frequency domains for each 
%       audio signal analyzed, which allows for visual comparison, 
%       N = (# of samples) / 2, N will vary based on how many samples were 
%       taken per pedal.
%       Figure N + 1 - THD analysis in the context of both computed THD,
%       and difference in THD from base dry sample.  The latter would be a
%       better metric of distortion analysis as THD itself varies with the
%       number of peaks that are observed.

% Setup of Sample 1
[y,fs] = audioread('E Power Chord Dry.wav');
ydft1 = fft(y);
% FFT Vector (Y Axis)
ydft1 = ydft1(1:length(y)/2+1);
% Frequency Vector (X Axis)
freq = fs*(0:length(y)/2)/(length(y));
% Resize for range of frequencies observed
freq = freq(1:1:2500);
ydft1 = ydft1(1:1:2500);
% Plot Sample 1 FFT
figure(1)
subplot(2, 1, 1);
% Ignore negative y-values
plot(freq,abs(ydft1));
% Manually set voltage/amplitude y-limit
ylim([0 1550]); 
title('Fast-Fourier Transform of Dry E Power Chord');
xlabel('Frequency (Hz)');
ylabel('Voltage (mV)');

% Setup of Sample 2
[y,fs] = audioread('E Power Chord D25 T0 L50.wav');
ydft2 = fft(y);
% FFT Vector (Y Axis)
ydft2 = ydft2(1:length(y)/2+1);
% Frequency Vector (X Axis)
freq = fs*(0:length(y)/2)/(length(y));
% Resize for range of frequencies observed
freq = freq(1:1:2500);
ydft2 = ydft2(1:1:2500);
% Plot Sample 2 FFT
subplot(2, 1, 2);
% Ignore negative y-values
plot(freq,abs(ydft2));
% Set voltage/amplitude y-limit
ylim([0 1550]);
% Title varies based on specific effect tested
title('Fast-Fourier Transform of E Note 25% Distortion');
xlabel('Frequency (Hz)');
ylabel('Voltage (mV)');

% Setup of Sample 3
[y,fs] = audioread('E Power Chord D50 T0 L50.wav');
ydft2 = fft(y);
% FFT Vector (Y Axis)
ydft2 = ydft2(1:length(y)/2+1);
% Frequency Vector (X Axis)
freq = fs*(0:length(y)/2)/(length(y));
% Resize for range of frequencies observed
freq = freq(1:1:2500);
ydft2 = ydft2(1:1:2500);
% Plot Sample 3 FFT
figure (2)
subplot(2, 1, 1);
% Ignore negative y-values
plot(freq,abs(ydft2));
% Set voltage/amplitude y-limit
ylim([0 1550]);
% Title varies based on specific effect tested
title('Fast-Fourier Transform of E Note 50% Distortion');
xlabel('Frequency (Hz)');
ylabel('Voltage (mV)');

% Setup of Sample 4
[y,fs] = audioread('E Power Chord D100 T0 L50.wav');
ydft2 = fft(y);
% FFT Vector (Y Axis)
ydft2 = ydft2(1:length(y)/2+1);
% Frequency Vector (X Axis)
freq = fs*(0:length(y)/2)/(length(y));
% Resize for range of frequencies observed
freq = freq(1:1:2500);
ydft2 = ydft2(1:1:2500);
% Plot Sample 4 FFT
figure (2)
subplot(2, 1, 2);
% Ignore negative y-values
plot(freq,abs(ydft2));
% Set voltage/amplitude y-limit
ylim([0 1550]);
% Title varies based on specific effect tested
title('Fast-Fourier Transform of E Note 100% Distortion');
xlabel('Frequency (Hz)');
ylabel('Voltage (mV)');

% Signal 1 peaks
max = [158.1, 100.8, 170.9, 137.2, 261.4, 130.2, 97.95, 130.6, 47.23, 58.36, 15.75, 48.54];
% Signal 2 peaks
max(2, :) = [146.5, 349.6, 391, 610.2, 373, 328.2, 511.6, 353.8, 188.1, 206.3, 73.45, 225.5];
% Signal 3 peaks
max(3, :) = [332.4, 591.2, 1197, 772.3, 830.3, 761.4, 456, 918.1, 443.3, 524, 184.9, 334.7];
% Signal 4 peaks
max(4, :) = [456.8, 968.9, 1455, 1210, 620, 764.4, 1229, 897, 446, 695.8, 163.5, 467];
THD = zeros(1, 4);
for i = 1:4
    
    % Compute THD
    THD(i) = sqrt(sum(max(i, :).^2)) / max(i, 1);
    
end
% Plot THD
figure(3)
subplot(2, 1, 1)
plot([0, 25, 50, 100], THD);
xlim([0, 100]);
ylim([0 8.5]);
xticks([0, 25, 50, 100]);
title('Total Harmonic Distortion');
xlabel('Level of Distortion (% of Distortion Pot kOhm Value)');
ylabel('THD (unitless)');

THDDiff = zeros(1, 3);
for i = 1:3
    
    % Compute difference in THD from base dry sample
    THDDiff(i) = abs(THD(1) - THD(i + 1));
    
end
% Plot THD Difference
subplot(2, 1, 2);
plot([25, 50, 100], THDDiff);
xlim([25, 100]);
xticks([25, 50, 100]);
title('Difference in Total Harmonic Distortion from Base Signal');
xlabel('Level of Distortion (% of Distortion Pot kOhm Value)');
ylabel('THD (unitless)');