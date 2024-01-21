classdef TestMyFunction < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function testMyFunctionWithZeroInput(testCase)
            u = 0;
            expected_result = 2;
            actual_result = myFunction(u);
            testCase.verifyEqual(actual_result, expected_result, 'AbsTol', 1e-6, 'Zero input result is incorrect');
        end

        function testMyFunctionWithPositiveInput(testCase)
            u = 1;
            expected_result = 1 + exp(-sin(2 * pi * u - 2));
            actual_result = myFunction(u);
            testCase.verifyEqual(actual_result, expected_result, 'AbsTol', 1e-6, 'Positive input result is incorrect');
        end

        function testMyFunctionWithNegativeInput(testCase)
            u = -1;
            expected_result = 1 + exp(sin(2 * pi * u - 2));
            actual_result = myFunction(u);
            testCase.verifyEqual(actual_result, expected_result, 'AbsTol', 1e-6, 'Negative input result is incorrect');
        end
        
    end

end
