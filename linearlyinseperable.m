function [x1, x2, y, theta] = linearlyinseperable(l)
    theta = [(-1 + 2*rand(1, 1)) randi(100, 1, 1)];
    y = ones(1, l);
    x1 = randi(100, 1, l);
    [tempx, idx] = datasample(x1, (l/2), 'Replace', false);
    x2 = zeros(1,l);
    for i = 1:l
        tempx2 = theta(1)*x1(i) + theta(2);    
        if ismember(i, idx) == 0
            if tempx2 < 0
                tempx2 = tempx2*(2-(rand(1, 1)));
                x2(i) = tempx2;
            else
                tempx2 = tempx2*(rand(1, 1));
                x2(i) = tempx2;
            end  
        else
            tempx2 = tempx2 + (abs(100-tempx2))*(rand(1, 1));
            x2(i) = tempx2;
        end
        if rem(i, 2) == 0
            y(i) = -1;
        else
            y(i) = 1;
        end
    end
    x2 = x2';
    x1 = x1';
    y = y';
end