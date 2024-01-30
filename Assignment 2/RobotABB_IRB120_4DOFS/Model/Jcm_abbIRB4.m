function [Jcm1,Jcm2,Jcm3,Jcm4] = Jcm_abbIRB4(q,L)
%JCM CM geometric Jacobians
%   q: Joint position vector 4x1
%   L: Dynamic parameters, see abbIRB4_dyn_params.m

% Joint Positions
q1=q(1);
q2=q(2);
q3=q(3);
q4=q(4);

% Kinematic and dynamic parameters
L1=L(1);
L2=L(2);
L7=L(3);
L8=L(4);
al=L(5);
L11=L(6);
L21=L(7);
L41=L(10);
L51=L(11);

% Jacobians CM
%TODO: define the geometric Jacobians for each CM
% Define DH matrix (theta, d)-z, (a and alpha)-x
DH = [q1           L1   0    -pi/2;
    q2-pi/2      0    L2       0;
    q3+al        0    L7       0;
    q4+pi/2-al   0    L8       0];

DHcm = [q1           L11   0        0;
    q2-pi/2      0    L21       0;
    q3+al        0    L51       0;
    q4+pi/2-al   0    L41       0];

% Calcualate Jcm
Jcm1=HTtoJcm(DH, DHcm, 0, 1);

Jcm2=HTtoJcm(DH, DHcm, 0, 2);

Jcm3=HTtoJcm(DH, DHcm, 0, 3);

Jcm4=HTtoJcm(DH, DHcm, 0, 4);

end

