function J = HTtoJ(DH,from,to)
    
    if size(DH,1) < to || 0 > from || to < from
        msg = sprintf(['There is something wrong with the input to the function.\n' ...
            'First input is: DH (Denavit–Hartenberg) matrix.\nSecond input is: From which frame we want to start.\nThird input is: To which fram we want to end.' ...
            '\n\nTry a new input!']);
        error(msg)
    end

    HTj = DHtoHT_Distal(DH,from,to);
    tj = HTj(1:3,4);
    J = [];
   
    for i = 1:size(DH,1)
        
        if i > to
            J = [J , zeros(6,1)];
        else
            HT = DHtoHT_Distal(DH,0,i-1);
            z = HT(1:3,3);
            t = HT(1:3,4);
            J = [J , [cross(z,(tj-t));z]];  
        end

    end
  
end