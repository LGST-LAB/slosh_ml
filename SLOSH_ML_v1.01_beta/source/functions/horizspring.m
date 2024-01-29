function [xs, ys] = horizspring(x, y, length)
xs = zeros(1, 8);
ys = zeros(1, 8);
xs(1) = x;
ys(1) = y;
for n = 0:5
    xs(n + 2) = x + (length ./ 12) + (length ./ 6) .* n;
    if mod(n, 2) == 0
        ys(n + 2) = y - (length ./ 6);
    else
        ys(n + 2) = y + (length ./ 6);
    end
end
xs(end) = x + length;
ys(end) = y;
end
