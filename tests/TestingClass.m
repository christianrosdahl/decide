classdef TestingClass < matlab.unittest.TestCase
% TESTINGCLASS Class for performing unit testing of the decide function
% and its related functions.
    
    properties
    end
    
    methods (Test)
        function testLIC1True(testCase)
            % TESTLIC1True Checks that lic1 returns true when there are two
            % consecutive data points that are a length greater than
            % length1 apart.
            x = [1 2 5 6 7]; % x-coordinates of data points
            y = [1 2 5 6 7]; % y-coordinates of data points
            length1 = 2; % condition parameter
            
            actSolution = lic1(x,y,length1);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC1False(testCase)
            % TESTLIC1False Checks that lic1 returns false when there are 
            % not two consecutive data points that are a length greater 
            % than length1 apart.
            x = [1 1.5 2 3 2.5]; % x-coordinates of data points
            y = [1 1.5 2 3 2.5]; % y-coordinates of data points
            length1 = 2; % condition parameter
            
            actSolution = lic1(x,y,length1);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC2True(testCase)
            % TESTLIC2True Checks that lic2 returns true when there are
            % three consecutive data points that cannot all be contained
            % within or on a circle of radius radius1.
            x = [0 1 5 6]; % x-coordinates of data points
            y = [0 0 1 1]; % y-coordinates of data points
            radius1 = 2; % condition parameter
            
            actSolution = lic2(x,y,radius1);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC2False(testCase)
            % TESTLIC2False Checks that lic2 returns false when there are
            % not three consecutive data points that cannot all be 
            % contained within or on a circle of radius radius1.
            x = [0 1 5 6]; % x-coordinates of data points
            y = [0 0 1 1]; % y-coordinates of data points
            radius1 = 10; % condition parameter
            
            actSolution = lic2(x,y,radius1);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
    end
end

