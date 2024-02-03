function i = isinside(r,z,r_ic,r_oc)
% Checks if a given point is inside the fluid region
i = (r <= r_oc(z) & r >= r_ic(z));
end
