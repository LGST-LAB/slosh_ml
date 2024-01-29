function [K,omega_k,Vc,M_k,L_k,H_k,CM_k,M0,c_k,lambda_k,I] = derivedparams(rho,flvol,H,c_k,lambda_k,g,L,a,B,s_n,Ph_a,intb,selm)
% Pre-calculation
N  = length(s_n);
lambda_k  = diag(lambda_k);

% Fluid mass
M  = flvol*rho;

% gamma parameter
gamma_k = zeros(N,1);

for n = 1:N
  gamma_k(n) = pi*a*a^2/flvol * sum(sum(c_k(:,n)*c_k(:,n)'.*B));
end

% b parameter
b_star_k = (pi*a^3./(flvol*gamma_k)).*c_k'*B(1,:)';

% Mass of slosh modes
M_k = M.*lambda_k.*gamma_k.*b_star_k.^2;

% Length of pendulum
L_k = a./lambda_k;

% Inert mass of fluid
[~, I] = sort(M_k.*L_k, 'descend'); % sort in order of the product of mass and pendulum length, descending
M_k = M_k(I);
L_k = L_k(I);
Mtot = sum(M_k(1:selm));
M0 = M-Mtot;
c_k = c_k(:,I);
lambda_k = lambda_k(I);
b_star_k = b_star_k(I);
Ph_a = Ph_a(I);
gamma_k = gamma_k(I);

% h parameter
h_k  = (2*pi*a.^3)./(flvol.*gamma_k.*lambda_k).*c_k'*s_n;

% Height of the slosh mass pendulum hinge above the bottom of the tank
H_k =-H+(a).*(1./lambda_k + h_k./(b_star_k));

% Ratio of slosh wave amplitude to slosh mass amplitude
CM_k = Ph_a.*b_star_k.*lambda_k;

%Inert mass height
Hcg = abs(intb(3));

% Height of inert fluid over cg
H_0 = (M*Hcg - sum(M_k(1:selm).*(H_k(1:selm)-L_k(1:selm))))/M0;

% Nondimensional frequency
K  = lambda_k.*(L/a);

% Natural frequencies
omega_k = sqrt((lambda_k.*g)./a);

% Characteristic velocity
Vc = omega_k(1)*a;

%Add M0 and H0 to beginning of Data
M_k       = [M0; M_k];
H_k       = [H_0; H_k];
L_k       = [0;  L_k];
CM_k = [0;  CM_k];

% convert back to matrix
lambda_k = diag(lambda_k);