%   Filename:       FFT.m
%   Author:         Josh Falejczyk
%   Date:           March 30, 2020
%   Version:        1.0
%   Description:
%       A script that displays the simple functionality of Fast-Fourier
%       Transforms and their application to this research.  It takes audio
%       signals within the typical time domain we commonly understand, and
%       highlights the individual frequencies' amplification and influence
%       within the signals.
%
%       NOTE: This script in particular has no specialized use for one
%       area of the research, but was rather used as a foundation for
%       general FFT testing.
%
%       This script is based off the MATLAB examples provided at:
%       https://www.mathworks.com/help/matlab/ref/fft.html
%
%       Generated Figures:
%       Figure 1 - Fast-Fourier Transforms on frequency domains for each 
%       audio signal analyzed, which allows for visual comparison

% Setup of Sample 1
[y,fs] = audioread('E Note 1.wav');
ydft1 = fft(y);
% FFT Vector (Y Axis)
ydft1 = ydft1(1:length(y)/2+1);
% Frequency Vector (X Axis)
freq = fs*(0:length(y)/2)/(length(y));
% Resize for range of frequencies observed
freq = freq(1:1:5000);
ydft1 = ydft1(1:1:5000);
% Plot Sample 1 FFT
subplot(3, 1, 1);
% Ignore negative y-values
plot(freq,abs(ydft1));
% Manually set voltage/amplitude y-limit
ylim([0 425]); 
title('Fast-Fourier Transform of E Note 1st Iteration');
xlabel('Frequency (Hz)');
ylabel('Voltage (mV)');

% Setup of Sample 2
[y,fs] = audioread('E Note 2.wav');
ydft2 = fft(y);
% FFT Vector (Y Axis)
ydft2 = ydft2(1:length(y)/2+1);
% Frequency Vector (X Axis)
freq = fs*(0:length(y)/2)/(length(y));
% Resize for range of frequencies observed
freq = freq(1:1:2777);
ydft2 = ydft2(1:1:2777);
% Plot Sample 2 FFT
subplot(3, 1, 2);
% Ignore negative y-values
plot(freq,abs(ydft2));
% Set voltage/amplitude y-limit
ylim([0 425]);
% Title varies based on specific effect tested
title('Fast-Fourier Transform of E Note 2nd Iteration');
xlabel('Frequency (Hz)');
ylabel('Voltage (mV)');

% Setup of Sample 2
[y,fs] = audioread('E Note 5.wav');
ydft2 = fft(y);
% FFT Vector (Y Axis)
ydft2 = ydft2(1:length(y)/2+1);
% Frequency Vector (X Axis)
freq = fs*(0:length(y)/2)/(length(y));
% Resize for range of frequencies observed
freq = freq(1:1:2777);
ydft2 = ydft2(1:1:2777);
% Plot Sample 2 FFT
subplot(3, 1, 3);
% Ignore negative y-values
plot(freq,abs(ydft2));
% Set voltage/amplitude y-limit
ylim([0 425]);
% Title varies based on specific effect tested
title('Fast-Fourier Transform of E Note 5th Iteration');
xlabel('Frequency (Hz)');
ylabel('Voltage (mV)');