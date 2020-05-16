%   Filename:       FilterFFT.m
%   Authors:        Josh Falejczyk, Shelby Critcher
%   Date:           April 9, 2020
%   Version:        1.0
%   Description:
%       A script that displays a Fast-Fourier Transform plot for both a dry
%       and a processed (effect) audio signal, with filter analysis applied
%       to display pedal filter controls.
% 
%       NOTE: This is the script currently used in the research for
%       analysis in pedals/effects testing.
%
%       This script is based off the MATLAB examples provided at:
%       https://www.mathworks.com/help/matlab/ref/fft.html
%
%       Generated Figures:
%       Figure 1 - Fast-Fourier Transforms on frequency domains for each 
%       audio signal analyzed (in blue), with filter analysis added (in
%       red).

% Setup of dry signal
[y,fs] = audioread('E Power Chord Dry.wav');
ydft1 = fft(y);
% FFT Vector (Y Axis)
ydft1 = ydft1(1:length(y)/2+1);
% Frequency Vector (X Axis)
freq = fs*(0:length(y)/2)/(length(y));
% Resize for range of frequencies observed
freq = freq(1:1:7500);
ydft1 = ydft1(1:1:7500);
% Transfer function Calculation (filter)
% R value for case 1
R1 = 1.5*10^3;
% R value for case 2
R2 = 101.5*10^3;
% C value
C = 3.3*10^(-9);
% Angular frequency
w = 2*pi*freq;
% Transfer function 1 - when fc~32kHz
HF1 = 1./(1*i*w*C*R1+1);
% Transfer function 2 - when fc~475Hz
HF2 = 1./(1*i*w*C*R2+1);
% Plot dry FFT
subplot(2, 1, 1);
% Ignore negative y-values
yyaxis left
plot(freq,abs(ydft1));
% Manually set voltage/amplitude y-limit
ylim([0 2000]);
yyaxis right
plot(freq,abs(HF1));
title('Fast-Fourier Transform of Dry E Power Chord');
xlabel('Frequency (Hz)');
yyaxis left
ylabel('Voltage (mV)');
yyaxis right
ylabel('Filter Cutoff ~32kHz (Impedance \Omega)');

% Setup of processed (effect) signal
[y,fs] = audioread('E Power Chord D0 T100 L50.wav');
ydft2 = fft(y);
% FFT Vector (Y Axis)
ydft2 = ydft2(1:length(y)/2+1);
% Frequency Vector (X Axis)
freq = fs*(0:length(y)/2)/(length(y));
% Resize for range of frequencies observed
freq = freq(1:1:7500);
ydft2 = ydft2(1:1:7500);
% Plot processed FFT
subplot(2, 1, 2);
% Ignore negative y-values
yyaxis left
plot(freq,abs(ydft2));
% Manually set voltage/amplitude y-limit
ylim([0 2000]);
yyaxis right
plot(freq,abs(HF2));
% Title varies based on specific effect tested
title('Fast-Fourier Transform of E Note 25% Distortion 100% Filter');
xlabel('Frequency (Hz)');
yyaxis left
ylabel('Voltage (mV)');
yyaxis right
ylabel('Filter Cutoff ~475Hz (Impedance \Omega)');