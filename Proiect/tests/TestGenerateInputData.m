classdef TestGenerateInputData < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function testGenerateInputDataWithN51(testCase)
            N = 51;
            ui_expected = (0:(N-1))/(N-1);
            ui_expected = ui_expected(:);

            ui_actual = generateInputData(N);
            testCase.verifyEqual(ui_actual, ui_expected);
        end

        function testGenerateInputDataWithN101(testCase)
            N = 101;
            ui_expected = (0:(N-1))/(N-1);
            ui_expected = ui_expected(:);

            ui_actual = generateInputData(N);
            testCase.verifyEqual(ui_actual, ui_expected);
        end
        
        function testSecondValueOfUI(testCase)
            N = 51;
            ui_actual = generateInputData(N);
            
            expected_second_value = 1 / (N - 1); % (i-1)/(N-1)
            testCase.verifyEqual(ui_actual(2), expected_second_value);
        end

    end

end
