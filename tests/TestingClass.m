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
            epsilon = 3*pi/4; % condition parameter
            
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
            x = [3 5 5 9]; % x-coordinates of data points
            y = [2 5 9 5]; % y-coordinates of data points
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
        
        function testLIC6True(testCase)
            % TESTLIC6True Checks that lic6 returns true when two
            % consecutive data points (x(i),y(i)) and (x(i+1),y(i+1)) are
            % such that x(i+1) - x(i) < 0.
            x = [6 2 5 7 9]; % x-coordinates of data points
            y = [1 6 3 4 2]; % y-coordinates of data points
            
            actSolution = lic6(x,y);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC6False(testCase)
            % TESTLIC6False Checks that lic6 returns false when no two
            % consecutive data points (x(i),y(i)) and (x(i+1),y(i+1)) are
            % such that x(i+1) - x(i) < 0.
            x = [6 8 9 11 12]; % x-coordinates of data points
            y = [1 6 3 4 2]; % y-coordinates of data points
            
            actSolution = lic6(x,y);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC7True(testCase)
            % TESTLIC7True Checks that lic7 returns true when one of n_pts
            % consecutive data points lies a distance greater than dist
            % from the line joining the first and last of the n_pts points.
            
            % Points 1 and 4 form a line which point 3 is distance 12 away
            % from.
            x = [0 4 2 10 5]; % x-coordinates of data points
            y = [2 6 14 2 1]; % y-coordinates of data points
            n_pts = 4; % condition parameter
            dist = 10; % condition parameter
            
            actSolution = lic7(x,y,n_pts,dist);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC7False(testCase)
            % TESTLIC7False Checks that lic7 returns false when none of n_pts
            % consecutive data points lies a distance greater than dist
            % from the line joining the first and last of the n_pts points.
            
            % Point 2 is length 2 from the line of points 1 and 3, and point
            % 3 is length 2 from the line of points 2 and 4.
            x = [0 1 2 3]; % x-coordinates of data points
            y = [0 2 0 2]; % y-coordinates of data points
            n_pts = 3; % condition parameter
            dist = 3; % condition parameter
            
            actSolution = lic7(x,y,n_pts,dist);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC8True(testCase)
            % TESTLIC8True Checks that lic8 returns true when two data 
            % points separated by exactly k_pts consecutive intervening
            % points are a distance greater than length1 apart.
            
            % Points 2 and 4 are a distance 6 apart.
            x = [0 4 2 10 5]; % x-coordinates of data points
            y = [2 6 14 6 1]; % y-coordinates of data points
            k_pts = 1; % condition parameter
            dist = 5; % condition parameter
            
            actSolution = lic8(x,y,k_pts,dist);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC8False(testCase)
            % TESTLIC8False Checks that lic8 returns false when no two data 
            % points separated by exactly k_pts consecutive intervening
            % points are a distance greater than length1 apart.
            
            % Points 1 and 3 are a distance 4 apart and points 2 and 4 are
            % a distance 4 apart.
            x = [0 2 4 6]; % x-coordinates of data points
            y = [2 5 2 5]; % y-coordinates of data points
            k_pts = 1; % condition parameter
            dist = 5; % condition parameter
            
            actSolution = lic8(x,y,k_pts,dist);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC9True(testCase)
            % TESTLIC9True Checks that lic9 returns true when one set of
            % three data points separated by exactly a_pts and b_pts
            % consecutive intervening points cannot be contained wihtin or
            % on a circle of radius radius1.
            
            % Points 1, 3 and 5 cannot be contained in a circle of radius
            % less than 4.
            x = [0 2 4 6 8]; % x-coordinates of data points
            y = [1 5 1 5 1]; % y-coordinates of data points
            a_pts = 1; % condition parameter
            b_pts = 1; % condition parameter
            radius1 = 5; % condition parameter
            
            actSolution = lic9(x,y,a_pts,b_pts,radius1);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC9False(testCase)
            % TESTLIC9False Checks that lic9 returns false when every set of
            % three data points separated by exactly a_pts and b_pts
            % consecutive intervening points can be contained wihtin or
            % on a circle of radius radius1.
            
            % Points 1, 3 and 5 can be contained in a circle of radius 4.
            x = [0 2 4 6 8]; % x-coordinates of data points
            y = [1 5 1 5 1]; % y-coordinates of data points
            a_pts = 1; % condition parameter
            b_pts = 1; % condition parameter
            radius1 = 3; % condition parameter
            
            actSolution = lic9(x,y,a_pts,b_pts,radius1);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC10True(testCase)
            % TESTLIC10True Checks that lic10 returns true when one set of
            % three data points separated by exactly c_pts and d_pts
            % consecutive intervening points form an angle such that angle
            % < pi - epsilon or angle > pi + epsilon.
            
            % Points 1, 3 and 5 form an angle 0 (i.e., < pi - epsilon)
            x = [0 2 4 6 8]; % x-coordinates of data points
            y = [1 5 1 5 1]; % y-coordinates of data points
            c_pts = 1; % condition parameter
            d_pts = 1; % condition parameter
            epsilon = pi/2; % condition parameter
            
            actSolution = lic10(x,y,c_pts,d_pts,epsilon);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC10False(testCase)
            % TESTLIC10False Checks that lic10 returns true when no set of
            % three data points separated by exactly c_pts and d_pts
            % consecutive intervening points form an angle such that angle
            % < pi - epsilon or angle > pi + epsilon.
            
            % Points 1, 3 and 5 form an right angle.
            x = [0 2 4 6 4]; % x-coordinates of data points
            y = [1 5 1 5 2]; % y-coordinates of data points
            c_pts = 1; % condition parameter
            d_pts = 1; % condition parameter
            epsilon = pi/4; % condition parameter
            
            actSolution = lic10(x,y,c_pts,d_pts,epsilon);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC11True(testCase)
            % TESTLIC11True Checks that lic11 returns true when one set of
            % three data points separated by exactly e_pts and f_pts
            % consecutive intervening points are the vertices of a triangle
            % with area greater than area1.
            
            % Points 1, 3 and 5 form a triangle with area 8.
            x = [0 2 4 6 8]; % x-coordinates of data points
            y = [1 5 1 5 1]; % y-coordinates of data points
            e_pts = 1; % condition parameter
            f_pts = 1; % condition parameter
            area1 = 7; % condition parameter
            
            actSolution = lic11(x,y,e_pts,f_pts,area1);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC11False(testCase)
            % TESTLIC11False Checks that lic11 returns false when no set of
            % three data points separated by exactly e_pts and f_pts
            % consecutive intervening points are the vertices of a triangle
            % with area greater than area1.
            
            % Points 1, 3 and 5 form a triangle with area 8.
            x = [0 2 4 6 8]; % x-coordinates of data points
            y = [1 5 1 5 1]; % y-coordinates of data points
            e_pts = 1; % condition parameter
            f_pts = 1; % condition parameter
            area1 = 9; % condition parameter
            
            actSolution = lic11(x,y,e_pts,f_pts,area1);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC12True(testCase)
            % TESTLIC12True Checks that lic12 returns true when one set of
            % two data points (x(i),y(i)) and (x(j),y(j)) separated by
            % exactly g_pts data points are such that x(j) - x(i) < 0.
            
            % Points 2 and 4 are such that x(4) - x(2) < 0.
            x = [0 2 4 -6]; % x-coordinates of data points
            y = [1 2 1 8]; % y-coordinates of data points
            g_pts = 1; % condition parameter
            
            actSolution = lic12(x,y,g_pts);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC12False(testCase)
            % TESTLIC12False Checks that lic12 returns false when no set of
            % two data points (x(i),y(i)) and (x(j),y(j)) separated by
            % exactly g_pts data points are such that x(j) - x(i) < 0.
            
            % The x-coordinates are increasing for all points.
            x = [0 2 4 6]; % x-coordinates of data points
            y = [1 2 1 8]; % y-coordinates of data points
            g_pts = 1; % condition parameter
            
            actSolution = lic12(x,y,g_pts);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC13True(testCase)
            % TESTLIC13True Checks that lic13 returns true if there are two
            % data points separated by exactly k_pts consecutive
            % intervening points further than lenght1 apart as well as two
            % data points separated by exactly k_pts consecutive
            % intervening points shorter than length2 apart.
            
            % Points 1 and 3 are a distance 3 apart and points 3 and 5 are
            % a distance 1 apart.
            x = [2 1 2 8 2]; % x-coordinates of data points
            y = [0 5 3 0 2]; % y-coordinates of data points
            k_pts = 1; % condition parameter
            length1 = 2; % condition parameter
            length2 = 2; % condition parameter
            
            actSolution = lic13(x,y,k_pts,length1,length2);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC13False(testCase)
            % TESTLIC13False Checks that lic13 returns false if there are 
            % no two data points separated by exactly k_pts consecutive
            % intervening points further than lenght1 apart.
            
            % Points 1 and 3 are a distance 3 apart and points 2 and 4 are
            % a distance 1 apart.
            x = [2 0 2 0]; % x-coordinates of data points
            y = [0 1 3 0]; % y-coordinates of data points
            k_pts = 1; % condition parameter
            length1 = 4; % condition parameter
            length2 = 2; % condition parameter
            
            actSolution = lic13(x,y,k_pts,length1,length2);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC14True(testCase)
            % TESTLIC14True Checks that lic14 returns true if there are
            % three data points separated by a_pts and b_pts consecutive
            % intervening points that cannot be contained within or on a
            % cirle of radius1, and if there is a set of three data points
            % separated by a_pts and b_pts consecutive intervening points
            % that can be contained in or on a cirlce of radius radius2.
            
            % Points 1, 3 and 5 can be contained in a circle of radius 2,
            % but not in a smaller circle.
            x = [0 1 0 3 0]; % x-coordinates of data points
            y = [0 2 2 1 4]; % y-coordinates of data points
            a_pts = 1; % condition parameter
            b_pts = 1; % condition parameter
            radius1 = 1; % condition parameter
            radius2 = 2; % condition parameter
            
            actSolution = lic14(x,y,a_pts,b_pts,radius1,radius2);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC14False(testCase)
            % TESTLIC14False Checks that lic14 returns false if there are
            % no three data points separated by a_pts and b_pts consecutive
            % intervening points that cannot be contained within or on a
            % cirle of radius1.
            
            % Points 1, 3 and 5 can be contained in a circle of radius 2,
            % but not in a smaller circle.
            x = [0 1 0 3 0]; % x-coordinates of data points
            y = [0 2 2 1 4]; % y-coordinates of data points
            a_pts = 1; % condition parameter
            b_pts = 1; % condition parameter
            radius1 = 10; % condition parameter
            radius2 = 2; % condition parameter
            
            actSolution = lic14(x,y,a_pts,b_pts,radius1,radius2);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC15True(testCase)
            % TESTLIC15True Checks that lic15 returns true if there are
            % three data points separated by e_pts and f_pts consecutive
            % intervening points that are the vertices of a triangle with
            % area greater than area1 and if there exist three data points
            % separated by e_pts and f_pts consecutive intervening points 
            % that are the vertices of a triangle with area less than
            % area2.
            
            % Points 1, 3 and 5 yield a triangle with area 6.
            x = [0 5 2 3 2]; % x-coordinates of data points
            y = [0 6 0 2 6]; % y-coordinates of data points
            e_pts = 1; % condition parameter
            f_pts = 1; % condition parameter
            area1 = 5; % condition parameter
            area2 = 7; % condition parameter
            
            actSolution = lic15(x,y,e_pts,f_pts,area1,area2);
            expSolution = 1;
            testCase.verifyEqual(actSolution, expSolution)
        end
        
        function testLIC15False(testCase)
            % TESTLIC15False Checks that lic15 returns false if there are
            % no three data points separated by e_pts and f_pts consecutive
            % intervening points that are the vertices of a triangle with
            % area greater than area1.
            
            % Points 1, 3 and 5 yield a triangle with area 6.
            x = [0 5 2 3 2]; % x-coordinates of data points
            y = [0 6 0 2 6]; % y-coordinates of data points
            e_pts = 1; % condition parameter
            f_pts = 1; % condition parameter
            area1 = 8; % condition parameter
            area2 = 10; % condition parameter
            
            actSolution = lic15(x,y,e_pts,f_pts,area1,area2);
            expSolution = 0;
            testCase.verifyEqual(actSolution, expSolution)
        end
    end
end

