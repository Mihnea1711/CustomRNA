% loadNeuralNetwork.m
% Load a trained neural network from a MAT-file.
% Input:
%   - filename: Name of the MAT-file containing the saved network
% Output:
%   - net: Loaded neural network object

function net = loadNeuralNetwork(filename)
    % Load the neural network from a MAT-file
    loadedData = load(filename);
    net = loadedData.net;
end
