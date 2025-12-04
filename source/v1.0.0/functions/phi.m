function phi = phi(n,M,R,Z,Bzeros,L_a)
% Function phi from A.3 and A.4
% n: Mode n
% M: Number of shallow tank functions
% R,Z: Cylindrical coordinates (dimensionless)
% Bzeros: Zeros of Besssel function of first kind
% L: Dimensionless height of liquid over CoM
if n <= M
    phi   = R.^(2*n-1);
else
    phi   = besselj(1,Bzeros(n-M)*R).*exp(Bzeros(n-M)*(Z - L_a));
end