% hyperparameterTuning.m
function [best_net, best_params, best_mse] = hyperparameterTuning(ui, target_values, hidden_layer_neurons_range, learning_rate_range, epochs_range)

    % Specify ranges for hyperparameters
%     hidden_layer_neurons_range = [5, 10, 15];
%     learning_rate_range = [0.001, 0.01, 0.1];
%     epochs_range = [500, 1000, 1500];

    best_mse = Inf;
    best_params = [];

    % Iterate over hyperparameter combinations
    for s = hidden_layer_neurons_range
        for lr = learning_rate_range
            for epochs = epochs_range
                % Set up the neural network architecture using a separate function
                net = setupNeuralNetwork(s, numel(ui), lr, epochs);

                % Train the neural network using a separate function
                [net, tr] = trainNeuralNetwork(net, ui, target_values);

                disp(['Number of Epochs: ' num2str(tr.num_epochs)]);
                disp(['Final Training Error: ' num2str(tr.best_perf)]);


                % Test the neural network on the test input data using a separate function
                predicted_values = testNeuralNetwork(net, linspace(0, 1, numel(ui)).');

                % Calculate the mean squared error using a separate function
                mse = calculateMSE(ui, predicted_values, @myFunction);

                % Update best hyperparameters if the current model is better
                if mse < best_mse
                    best_mse = mse;
                    best_params = [s, lr, epochs];
                end
            end
        end
    end

    disp(['Best hyperparameters: Hidden Neurons=' num2str(best_params(1)) ', Learning Rate=' num2str(best_params(2)) ', Epochs=' num2str(best_params(3))]);

    % Set up the neural network with the best hyperparameters
    best_net = setupNeuralNetwork(best_params(1), numel(ui), best_params(2), best_params(3));

    % Train the neural network with the best hyperparameters
    [best_net, ~] = trainNeuralNetwork(best_net, ui, target_values);

end