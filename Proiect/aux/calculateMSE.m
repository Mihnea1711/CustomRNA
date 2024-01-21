% calculateMSE.m
% This function calculates the mean squared error between predicted and target values.
% Input:
%   - test_ui: Test input data
%   - predicted_values: Predicted values from the neural network
%   - myFunction: Target function for comparison
% Output:
%   - mse: Mean squared error

function mse = calculateMSE(test_ui, predicted_values, myFunction)
    % Calculate the mean squared error
    mse = mean((myFunction(test_ui.') - predicted_values).^2);
end
