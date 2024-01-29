function bmn = Bint(m,n,M,Bzeros,r_cm)
% Implements the expression 2.28-2.30 of NASA CR-230 (D.O. Lomen)

% Bessel derivative zeros
if m > M
    jm      = Bzeros(m-M);
end
if n > M
    jn      = Bzeros(n-M);
end

% Solutions
if n <= M && m <= M
    bmn = (1 - r_cm^(2*n+2*m))/(2*n+2*m);
elseif n > M && m > M && m ~= n
    bmn = (jm*r_cm*besselj(1,jn*r_cm)*dBesselj(1,jm*r_cm) -...
        jn*r_cm*besselj(1,jm*r_cm)*dBesselj(1,jn*r_cm))/...
        (jm^2 - jn^2);
elseif n > M && m > M && m == n
    bmn = ((jn^2-1)*besselj(1,jn)^2 -...
        (jn*r_cm*dBesselj(1,jn*r_cm))^2 - ...
        (jn^2*r_cm^2-1)*besselj(1,jn*r_cm)^2)/...
        (2*jn^2);
elseif n > M && m == 1
    bmn = 1/jn^3 * (jn*besselj(1,jn) - ...
        jn*r_cm*besselj(1,jn*r_cm) + ...
        jn^2*r_cm^2*dBesselj(1,jn*r_cm));
    
elseif n > M && m <= M
    bmn = 1/jn^2*((2*m-1)*besselj(1,jn) - ...
        r_cm^(2*m-1)*abs((2*m-1)*besselj(1,jn*r_cm) - ...
        jn*r_cm*dBesselj(1,jn*r_cm)) - ...
        4*m*(m-1)*Bint(m-1,n,M,Bzeros,r_cm));
end