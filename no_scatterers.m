% Case: Base Station (BS) and Mobile Station (MS) with Line of Sight (LOS)
clear; % Clear the workspace
close all; % Close all figure windows

% Parameters
fc = 2000; % Carrier frequency in Hz
F = 16; % Number of samples per wavelength (for spatial sampling)
V = 10; % Velocity of the mobile station in m/s
dBs = 1000; % Distance from the base station to the mobile station in meters
alpha = 0; % Angle of movement in degrees (0 degrees means moving directly along the x-axis)

% Base Station (BS) coordinates
BSx = -dBs; % x-coordinate of the base station
BSy = 0; % y-coordinate of the base station

% Wave parameters
lambdac = 300 / fc; % Wavelength in meters (using speed of light)
Nsamples = 100; % Number of samples to simulate

% Calculate spatial sampling distance and time step
Dx = lambdac / F; % Spatial sampling distance (distance between samples)
ts = Dx / V; % Time step based on velocity and spatial sampling distance

kc = 2 * pi / lambdac; % Wave number (2*pi divided by wavelength)

% Time and distance axes for simulation
timeaxis = 0:ts:Nsamples*ts-ts; % Time axis for Nsamples points
disaxis = 0:Dx:Nsamples*Dx; % Distance axis for Nsamples points

% Mobile Station (MS) trajectory calculations for initial angle alpha=0
MSx = V .* timeaxis .* cosd(alpha); % x-coordinates of the mobile station over time
MSy = V .* timeaxis .* sind(alpha); % y-coordinates of the mobile station over time

% Calculate distance from Base Station to Mobile Station
distBSMS = sqrt((BSx - MSx).^2 + (BSy - MSy).^2); % Distance from BS to MS

% Ray propagation calculation for LOS signal
r = exp(-1j * kc * distBSMS); % Received signal based on LOS path

% FFT parameters for frequency domain analysis
NFFT = 2.^10; % Number of points for FFT (1024)
fs = 1 / ts; % Sampling frequency based on time step

% Frequency axis for plotting FFT results
f = -fs/2:fs/NFFT:fs/2-fs/NFFT;

% Perform FFT and shift zero frequency component to center for better visualization
yy = fftshift(fft(r, NFFT) / NFFT);

% Normalize the amplitude of the FFT result
yN = yy ./ max(yy);

% Plot results in frequency domain for initial angle alpha=0
figure;
plot(f, abs(yN)); % Plot normalized magnitude spectrum of received signal in frequency domain
title('Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Normalized Amplitude');

%% Analyze different angles:
close all; % Close all previous figures

alpha = [45, 90, 135, 180]; % Define an array of angles to analyze
figure;

for i = 1:length(alpha) 
    % Mobile Station (MS) trajectory calculations for each angle in alpha array
    MSx = V .* timeaxis .* cosd(alpha(i)); % x-coordinates of the mobile station over time at angle alpha(i)
    MSy = V .* timeaxis .* sind(alpha(i)); % y-coordinates of the mobile station over time at angle alpha(i)

    % Calculate distance from Base Station to Mobile Station for current angle
    distBSMS = sqrt((BSx - MSx).^2 + (BSy - MSy).^2); % Distance from BS to MS

    % Ray propagation calculation for LOS signal at current angle
    r = exp(-1j * kc * distBSMS); % Received signal based on LOS path at current angle

    % Perform FFT and shift zero frequency component to center for better visualization
    yy = fftshift(fft(r, NFFT) / NFFT);
    
    % Normalize the amplitude of the FFT result for current angle
    yN = yy ./ max(yy);
    
    % Create subplot for each angle's frequency response
    subplot(2, 2, i);
    plot(f, abs(yN)); % Plot normalized magnitude spectrum of received signal in frequency domain
    title(['\alpha=', num2str(alpha(i)), '°']); % Title indicating the angle in degrees
    xlabel('Frequency (Hz)');
    ylabel('Normalized Amplitude'); 
end