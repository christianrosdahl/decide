function fulfilled = lic2(x, y, radius1)
% LIC2 Checks if there exists at least one set of three consecutive
% data points that cannot all be contained within or on
% a circle of radius1.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * radius1 = condition parameter (radius1 >= 0)

if radius1 < 0
    error('radius1 must satisfy radius1 >= 0')
end

fulfilled = 0;

% The smallest circle containing three points has either all points on
% the boundary or has two points on the boundary defining the diameter of
% the circle (see "Smallest-circle problem").

for i = 1:length(x)-2 % Iterate through data points
    p1 = [x(i) y(i)];
    p2 = [x(i+1) y(i+1)];
    p3 = [x(i+2) y(i+2)];
    
    smallestRadius = inf;
    
    % Test if smallest circle is defined by p1 and p2 (and contains p3):
    c = (p1 + p2)/2; % Center point of circle
    r = norm(p2 - p1)/2; % Radius of circle
    if (p3(1) - c(1))^2 + (p3(2) - c(2))^2 <= r^2
        smallestRadius = min(smallestRadius,r);
    end
    
    % Test if smallest circle is defined by p1 and p3 (and contains p2):
    c = (p1 + p3)/2; % Center point of circle
    r = norm(p3 - p1)/2; % Radius of circle
    if (p2(1) - c(1))^2 + (p2(2) - c(2))^2 <= r^2
        smallestRadius = min(smallestRadius,r);
    end
    
    % Test if smallest circle is defined by p2 and p3 (and contains p1):
    c = (p2 + p3)/2; % Center point of circle
    r = norm(p3 - p2)/2; % Radius of circle
    if (p1(1) - c(1))^2 + (p1(2) - c(2))^2 <= r^2
        smallestRadius = min(smallestRadius,r);
    end
    
    % Test if smallest circle has all points on boundary:
    A = [2*(p2(1)-p1(1)) 2*(p2(2)-p1(2)); ...
            2*(p3(1)-p1(1)) 2*(p3(2)-p1(2))];
    if (det(A) > 0)
        b = [p2(1)^2 - p1(1)^2 + p2(2)^2 - p1(2)^2; ...
            p3(1)^2 - p1(1)^2 + p3(2)^2 - p1(2)^2];
        c = A\b;
        r = sqrt((p1(1) - c(1))^2 + (p1(2) - c(2))^2);
        smallestRadius = min(smallestRadius,r);
    end
    
    if smallestRadius > radius1
        fulfilled = 1;
    end
end
end