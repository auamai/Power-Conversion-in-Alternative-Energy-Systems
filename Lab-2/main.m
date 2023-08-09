clear;
ratedPower = 2*10^6; % VA
ratedOutputVoltage = 2300; % V
ratedOutputFrequency = 60; % Hz

dcInputVoltage = 0;

powerFactor = 0.9;


ma = 0.25;
f1 = 60;
fcr = 720;

fcr2 = 4320;

Ts_ls = 1/fcr2;

%A.1 DC Link Voltage Calculation
E = ratedOutputVoltage/3;

%A.2 Load Resistance and Inductance Calculation

% Step 1: Calculate peak line-to-line voltage
Vp = ratedOutputVoltage * sqrt(2);

% Step 2: Calculate peak phase voltage
Vph = Vp / sqrt(3);

% Step 3: Calculate load current
I = ratedPower / (Vph * sqrt(3) * powerFactor);

% Step 4: Calculate load impedance
Z = Vph / I;

% Extract load resistance and reactance
R = real(Z);
X = imag(Z);

% Calculate load inductance from reactance (assuming purely inductive load)
L = X / (2 * pi * ratedOutputFrequency);

% Convert load inductance to millihenry
L_mH = L * 1000;

% Display the results
fprintf('Load Resistance: %.3f Ohms\n', R);
fprintf('Load Inductance: %.3f mH\n', L_mH);