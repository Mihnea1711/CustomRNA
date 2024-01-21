% generateTargetValues.m
% This function generates target values using a given function.
% Input:
%   - ui: Input data
%   - myFunction: Function to generate target values
% Output:
%   - target_values: Generated target values

function target_values = generateTargetValues(ui, myFunction)
    % Generate target values using the provided function
    target_values = myFunction(ui);
end
