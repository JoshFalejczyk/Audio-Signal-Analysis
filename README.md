# Audio-Signal-Analysis

This repository holds the various Matlab scripts I wrote and used in Spring 2020 for my undergraduate research work with the University of Alabama's Electrical Engineering Department.  The undergrad research essentially stayed true to its initial proposition of being an explorative dive into the frequencies behind audio signals generated by electric guitar effects mechanisms called pedals.  However along the way, my small knowledge of research in electrical engineering and audio signal processing increased significantly in comparison to where I started, and many of the methods of analysis I learned are now represented in these Matlab scripts.  

Functionality:
1. Performing a Fast-Fourier Transform on an audio signal and plotting it (FFT.m).
2. Comparing the frequency harmonic peak-to-peak relationship in a FFT of an audio signal (FreqChangePeaks.m).
3. Displaying the effects of various types of filters on audio signal frequencies through FFT's (FilterFFT.m).
4. Comparing audio signals at varying stages of distortion and plotting Total Harmonic Distortion from these samples (FreqChangeTHD.m).

To Run:
1. These scripts can be downloaded and ran just like any other Matlab script, however you must supply your own audio files and some FFT configurations (like frequency range) or transfer functions (in FilterFFT.m) may have to be manually adjusted.

Credit:
1. FFT.m, FreqChangePeaks.m, FreqChangeTHD.m, and the skeleton of FilterFFT.m were written by myself.
2. The transfer functions and much of the actual filter work in FilterFFT.m was written by one of my fellow students in the research lab, Shelby Critcher.
3. I would also like to accredit both my sponsoring professor, Dr. Todd Freeborn, and Shelby Critcher for their help and support throughout this research.
