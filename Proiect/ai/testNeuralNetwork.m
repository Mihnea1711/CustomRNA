% testNeuralNetwork.m
% This function tests a trained neural network using specified test data.
% Input:
%   - net: Trained neural network
%   - test_ui: Input data for testing
% Output:
%   - predicted_values: Predicted values from the neural network for the given test data

function predicted_values = testNeuralNetwork(net, test_ui)
    % Use the trained neural network to predict values for the test data
    predicted_values = sim(net, test_ui);
end
