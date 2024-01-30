function [Tau, Thetaout, Yrout, YrBeta, Yrouttot] = ToRegressor(M,C,G)
    
% Definie variables
    syms q1 q2 q3 q4 qp1 qp2 qp3 qp4 real
    syms qp1r qp2r qp3r qp4r qpp1r qpp2r qpp3r qpp4r real
    syms L1 L2 L7 L8 L11 L21 L51 L41 real
    syms m1 m2 m3 m4 B1 B2 B3 B4 real
    syms I111 I112 I113 I122 I123 I133 real
    syms I211 I212 I213 I222 I223 I233 real
    syms I311 I312 I313 I322 I323 I333 real
    syms I411 I412 I413 I422 I423 I433 real
    syms gz real
    Q = [q1 q2 q3 q4];
    Qp = [qp1 qp2 qp3 qp4];
    Qpr = [qp1r; qp2r; qp3r; qp4r];
    Qppr = [qpp1r; qpp2r; qpp3r; qpp4r];
    L = [L1 L2 L7 L8 L11 L21 L41 L51];
    m = [m1 m2 m3 m4];
    b = [B1 B2 B3 B4];
    Beta = sym(eye(length(b)));
    Beta(1,1) = b(1);
    Beta(2,2) = b(2);
    Beta(3,3) = b(3);
    Beta(4,4) = b(4);
    I = [I111 I112 I113 I122 I123 I133 I211 I212 I213 I222 I223 I233 I311 I312 I313 I322 I323 I333 I411 I412 I413 I422 I423 I433];

    Tau = simplify(M*Qppr + C*Qpr + G + Beta*Qpr);

    Theta = [];
    Yr = [];

    for s = 1:length(Tau)
        
        [Yr_new, Theta_new] = coeffs(Tau(s), [L m I b]);
        Theta = [Theta; Theta_new'];
        Yr = [Yr; Yr_new'];

    end
    
    Thetaout = unique(Theta);

    Yrout = sym(zeros(length(Tau),length(Thetaout)));
    Yrouttot = sym(zeros(length(Tau),length(Thetaout)));
    YrBeta = sym(zeros(length(Tau),length(Tau)));
    n = 0;

    for j = 1:length(Tau)
        
        [Yr_new, Theta_new] = coeffs(Tau(j), [L m I b]);

        for u = 1:length(Thetaout)
            ind = find(Thetaout(u) == Theta_new);
            if isempty(ind)
                continue
            end
            yra = Yr_new(ind);
            Yrouttot(j,u) = yra;
            if u <= 4 && n < 4
                n = n + 1;
                YrBeta(n,n) = yra;
                continue
            else 
                Yrout(j,u) = yra;
            end
            
        end
        
    end

end


