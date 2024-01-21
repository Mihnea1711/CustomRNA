% plotResults.m
% This function plots the target values from the training set and the predicted values
% from the neural network on the same graph.
% Input:
%   - ui: Training input data
%   - target_values: Target values corresponding to the training input data
%   - test_ui: Test input data
%   - predicted_values: Predicted values from the neural network
% Output:
%   - Plot displaying the training set and neural network results

function plotResults(ui, target_values, test_ui, predicted_values)
    % Plot the results
    figure;
    plot(ui, target_values, 'o', test_ui, predicted_values, '-');
    title('Aproximare functie \phi(u)');
    xlabel('u');
    ylabel('\phi(u)');
    legend('Setul de antrenare', 'Rezultatele retelei antrenate');
end
