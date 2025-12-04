function [damping_ratio] = damping_ratio_toroidal(name, h, R, g, nu) 
% This function calculates the damping ratio for a toroidal tank

% Inputs:
% name              Name of the correlation selected
% h                 Fluid height from the bottom of the tank
% R                 Radius of the tank
% g                 Gravity value
% nu                Kinematic viscosity (from Physics tab)

% Outputs:
% damping_ratio     Calculated damping ratio
    try
        if strcmp(name, "Toroidal (NASA SP-106)")
            Re = nu/sqrt(g*R^3);
            Re_0 = 0.0000033/sqrt(9.81*0.0635^3);
            h_2r = h/(2*R);
            damping_ratio = sqrt(Re/Re_0)*(1.6629*h_2r^4 - 3.7955*h_2r^3 + 3.5583*h_2r^2 - 1.6759*h_2r + 0.3865)/(2*pi);
        else
            damping_ratio = NaN;
        end
    catch
        damping_ratio = NaN;
    end
end