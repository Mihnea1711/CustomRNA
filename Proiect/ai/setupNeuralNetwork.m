% setupNeuralNetwork.m
% This function sets up a feedforward neural network with specified parameters.
% Input:
%   - s: Number of neurons in the hidden layer
%   - inputSize: Size of the input layer
% Output:
%   - net: Configured neural network

function net = setupNeuralNetwork(s, inputSize, learningRate, epochs)
    % Create a feedforward neural network
    net = feedforwardnet(s);
    
    % Set the transfer function of the output layer to linear
    net.layers{2}.transferFcn = 'purelin';

    % Choose diff ones
    % Tansig (Hyperbolic Tangent Sigmoid):
    % 'tansig': Hyperbolic tangent sigmoid transfer function.
    
    % Logsig (Logarithmic Sigmoid):
    %'logsig': Logarithmic sigmoid transfer function.
    
    % Purelin (Linear):
    % 'purelin': Pure linear transfer function.
    
    % Hardlim (Hard Limit):
    % 'hardlim': Hard limit transfer function.
    
    % Hardlims (Symmetric Hard Limit):
    % 'hardlims': Symmetric hard limit transfer function.
    
    % Satlin (Saturating Linear):
    % 'satlin': Saturating linear transfer function.
    
    % Satlins (Symmetric Saturating Linear):
    % 'satlins': Symmetric saturating linear transfer function.
    
    % Poslin (Positive Linear):
    % 'poslin': Positive linear transfer function.
    
    % Compet (Competitive):
    % 'compet': Competitive transfer function.
    
    % Set the size of the input layer
    net.inputs{1}.size = inputSize;

    % Set the learning rate
    net.trainParam.lr = learningRate;

    % Set the epochs
    net.trainParam.epochs = epochs;
end
