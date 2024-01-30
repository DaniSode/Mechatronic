function Jef=J_EF_abbIRB4(q,L)
% J_EF_abbIRB4 Calculates the geometric Jacobian of the end-effector

% Use the obtained function from previous asssignments
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

% TODO: Calculate the Jacobian of the end-effector wrt link 0 (6xn)
DH = [q1           L1   0    -pi/2;
      q2-pi/2      0    L2       0;
      q3+al        0    L7       0;
      q4+pi/2-al   0    L8       0];

Jef = HTtoJ(DH,0,4);

end