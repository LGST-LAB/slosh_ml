function Bzeros = dBesselzero(N)
% Bessel function zeros (dJ1(r)/dr = 0)
n          = 1;
Bzeros     = 0;
options    = optimoptions('fsolve','Display','none','TolX',eps);

while n <= N
    % Initial value
    if n == 1
        stepB = 1.8;
    else
        stepB = Bzeros(n-1) + pi;
    end
    
    % Find zero
    Bzeros(n) = fsolve(@(x)dBesselj(1,x),stepB,options);
    Bzeros    = uniquetol(Bzeros,1e-10);
    
    % Next step
    n = length(Bzeros) + 1;
end