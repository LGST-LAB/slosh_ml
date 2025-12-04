function [damping_ratio] = damping_ratio_sphere(name, h, R, g, nu) 
    try
        if strcmp(name, "Spherical (Mikishev, NASA SP-106, (h/R) <= 1)")
            B = (1e4)/(2*sqrt(2))*nu*R^(-3/2)*g^(-1/2);
            damping_ratio = 0.131.*B.^(0.359).*(R./h) / (2*pi);
        elseif strcmp(name, "Spherical (Mikishev, NASA SP-106, (h/R) >= 1)")
            B = (1e4)/(2*sqrt(2))*nu*R^(-3/2)*g^(-1/2);
            damping_ratio = 0.131*B^(0.359)*(1 + 0.46*(2 - h/R))/(1.46*(2 - h/R)) / (2*pi);
        else
            damping_ratio = NaN;
        end
    catch
        damping_ratio = NaN;
    end
end