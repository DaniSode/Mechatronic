function HT = DHtoHT_Distal(DH,from,to)
    
    if size(DH,1) < to || 0 > from || to < from
        msg = sprintf(['There is something wrong with the input to the function.\n' ...
            'First input is: DH (Denavit–Hartenberg) matrix.\nSecond input is: From which fram we want to start.\nThird input is: To which fram we want to end.' ...
            '\n\nTry a new input!']);
        error(msg)
    end

    if from == to
        HT = eye(4);
        return
    end

    HT = [];
    A = [];

    for i = 1:size(DH,1)

        if i-1 == to
            break
        end

        row = DH(i,:);
        theta = row(1);
        d = row(2);
        a = row(3);
        alpha = row(4);
        A = [cos(theta)   -sin(theta)*cos(alpha)   sin(theta)*sin(alpha)    a*cos(theta);
             sin(theta)   cos(theta)*cos(alpha)    -cos(theta)*sin(alpha)   a*sin(theta);
             0            sin(alpha)               cos(alpha)                          d;
             0            0                        0                                   1];

        if i-1 == from
            HT = A;
            continue
        end

        if isempty(HT) == 0 
            HT = HT*A;
        end

    end

end
