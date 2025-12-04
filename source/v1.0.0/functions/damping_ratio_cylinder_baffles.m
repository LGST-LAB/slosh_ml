function [damping_ratio] = damping_ratio_cylinder_baffles(name, h, R, g, nu, baffle_width, scaling_factor, baffle_spacing, n_submerged, top_depth) 
    try
        if strcmp(name, "Cylindrical w/ Baffles (Bauer)")
            C = 2.83;
            damping_ratio = 0;
            alpha = baffle_width / R * (2 - baffle_width / R);
            for n = 1:n_submerged

                damping_ratio = damping_ratio +C*( exp(-4.6 * ((top_depth / R) + (n-1) * baffle_spacing / R)) * alpha ^ (3/2));

            end
        elseif strcmp(name, "Cylindrical w/ Baffles (Coogan)")
            C = 2.83;
            alpha = baffle_width / R * (2 - baffle_width / R);
%             x = 1.562699;
            x = scaling_factor;     % Default value: 1.55
            damping_ratio = C*( exp(-4.6 * x * (top_depth / R)) * alpha ^ (3/2));
        else
            damping_ratio = NaN;
        end
    catch
        damping_ratio = NaN;
    end
end
