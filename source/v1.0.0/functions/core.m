function [V,lambda_k,Bzeros] = core(N,M,nsteps,bens,e,L,r_ic,r_oc,varargin)
    % SLOSH Code
    % Following pp 60-64 of "The New Dynamic Behavior of Liquids in Moving 
    % Containers" (F.T. Dodge, SWI, San Antonio, Texas), addapted from NASA
    % CR-230 (D.O. Lomen). 
    
    % allow for disabling of waitbar (for parametric analysis)
    show_waitbar = true;
    if length(varargin)>0 && ischar(varargin{1}) && strcmp(varargin{1}, 'suppress waitbar')
        show_waitbar = false;
    end

    %% Parameters
    r_min = bens(1);
    r_max = bens(2);
    z_min = bens(3);
    
    %% Natural frequencies (eigenvalues & eigenfunctions)
    
    % Calculate zeros of function dJ1(r)/dr = 0
    Bzeros = dBesselzero(N);
    
    % Matrix Initialization
    A      = zeros(N,N);
    B      = zeros(N,N);
    
    % Matrix definition
    if show_waitbar
        h      = waitbar(0,'Please wait...');
    end
    for m = 1:N
        for n = m:N        
            A(m,n) = simp2D(@(r,z)Aint(r,z,m,n,M,Bzeros,L,r_ic,r_oc), r_min, r_max, z_min, L, nsteps, nsteps);
            B(m,n) = Bint(m,n,M,Bzeros,e);
            if show_waitbar && ishandle(h)
                waitbar((m*N - N + n)/N/N,h,'Please wait...')
            end
        end
    end
    if show_waitbar && ishandle(h)
        close(h)
    end
    
    % Symmetry
    for m = 1:N
        for n = 1:N
            A(n,m) = A(m,n);
            B(n,m) = B(m,n);
        end
    end
    
    % EIG
    [V,lambda_k] = eig(A,B);
end
