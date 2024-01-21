% Function to get user input for neural network parameters
function [s, lr, epochs] = getUserInput()
    % Prompt the user to enter the number of neurons in the hidden layer
    s = input('Enter the number of neurons in the hidden layer: ');
    
    % Prompt the user to enter the learning rate
    lr = input('Enter the learning rate: ');
    
    % Prompt the user to enter the number of epochs
    epochs = input('Enter the number of epochs: ');
end
