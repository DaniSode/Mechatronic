function HTcm = DHtoHTcm(DH,DHcm, from, to)
    
    if size(DHcm,1) < to || 0 > from || to < from
        msg = sprintf(['There is something wrong with the input to the function.\n' ...
            'First input is: DH (Denavit–Hartenberg) matrix.\nSecond input is: From which fram we want to start.\nThird input is: To which fram we want to end.' ...
            '\n\nTry a new input!']);
        error(msg)
    end

    if from == to
        HTcm = eye(4);
        return
    end

    row = DHcm(to,:);
    theta = row(1);
    d = row(2);
    a = row(3);
    alpha = row(4);
    A = [cos(theta)   -sin(theta)*cos(alpha)   sin(theta)*sin(alpha)    a*cos(theta);
         sin(theta)   cos(theta)*cos(alpha)    -cos(theta)*sin(alpha)   a*sin(theta);
         0            sin(alpha)               cos(alpha)                          d;
         0            0                        0                                   1];
   
    HTcm = DHtoHT_Distal(DH,from,to-1)*A;
    
end


