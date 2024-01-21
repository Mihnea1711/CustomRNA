% generateInputData.m
% This function generates input data for the neural network training.
% Input:
%   - N: Number of data points
% Output:
%   - ui: Generated input data

function ui = generateInputData(N)
    % Generate linearly spaced input values between 0 and 1
    ui = (0:(N-1))/(N-1);
    % Reshape ui to a column vector
    ui = ui(:);
end
