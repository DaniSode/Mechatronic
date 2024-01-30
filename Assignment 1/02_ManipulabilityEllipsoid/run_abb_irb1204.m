% Note: The first time you run this script, it may take some time since it
% has to load the simulink environment (usually a couple of seconds).
clear all; close all; clc

% Adds the additional folders with functions into the library path
addpath('C:\Users\soder\OneDrive - Chalmers\Chalmers\Modelling and control of mechatronic systems\Mina funktioner')
addpath('C:\Users\soder\OneDrive - Chalmers\Chalmers\Modelling and control of mechatronic systems\Assignment 1\DrawCFs')
addpath('C:\Users\soder\OneDrive - Chalmers\Chalmers\Modelling and control of mechatronic systems\Assignment 1\Model')

% Defines the robot variables needed for the simulation
robot_name="abbIrb120"; 
n_dofs=4;
al=1.343030361054137;

% Opens the simulator. Press play to run the simulation
open('KSimulator_abbIRB4')

