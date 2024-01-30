function [HTcm_0, HTcm_W] = getAbsoluteHTcm_abbIRB4(q,L, T0_W)
%GETABSOLUTEHTCM calculates the absolute Homogeneous transformations of
% the cms wrt the robot base link0 and the wcf
% input:
%   q: is the joint position vector 1X4
%   T0_W: transformation (4x4) of the robot base wrt to wcf
% return:
%   HTcm_0: List with all the absolute CM HT (4x4) wrt robot base (0)
%   HTcm_W: List with all the absolute CM HT (4x4) wrt wcf (w)

% Joint postion

q1=q(1);
q2=q(2);
q3=q(3);
q4=q(4);

% Kinematic Paramters
%    1  2   3  4  5  6   7   8   9  10  11
% p=[L1,L2,L7,L8,al,L11,L21,L31,L32,L41,L51];

L1=L(1);
L2=L(2);
L7=L(3);
L8=L(4);
al=L(5);
L11=L(6);
L21=L(7);
L41=L(10);
L51=L(11);

% Defining DH
DH = [q1           L1   0    -pi/2;
    q2-pi/2      0    L2       0;
    q3+al        0    L7       0;
    q4+pi/2-al   0    L8       0];

DHcm = [q1           L11   0       0;
    q2-pi/2      0    L21       0;
    q3+al        0    L51       0;
    q4+pi/2-al   0    L41       0];

% Absolute Homogeneous Transformations
% TODO: Define the absolute HT wrt robot base (link 0)

Tcm1_0 = DHtoHTcm(DH, DHcm, 0, 1);

Tcm2_0 = DHtoHTcm(DH, DHcm, 0, 2);

Tcm3_0 = DHtoHTcm(DH, DHcm, 0, 3);

Tcm4_0 = DHtoHTcm(DH, DHcm, 0, 4);

%List with all the HT wrt to link 0, starting with H0_0
HTcm_0={eye(4),Tcm1_0, Tcm2_0, Tcm3_0, Tcm4_0};

%TODO: Create a list with all the HT wrt to the wcf (w), starting with
%Hw_w. In total, HT_W should have 6 elements Hw_w, H0_w, ..., Hef_w.
HTcm_W = {eye(4), T0_W, Tcm1_0, Tcm2_0, Tcm3_0, Tcm4_0};

end

