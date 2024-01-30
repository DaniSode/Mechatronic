function [M, C, G] = ToMCG()
    
    % Predefining variables as syms
    syms q1 q2 q3 q4 qp1 qp2 qp3 qp4 qp1r qp2r qp3r qp4r qpp1r qpp2r qpp3r qpp4r L1 L2 L7 L8 al L11 L21 L41 L51 m1 m2 m3 m4 gz B1 B2 B3 B4 real 
    
    m = [m1 m2 m3 m4];
    Q = [q1; q2; q3; q4];
    Qp = [qp1; qp2; qp3; qp4];
    g = [0, 0, gz];
    
    Qpr = [qp1r; qp2r; qp3r; qp4r];
    Qppr = [qpp1r; qpp2r; qpp3r; qpp4r];

    % Define DH matrix (theta, d)-z, (a and alpha)-x
    DH = [q1           L1   0    -pi/2;
          q2-pi/2      0    L2       0;
          q3+al        0    L7       0;
          q4+pi/2-al   0    L8       0];
    
    DHcm = [q1           L11   0        0;
            q2-pi/2      0    L21       0;
            q3+al        0    L51       0;
            q4+pi/2-al   0    L41       0];
    
    Beta = [B1, 0, 0, 0;
            0, B2, 0, 0;
            0, 0, B3, 0
            0, 0, 0, B4];

    Tau = zeros(size(DH,1),1);

    % Predefine M, P, G and C
    M = zeros(size(DH,1),size(DH,1));
    P = 0;
    G = [];
    C = sym(zeros(size(DH,1),size(DH,1)));
    
    % Loop to construct M and P matrices
    for i = 1:size(DH,1)
    
        Icm = [sym(sprintf('I%d11', i),'real') sym(sprintf('I%d12', i),'real') sym(sprintf('I%d13', i),'real');
            sym(sprintf('I%d12', i),'real') sym(sprintf('I%d22', i),'real') sym(sprintf('I%d23', i),'real');
            sym(sprintf('I%d13', i),'real') sym(sprintf('I%d23', i),'real') sym(sprintf('I%d33', i),'real')];
        
        HTcm = DHtoHTcm(DH,DHcm,0,i);
        Rcm = HTcm(1:3,1:3);
        tcm = HTcm(1:3,4);
    
        Jcm = HTtoJcm(DH,DHcm,0,i);
        Jv = Jcm(1:3,:);
        Jw = Jcm(4:6,:);
    
        M = M+simplify((m(i)*Jv'*Jv+Jw'*Rcm*Icm*Rcm'*Jw));
    
        P = P + m(i)*g*tcm;
        
    end
    
    % Loop to construct G
    for l = 1:size(DH,1)
        G = [G; simplify(diff(P,Q(l)))];
    end

    % Loop to construct C
    for i = 1:size(DH,1)
        for k = 1:size(DH,1)
            for j = 1:size(DH,1)
                pos = simplify((diff(M(k,j),Q(i))+diff(M(k,i),Q(j))-diff(M(i,j),Q(k)))*Qp(i));
                C(k,j) = C(k,j) + pos;
            end
        end
        
    end
    C = 1/2.*C;

    Qpp = inv(M)*(Tau-C*Qp-G-Beta*Qp);
%     Qpp = 0;
%     Qpp = pinv(M)*(Tau-C*Qp-G-Beta*Qp);

end