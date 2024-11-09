function [damping_ratio] = damping_ratio_cylinder(name, h, R, g, nu) 
    try
        if strcmp(name, "Cylindrical (Stephens)")
            K = 5.23;
            damping_ratio = K.*sqrt(nu).*(R.^(-3/4)).*(g.^(-1/4)).*tanh(1.84.*h./R).^(-1/4).*(1 + 2.*(1 - h./R).*(csch(3.68.*h./R))) / (2*pi);
        elseif strcmp(name, "Cylindrical (Mikishev, NASA SP-106)");
            damping_ratio = 4.98.*sqrt(nu).*(R.^(-3/4)).*(g.^(-1/4)).*(1 + (0.318 ./ (sinh(1.84.*h./R))) .* (((1 - (h./R))./(cosh(1.84.*h./R)) + 1))) / (2*pi);
        else
            damping_ratio = NaN;
        end
    catch
        damping_ratio = NaN;
    end
end