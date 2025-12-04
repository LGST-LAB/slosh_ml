function [damping_ratio] = damping_ratio_conical(name, h, R, g, nu)
% This function calculates the damping ratio for a conical tank

% Inputs:
% name              Name of the correlation selected
% h                 Fluid height from the bottom of the tank
% R                 Radius of the tank
% g                 Gravity value
% nu                Kinematic viscosity (from Physics tab)

% Outputs:
% damping_ratio     Calculated damping ratio

    try
        if strcmp(name, "Conical (NASA SP-106)")
            alpha = atand(R/h);
            C5 = 0.0126*alpha + 1.0037;
            C4 = -0.0003*alpha^2 + -0.0031*alpha + 1.0010;
            damping_ratio = 4.964*C5*C4^(-1/2)*nu^(1/2)*R^(-3/4)*g^(-1/4)/(2*pi);
        else
            damping_ratio = NaN;
        end
    catch
        damping_ratio = NaN;
    end
end