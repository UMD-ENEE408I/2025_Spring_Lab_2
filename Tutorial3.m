%% Loading an audio file
[y, Fs] = audioread("Cafe_with_noise.wav"); % Read the audio file and store the signal in 'y' and sampling rate in 'Fs'
t = linspace(0, length(y)/Fs, length(y))'; % Generate a time vector corresponding to the the sampling rate of the signal
plot(t, y) % Plot the waveform in the time domain

%% Short time Fourier Transform using Hann window of length 100
win = hann(100, 'periodic'); 
[S, F, T] = stft(y, Fs, "Window", win);
smag = mag2db(abs(S)); % Convert the magnitude of STFT to decibels

% Plot
pcolor(seconds(T), F, smag) 
xlabel('Time (s)') 
ylabel('Frequency (Hz)') 
shading flat 
colorbar 
clim(max(smag(:)) + [-60 0]) 
