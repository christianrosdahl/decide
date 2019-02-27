classdef TestingClass < matlab.unittest.TestCase
% TESTINGCLASS Class for performing unit testing of the decide function
% and its related functions.
    
    properties
    end
    
    methods (Test)
        function testLIC1True(testCase)
            % TESTLIC1True Checks if input is as expected (true) for lic1
            x = [1 2 5 6 7]; % x-coordinates of data points
            y = [1 2 5 6 7]; % y-coordinates of data points
            length1 = 2; % condition parameter
            
            actSolution = lic1(x,y,length1);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC1False(testCase)
            % TESTLIC1False Checks if input is as expected (false) for lic1
            x = [1 1.5 2 3 2.5]; % x-coordinates of data points
            y = [1 1.5 2 3 2.5]; % y-coordinates of data points
            length1 = 2; % condition parameter
            
            actSolution = lic1(x,y,length1);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
    end
end

