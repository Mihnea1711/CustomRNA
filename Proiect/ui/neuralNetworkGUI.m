function neuralNetworkGUI()
N = 51;

% Generate input data using a separate function
ui = generateInputData(N);

% Generate target values using a separate function and the provided myFunction
target_values = generateTargetValues(ui, @myFunction);

% Create the main figure window
fig = figure('Name', 'Neural Network Hyperparameter Tuning GUI', 'Position', [100, 100, 800, 600]);

% Create axes for plotting (right side)
ax = axes('Parent', fig, 'Position', [0.5, 0.1, 0.4, 0.8]);

% Create dropdown menus for selecting hyperparameters (left side)
uicontrol('Style', 'text', 'String', 'Select Hidden Neurons:', 'Position', [-10, 520, 250, 30]);
hidden_neurons_edit = uicontrol('Style', 'edit', 'String', '', 'Position', [190, 530, 150, 30]);

uicontrol('Style', 'text', 'String', 'Select Learning Rate:', 'Position', [-10, 470, 250, 30]);
learning_rate_edit = uicontrol('Style', 'edit', 'String', '', 'Position', [190, 480, 150, 30]);

uicontrol('Style', 'text', 'String', 'Select Epochs:', 'Position', [-10, 410, 250, 30]);
epochs_edit = uicontrol('Style', 'edit', 'String', '', 'Position', [190, 420, 150, 30]);
% Create a button for initiating hyperparameter tuning
start_button = uicontrol('Style', 'pushbutton', 'String', 'Start Hyperparameter Tuning', 'Position', [70, 350, 250, 30], 'Callback', @startTuning);

result_textbox = uicontrol('Style', 'edit', 'String', '', 'Position', [70, 80, 270, 240], 'Max', 10, 'HorizontalAlignment', 'left');

% Callback function for the start button
    function startTuning(~, ~)
        % Get selected hyperparameters from dropdown menus
        hidden_neurons_str = hidden_neurons_edit.String;
        hidden_neurons = str2num(hidden_neurons_str);
        if isempty(hidden_neurons) || ~isvector(hidden_neurons) || any(hidden_neurons < 0)
            errordlg('Please enter a valid vector of hidden neurons.', 'Invalid Input', 'modal');
            return;
        end
        learning_rate_str = learning_rate_edit.String;
        learning_rate = str2double(learning_rate_str);

        epochs_str = epochs_edit.String;
        epochs = str2num(epochs_str);
       

        % Perform hyperparameter tuning using selected values
        [best_net, best_params, best_mse] =hyperparameterTuning(ui, target_values, hidden_neurons, learning_rate, epochs);

        % Generate test input data for evaluation
        test_ui = linspace(0, 1, numel(ui)).';

        % Test the neural network on the test input data using a separate function
        predicted_values = testNeuralNetwork(best_net, test_ui);

        % Calculate the mean squared error using a separate function
        mse = calculateMSE(test_ui, predicted_values, @myFunction);

        % Plot the results on the axes (right side)
        plot(ax, ui, target_values, 'o', test_ui, predicted_values, '-');
        title(ax, 'Approximation of \phi(u)');
        xlabel(ax, 'u');
        ylabel(ax, '\phi(u)');
        legend(ax, 'Training Set', 'Network Predictions');
        grid(ax, 'on');
        result_str = ['Best hyperparameters: Hidden Neurons=' num2str(best_params(1)) '  Learning Rate=' num2str(best_params(2)) '  Epochs=' num2str(best_params(3))];
        result_str2=['  Global Mean Squared Error: ' num2str(mse)];

        % Setează textul în TextBox pentru afișare
        result_textbox.String = [result_str result_str2];
        % Display the results
        disp(['Global Mean Squared Error: ' num2str(mse)]);
    end
end
