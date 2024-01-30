function Xp=DifFK_abbIRB4(q,qp,L)
%DIFFK_ABBIRB4 calculates the end-effector's linear and angualr velocity
%vector wrt the robot base (link 0)
% input:
%   q: is the joint position vector 1X4
%   qp: is the joint velocity vector 1X4
%   L: is the kinematic parameter array (see abbIRB4_params.m)
% return:
%   Xp: End-effector linear and angular velocitites wrt wcf (6X1)

% Joint positions
q1=q(1);
q2=q(2);
q3=q(3);
q4=q(4);

% Joint velocities
qp1=qp(1);
qp2=qp(2);
qp3=qp(3);
qp4=qp(4);

% Kinematic paramters
L1=L(1);
L2=L(2);
L7=L(3);
L8=L(4);
al=L(5);

% TODO: define the Jacobian of the ef wrt robot base (link 0) 6xn
DH = [q1           L1   0    -pi/2;
      q2-pi/2      0    L2       0;
      q3+al        0    L7       0;
      q4+pi/2-al   0    L8       0];

Jef = HTtoJ(DH,0,4);

%TODO: Calcualte the linear and angular velocity vector of the ef wrt 0
Xp=Jef*qp;

end