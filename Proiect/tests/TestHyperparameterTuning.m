classdef TestHyperparameterTuning < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function testHyperparameterTuningWithValidInput(testCase)
            % Test with valid input
            N = 51;
            ui = generateInputData(N);
            target_values = generateTargetValues(ui, @myFunction);
            
            [best_net, best_params, best_mse] = hyperparameterTuning(ui, target_values);

            % Verify that best_mse is not Inf, indicating successful tuning
            testCase.verifyNotEqual(best_mse, Inf, 'MSE should not be Inf');

            % Verify that best_params is not empty, indicating successful tuning
            testCase.verifyNotEmpty(best_params, 'Best parameters should not be empty');

            % Verify that best_net is not empty, indicating successful tuning
            testCase.verifyNotEmpty(best_net, 'Best neural network should not be empty');
        end
    end

end
