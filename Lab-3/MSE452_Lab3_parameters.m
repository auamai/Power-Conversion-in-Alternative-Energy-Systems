%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                         Project #3                                  %%%
%%%   Permanent Magnet Synchronous Generator for Wind Power Generation  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

PF = 0.7162; %Rated power factor
Sb = 3.419e6; %Apparent Power 
Pb = (Sb*PF); %%total power (not phase)
Vb = 2309.4/sqrt(3);
Ib= Sb/(3*Vb);
Qb = sqrt(Sb^2 - Pb^2);

% base values calcualtion
Zb=Vb/Ib;   % impedance
Fb=53.33;     % Hz
OMEGAb=2*pi*Fb;  % electrical frequency in rad/s
Lb=Zb/OMEGAb;     % inductance base
Cb=1/(Zb*OMEGAb); % capacitance base

% load impedance
R = Pb/(3*(Ib^2));
X = Qb/(3*(Ib^2));
L = X/(OMEGAb);

% Generator Parameters
Pm = 2.4487e6; % Mechanical power
Ppairs=8;
OMEGAb_r = OMEGAb/Ppairs;
BaseFlux = Vb/(OMEGAb); 
Flux = 0.7213*BaseFlux;

Rs=0.00517*Zb;
Ld=0.7029*Lb;  
Lq=0.7029*Lb;

J = 2*Pm/OMEGAb_r^2;
Tm = 58.4585e3; %Rated Mechanical Torque



