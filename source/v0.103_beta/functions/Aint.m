function I = Aint(r,z,m,n,M,Bzeros,L,r_ic,r_oc)
% Implements the integrand in expression 2.34-237 of NASA CR-230 
% (D.O. Lomen)

% Remove singularity at r = 0
r(r==0) = eps;

% Bessel derivative zeros
if m > M
    jm      = Bzeros(m-M);
end
if n > M
    jn      = Bzeros(n-M);
end

% Integrands
if m <= M && n <= M
    I   = (abs((2*m-1)*(2*n-1) + 1) .* r.^(2*n+2*m-4)).*r;
elseif m <= M && n > M    
    I   = ((2*m-1)*r.^(2*m-2).*jn.*dBesselj(1,jn*r).*exp(jn*(z-L)) + ...
        r.^(2*m-3).*besselj(1,jn*r).*exp(jn*(z-L))).*r;
elseif m > M && n > M    
    I   = (r.*jn*jm.*dBesselj(1,jn*r).*dBesselj(1,jm*r) + ...
        r.^(-1).* besselj(1,jn*r).*besselj(1,jm*r) + ...
        r*jn*jm.*besselj(1,jn*r).*besselj(1,jm*r)).*...
        exp((jn + jm)*(z-L));
end

% Remove external region
I  = I .* isinside(r,z,r_ic,r_oc);
