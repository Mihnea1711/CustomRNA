classdef TestCalculateMSE < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)

        function testCalculateMSEWithZeroInput(testCase)
            N = 51;
            test_ui = zeros(N, 1);
            predicted_values = zeros(N, 1);
            
            mse_actual = calculateMSE(test_ui, predicted_values, @myFunction);
            
            mse_expected = mean((myFunction(test_ui') - predicted_values).^2);
            
            testCase.verifyEqual(mse_actual, mse_expected);
        end
        
        function testCalculateMSEWithValidInput(testCase)
            N = 51;
            test_ui = generateInputData(N);
            predicted_values = myFunction(test_ui');
            
            mse_actual = calculateMSE(test_ui, predicted_values, @myFunction);
            
            mse_expected = mean((myFunction(test_ui') - predicted_values).^2);
            
            testCase.verifyEqual(mse_actual, mse_expected);
        end

    end

end
