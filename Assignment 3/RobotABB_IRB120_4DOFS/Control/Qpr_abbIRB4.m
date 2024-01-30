function Qpr = Qpr_abbIRB4(u)
%QPR_ABBIRB4 Compute the Joint velocity reference in the Joint Space

% Joint position
Q=u(1:4);

% Joint Velocity
Qp=u(5:8);

% Time
t=u(9);

%Desired Joint Position
Qd=u(10:13);

%Desired Joint Velocity
Qdp=u(14:17);

%Desired Joint Acceleration
Qdpp=u(18:21);

% Integral Gain Offset (To fine tune Ki)
Kis=diag(u(22:25));

% Itegral DQ
iDeltaQ=u(26:29);


% Derivative Gain
Kd = diag(u(30:33));
% TODO: Inverse Derivative Gain
invKd = pinv(Kd);

% Proportional Gain
Kpi = diag(u(34:37));
% TODO: define Kp
Kp = invKd*Kpi;

% Integral Gain
% TODO: define Ki
Ki_line = 1/4*Kpi^2;
Kip = Ki_line + Kis;
Ki = invKd * Kip;

% Joint Position and Velocity Errors
% TODO: Define the error functions
DeltaQ = Q - Qd;
DeltaQp = Qp - Qdp;

% PID-Like Control
% TODO: Define the joint velocity (acceleration) references to generate a
% PID-like controller in the joint space
qpr = Qdp - Kp * DeltaQ - Ki * iDeltaQ;
qppr = Qdpp - Kp * DeltaQp - Ki * DeltaQ;

Qpr=[qpr;qppr;DeltaQ;DeltaQp;Qd;Qdp;Qdpp];

end

