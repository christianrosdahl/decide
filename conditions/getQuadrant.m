function q = getQuadrant(x,y)
% GETQUADRANT Returns number q of the quadrant in which the point (x,y) is.
if x >= 0 && y >= 0
    q = 1;
elseif x < 0 && y >= 0
    q = 2;
elseif x <= 0 && y < 0
    q = 3;
else
    q = 4;
end
end

