% saveNeuralNetwork.m
% Save the trained neural network to a MAT-file.
% Input:
%   - net: Trained neural network object
%   - filename: Name of the MAT-file to save the network to

function saveNeuralNetwork(net, filename)
    % Save the neural network to a MAT-file
    save(filename, 'net');
end
