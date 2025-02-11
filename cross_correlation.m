
% Read audio files
[X, Fsx] = audioread("M1.wav");
[Y, Fsy] = audioread("M3.wav");

% Compute the cross-correlation
Rxy = xcorr(X, Y);

% Generate the time axis for the cross-correlation, converting lag indices to time (seconds)
time = (-length(X)+1:length(X)-1)/Fsx;

% Plot
plot(time, Rxy);
title('Cross-Correlation vs. Time');
xlabel('Time Lag (seconds)');
ylabel('xCorrelation');
grid on;

function cross_corr = xcorr(x, y)
    N = length(x);
    M = length(y);
    max_lag = N + M - 1;  % Length of cross-correlation output

    % Zero-padding x to handle shifts
    x_padded = [zeros(1, M-1), x', zeros(1, M-1)];
    cross_corr = zeros(1, max_lag);

    % Compute cross-correlation
    for i = 1:max_lag
        sum_value = 0;
        for j = 1:M
            sum_value = sum_value + x_padded(i + j - 1) * y(M - j + 1);
        end
        cross_corr(i) = sum_value;
    end
end
