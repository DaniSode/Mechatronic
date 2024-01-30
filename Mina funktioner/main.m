% Name: Daniel Söderqivst
% Course:  Modelling and control of mechatronic systems
% Purpose: Assignments

% Clear the workspace and close any open figures
clear all; close all; clc


%% Main code 

% Kinematic parameters for all the tasks
L1=0.29;
L2=0.27;
L3=0.07;
L4=0.302;
L5=0.072;
L6=0.1; 
L7=sqrt(L3^2+L4^2);
L8=L5+L6;
al=atan(L4/L3);
L11=L1/2;
L21=L2/2;
L51=L7/2;
L41=L8/2;

% Define q
q1 = 0;
q2 = 0;
q3 = 0;
q4 = 0;


% %% Assignment 1
% 
% 
% % If wanted
% % syms q1 q2 q3 q4 L1 L2 L7 L8 L11 L21 L51 L41 real
% 
% % Define DH matrix (theta, d)-z, (a and alpha)-x
% DH = [q1           L1   0    -pi/2;
%       q2-pi/2      0    L2       0;
%       q3+al        0    L7       0;
%       q4+pi/2-al   0    L8       0];
% 
% % Converting from DH to HT
% HT1_0 = DHtoHT_Distal(DH,0,1);
% HT2_0 = DHtoHT_Distal(DH,0,2);
% HT3_0 = DHtoHT_Distal(DH,0,3);
% HT4_0 = DHtoHT_Distal(DH,0,4);
% fprintf('The answer to the first exercise in assignment 1\nwhere all the asked HT matrices from each link wrt base are shown down below:\n\n');
% fprintf('HT_0^1 =\n\n');disp(HT1_0)
% fprintf('HT_0^2 =\n\n');disp(HT2_0)
% fprintf('HT_0^3 =\n\n');disp(HT3_0)
% fprintf('HT_0^4 =\n\n');disp(HT4_0)
% 
% % Defining q 
% q1 = 0; 
% q2 = 0.3; 
% q3 = 0; 
% q4 = 0;
% 
% % Define DH matrix (theta, d)-z, (a and alpha)-x
% DH = [q1           L1   0    -pi/2;
%       q2-pi/2      0    L2       0;
%       q3+al        0    L7       0;
%       q4+pi/2-al   0    L8       0];
% 
% % Jacobian
% Jef = HTtoJ(DH,0,4);
% fprintf('\n\n\nThe answer to the second exercise in assignment 1\nwhere the asked Jacobian matrix from the ef wrt base are shown down below:\n\n');
% fprintf('J_0^ef =\n\n');disp(Jef)
% % Defining q 
% q1 = 0; 
% q2 = 0; 
% q3 = 0; 
% q4 = 0;



% %% Assignment 2
% 
% 
% % Define DH matrix (theta, d)-z, (a and alpha)-x
% DH = [q1           L1   0    -pi/2;
%       q2-pi/2      0    L2       0;
%       q3+al        0    L7       0;
%       q4+pi/2-al   0    L8       0];
% 
% DHcm = [q1           L11   0        0;
%         q2-pi/2      0    L21       0;
%         q3+al        0    L51       0;
%         q4+pi/2-al   0    L41       0];
% 
% % Calculating HTcm
% HTcm1_0 = DHtoHTcm(DH, DHcm, 0, 1);
%      
% HTcm2_0 = DHtoHTcm(DH, DHcm, 0, 2);
%     
% HTcm3_0 = DHtoHTcm(DH, DHcm, 0, 3);
%     
% HTcm4_0 = DHtoHTcm(DH, DHcm, 0, 4);
% 
% fprintf('The answer to the first exercise in assignment 2\nwhere all the asked HT matrices for each cm wrt to base are shown down below:\n\n');
% fprintf('HTcm_0^1 =\n\n');disp(HTcm1_0)
% fprintf('HTcm_0^2 =\n\n');disp(HTcm2_0)
% fprintf('HTcm_0^3 =\n\n');disp(HTcm3_0)
% fprintf('HTcm_0^4 =\n\n');disp(HTcm4_0)
% 
% % Calculating Jcm
% Jcm1=HTtoJcm(DH, DHcm, 0, 1);
% 				    
% Jcm2=HTtoJcm(DH, DHcm, 0, 2);
% 				    
% Jcm3=HTtoJcm(DH, DHcm, 0, 3);
%     
% Jcm4=HTtoJcm(DH, DHcm, 0, 4);
% 
% fprintf('\n\nThe answer to the second exercise in assignment 2\nwhere all the asked Jacobian matrices for each cm wrt to base are shown down below:\n\n');
% fprintf('Jcm_0^1 =\n\n');disp(Jcm1)
% fprintf('Jcm_0^2 =\n\n');disp(Jcm2)
% fprintf('Jcm_0^3 =\n\n');disp(Jcm3)
% fprintf('Jcm_0^4 =\n\n');disp(Jcm4)
% 
% % M,C,G matrices
% [M, C, G] = ToMCG();
% 
% fprintf('\n\nThe answer to the third and fourth exercise in assignment 2\nwhere all the asked matrices and vector M, C and G are shown down below:\n\n');
% % M matrix
% fprintf('The M matrix =\n\n');disp(simplify(M))
% % C matrix
% fprintf('The C matrix =\n\n');disp(simplify(C))
% % G matrix
% fprintf('The G vector =\n\n');disp(simplify(G))



% % %% Assignment 3
% % 
% % 
% % [M, C, G] = ToMCG();
% % [Tau, Theta, Yr, YrBeta, YrAll] = ToRegressor(M,C,G);
% % 
% % fprintf('The answer to the first exercise in assignment 3\nwhere Tau, Theta and the regressor (Yr) are shown down below:\n\n');
% % % Tau matrix
% % fprintf('\nTau matrix =\n\n');disp(Tau)
% % 
% % % Theta matrix
% % fprintf('\nTheta vector =\n\n');disp(Theta)
% % 
% % % Yr matrix
% % fprintf('\nYr matrix =\n\n');disp(Yr)
% % % YrBeta matrix
% % fprintf('\nYrBeta matrix =\n\n');disp(YrBeta)
% % % YrBeta matrix
% % fprintf('\nYrAll matrix =\n\n');disp(YrAll)
% 
% % % Look for singularity free
% 
% 
% addpath('C:\Users\soder\OneDrive - Chalmers\Chalmers\Modelling and control of mechatronic systems\Assignment 3\Robot_Kuka_IIWA_7DOFs\Model')
% 
% L = kukaIIWA7_params;
% Q = [pi/8 pi/8 pi/8 pi/8 pi/8 pi/8 pi/8];
% J7_0 = J_EF_kukaIIWA7(Q,L);
% 
% [U,S,V] = svd(J7_0);
% 
% determinant = prod(diag(S));
% 
% if determinant < 0.01
%     fprintf('\n\nSince the determinant = 0 the system is a singularity free position.')
% else
%     fprintf('\n\nDeterminant of J: %s', num2str(determinant));
%     fprintf('\nThis means that the robot is not singularity free.\n')
% end



%% Plotting

% Define q and parameters


% Define DH matrix (theta, d)-z, (a and alpha)-x
DH = [q1           L1   0    -pi/2;
      q2-pi/2      0    L2       0;
      q3+al        0    L7       0;
      q4+pi/2-al   0    L8       0];

DHcm = [q1           L11   0        0;
        q2-pi/2      0    L21       0;
        q3+al        0    L51       0;
        q4+pi/2-al   0    L41       0];

DHcm = [];

DHw = [0 -L1 0 0;0 -L1 -L1 0];
% DHw = [];

scale = 0.1; % Scale of the arrows
labels = 'd'; % should be default "d" with cf as label or "a" for the axis as labels

plotspace(DHw, DH, DHcm, scale, labels)
