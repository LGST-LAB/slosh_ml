%% Generate Custom Contour Files
% MODIFY THESE VARIABLES
z_min = 0; % minimum height
z_max = 1; % maximum height
n_inner = 2; % number of inner contour points
n_outer = 100; % number of outer contour points
r_inner = @(z) 0; % inner contour radius as a function of height
r_outer = @(z) sqrt(0.25 - (z - 0.5).^2); % outer contour radius as a function of height
filename = "test.txt"; % file name (will be saved to contours folder)

% DO NOT MODIFY
out = NaN(max(n_inner, n_outer), 4);
z_inner = linspace(z_min, z_max, n_inner);
z_outer = linspace(z_min, z_max, n_outer);
for i = 1:length(z_inner)
    out(i,1) = z_inner(i);
    out(i,2) = r_inner(z_inner(i));
end
for i = 1:length(z_outer)
    out(i,3) = z_outer(i);
    out(i,4) = r_outer(z_outer(i));
end
writecell(num2cell(out),strcat("contours\", filename));