function Tau = tauAdaptivePIDR(u)
%TAUADAPTIVEPIDR Joint Space control Adaptive controller
%  Input: 
%   u: Desired Joint Positions, Kd, Estimated Theta, and Yr vector (4X1)   

% Derivative Gain
Kd=diag(u(1:4));

% Joint Error Surface (from simulink model)
Sq=u(5:8);

% Regressor de-serialization (from simulink model)
% TODO: define the correct dimensions and ranges, , see function 
% Model/Yr_abbIRB4.m and the simulink model to define the range for
% the input vector u and correct dimensions
Yr=reshape(u(9:164),4,39);

% Vector of Estimated Parameters (from simulink model). Theta is updated 
% by the function Control/thetaHatDot_abbIRB4.m
% TODO: define the correct range of the vector u
Theta_e=u(165:203);


% Control
% TODO: Define a controller with he Joint Error Space transformation and
% Adaptive Controller
Tau=-Kd*Sq+Yr*Theta_e;
% Tau=zeros(4,1);






end

