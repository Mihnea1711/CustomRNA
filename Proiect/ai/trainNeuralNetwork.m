% trainNeuralNetwork.m
% This function trains a given neural network using specified training data.
% Input:
%   - net: Neural network to be trained
%   - ui: Input data for training
%   - target_values: Target values corresponding to the input data
% Output:
%   - net: Trained neural network
%   - tr: Training record containing information about the training process

function [net, tr] = trainNeuralNetwork(net, ui, target_values)
    % Train the neural network with the provided input and target values
    % [net, tr] = train(net, ui, target_values);

    % Initialize training data
    X = ui;
    T = target_values;

    % Train the neural network
    net.trainParam.showWindow = false;
    [net, tr] = train(net, X, T);

    % Plot the training error over epochs
%     figure;
%     plot(tr.epoch, tr.perf, '-o');
%     title('Training Error Over Epochs');
%     xlabel('Epoch');
%     ylabel('Training Error');
%     grid on;

    % Display the final training error
    disp(['Final Training Error: ' num2str(tr.best_perf)]);
end
