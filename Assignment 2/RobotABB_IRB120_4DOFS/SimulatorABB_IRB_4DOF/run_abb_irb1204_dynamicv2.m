% Note: The first time you run this script, it may take some time since it
% has to load the simulink environment (usually a couple of seconds).

clear all
restoredefaultpath

% Adds the additional folders with functions into the library path
addpath('C:\Users\soder\OneDrive - Chalmers\Chalmers\Modelling and control of mechatronic systems\Assignment 2\RobotABB_IRB120_4DOFS\DrawCFs')
addpath('C:\Users\soder\OneDrive - Chalmers\Chalmers\Modelling and control of mechatronic systems\Assignment 2\RobotABB_IRB120_4DOFS\Model')
addpath('C:\Users\soder\OneDrive - Chalmers\Chalmers\Modelling and control of mechatronic systems\Mina funktioner')

% Defines the robot variables needed for the simulation
robot_name="abbIrb120"; 
n_dofs=4;

% Opens the simulator. Press play to run the simulation
open('DSimulator_abbIRB4v2')

