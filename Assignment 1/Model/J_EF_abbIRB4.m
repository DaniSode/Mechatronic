function Jef_0=J_EF_abbIRB4(q,L)
%J_EF_ABBIRB4 calculates the geometric Jacobian of the end-effector wrt the
%robot base (link 0)
% input:
%   q: is the joint position vector 1X4
%   L: is the kinematic parameter array (see abbIRB4_params.m)
% return:
%   Jef_0: End-effector Jacobian wrt wcf (6Xn)

% Joint Positions
q1=q(1);
q2=q(2);
q3=q(3);
q4=q(4);

% Kinematic paramters
L1=L(1);
L2=L(2);
L7=L(3);
L8=L(4);
al=L(5);

% Defining DH
DH = [q1           L1   0    -pi/2;
      q2-pi/2      0    L2       0;
      q3+al        0    L7       0;
      q4+pi/2-al   0    L8       0];

% TODO: Calculate the Jacobian of the end-effector wrt link 0 (6xn)

Jef_0 = HTtoJ(DH,0,4);

end