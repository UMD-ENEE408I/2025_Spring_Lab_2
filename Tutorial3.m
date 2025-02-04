[y, Fs] = audioread("Cafe_with_noise.wav");
t = linspace(0, length(y)/Fs, length(y))';
plot(t, y)
win = hann(100, 'periodic');
[S, F, T] = stft(y, Fs, "Window", win);
smag = mag2db(abs(S));
pcolor(seconds(T),F,smag)
xlabel('Time (s)')
ylabel('Frequency (Hz)')
shading flat
colorbar
clim(max(smag(:)) + [-60 0])