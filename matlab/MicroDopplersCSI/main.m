close all 
clear 
clc 
%% Add the super directory path
addpath('../')
%$ Read the CSI raw data 
CTFs = read_CSI();

%% Choose the indices you want to apply the calibration on
numerator = 1;
denominator = 3;

%$ Apply data calibration
CTF_calibrated = calibrate_CTF(CTFs, numerator, denominator);

%% Option 1 take the sum over the frequencies
mu_t_1 = sum(CTF_calibrated);

%$ Option 2 apply the PCA and take the first component
mu_t_2 = pca(CTF_calibrated);
mu_t_2 = mu_t_2(1,:);

%% Apply high pass fitering
dt = 1e-3; % This parameter depends on the measurement setup
a = designfilt('highpassfir', 'StopbandFrequency', 0.1, 'PassbandFrequency', 1, 'StopbandAttenuation', 25, 'PassbandRipple', 0.01, 'SampleRate', 1/dt, 'DesignMethod', 'equiripple');

%% Design the spectrogram window
sigma_W = 0.020; % the window spread parameter
window = (1/(sqrt(sigma_W)*pi^0.25))*exp(-(t-5).^2/(2*sigma_W^2)); % spectrogram window
plotting(1:length(window), window, ' ', ' ', 'Samples', 'The window function $h(t)$')

%% Compute the spectrogram
window_start_idx = 2300; % the window start index
window_end_idx = 2700; % the window end index
% The parameters mentioned above should be decided by you. This is just an example

Mf = 256; % number of the frequency bins of the spectrogram
[STFT, f, t1] = spectrogram(mu_t_1, window(window_start_idx:window_end_idx), window_end_idx-window_start_idx,Mf, 1/(t(10)-t(9)),'centered','yaxis');
Sxx_1 = abs(STFT).^2;% Spectrogram of mu_t_1
[STFT, f, t1] = spectrogram(mu_t_2, window(window_start_idx:window_end_idx), window_end_idx-window_start_idx,Mf, 1/(t(10)-t(9)),'centered','yaxis');
Sxx_2 = abs(STFT).^2; % Spectrogram of mu_t_2

%% Plot the Sxx_1 and Sxx_2 for comparison
surfing(t1, f, Sxx_1, 'Time, t~(s)', 'Frequency, f~(Hz)', 'hot')
surfing(t1, f, Sxx_2, 'Time, t~(s)', 'Frequency, f~(Hz)', 'hot')