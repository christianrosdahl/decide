function fulfilled = lic4(x, y, area1)
% LIC4 Checks if there exists at least one set of three consecutive
% data points that are the vertices of a triangle with area greater than
% area1.

% OUTPUTS:
%   * fulfilled = 1 if the condition is fulfilled and 0 otherwise
% INPUTS:
%   * x = x-coordinates of data points
%   * y = y-coordinates of data points
%   * area1 = condition parameter (area1 >= 0)

if area1 < 0
    error('area1 must satisfy area1 >= 0')
end

fulfilled = 0;

for i = 1:length(x)-2 % Iterate through data points
    p1 = [x(i) y(i)];
    p2 = [x(i+1) y(i+1)];
    p3 = [x(i+2) y(i+2)];
    
    area = triangleArea(p1, p2, p3);
    
    if area > area1
        fulfilled = 1;
    end
end
end