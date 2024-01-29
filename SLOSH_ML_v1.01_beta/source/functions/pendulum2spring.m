function [K_k,H_k_spring] = pendulum2spring(M_k,L_k,g,H_k)
% PENDULUM2SPRING Converts pendulum parameters to spring parameters

% Spring constant
K_k = (M_k .* g) ./ L_k;
%Spring hinge point 
H_k_spring = H_k-L_k;

end

