% Note: The first time you run this script, it may take some time since it
% has to load the simulink environment (usually a couple of seconds).
clear
restoredefaultpath

% Adds the additional folders with functions into the library path
addpath('C:\Users\soder\OneDrive - Chalmers\Chalmers\Modelling and control of mechatronic systems\Assignment 3\Robot_Kuka_IIWA_7DOFs\DrawCFs')
addpath('C:\Users\soder\OneDrive - Chalmers\Chalmers\Modelling and control of mechatronic systems\Assignment 3\Robot_Kuka_IIWA_7DOFs\Model')
addpath('C:\Users\soder\OneDrive - Chalmers\Chalmers\Modelling and control of mechatronic systems\Assignment 3\Robot_Kuka_IIWA_7DOFs\Control')

% Defines the robot variables needed for the simulation
robot_name="kukaIiwa7"; 
n_dofs=7;

% Opens the simulator. Press play to run the simulation
open('KSimulator_kuka_iiwa7_kinCtrlNS')
