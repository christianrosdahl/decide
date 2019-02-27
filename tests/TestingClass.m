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
        
        function testLIC3True(testCase)
            % TESTLIC3True Checks that lic3 returns true when three
            % consecutive points form an angle such that angle < pi -
            % epsilon or angle > pi + epsilon.
            x = [3 4 5 7]; % x-coordinates of data points
            y = [-5 -6 -7 -9]; % y-coordinates of data points
            epsilon = pi/2; % condition parameter
            
            actSolution = lic3(x,y,epsilon);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC3False(testCase)
            % TESTLIC3False Checks that lic3 returns false when no three
            % consecutive points form an angle such that angle < pi -
            % epsilon or angle > pi + epsilon.
            x = [0 1 1 0]; % x-coordinates of data points
            y = [0 0 1 1]; % y-coordinates of data points
            epsilon = pi/4; % condition parameter
            
            actSolution = lic3(x,y,epsilon);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC4True(testCase)
            % TESTLIC4True Checks that lic4 returns true when three
            % consecutive points form a triangle with area (8) greater than
            % area1.
            x = [3 5 5 9 3]; % x-coordinates of data points
            y = [2 5 9 5 3]; % y-coordinates of data points
            area1 = 7; % condition parameter
            
            actSolution = lic4(x,y,area1);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC4False(testCase)
            % TESTLIC4False Checks that lic4 returns false when no three
            % consecutive points form a triangle with area greater than
            % area1.
            x = [3 5 5 9 3]; % x-coordinates of data points
            y = [2 5 9 5 3]; % y-coordinates of data points
            area1 = 10; % condition parameter
            
            actSolution = lic4(x,y,area1);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC5True(testCase)
            % TESTLIC5True Checks that lic5 returns true when at least
            % q_pts consecutive data points lie in more than quads
            % quadrants.
            x = [1 1 -1 -1]; % x-coordinates of data points
            y = [1 1 1 -1]; % y-coordinates of data points
            q_pts = 3; % condition parameter
            quads = 2; % condition parameter
            
            actSolution = lic5(x,y,q_pts,quads);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC5False(testCase)
            % TESTLIC5False Checks that lic5 returns false when no
            % q_pts consecutive data points lie in more than quads
            % quadrants.
            x = [1 1 -1 -3]; % x-coordinates of data points
            y = [1 1 1 2]; % y-coordinates of data points
            q_pts = 3; % condition parameter
            quads = 2; % condition parameter
            
            actSolution = lic5(x,y,q_pts,quads);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
    end
end

