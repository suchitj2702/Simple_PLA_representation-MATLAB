type = 1;
numpoints = 10;
if type == 1
    [x1, x2, y, theta] = linearlyseperable(numpoints);
    numepochs = 50000;
    graphgap = 50;
else
    [x1, x2, y, theta] = linearlyinseperable(numpoints);
    numepochs = 5000;
    graphgap = 100;
end

figure;
hold on;
pos = find(y==1);
neg = find(y==-1);

plot(x1(pos), x2(pos), 'ko', 'MarkerFaceColor', 'g');
plot(x1(neg), x2(neg), 'ko', 'MarkerFaceColor', 'r');
xlabel('x1');
ylabel('x2');

hold off;

x = [ones(numpoints, 1) x1 x2];

delta = 0.5;
initialW = [0 1000 0];
w = initialW;
check = 0;
epoch = 0;
figure;
hold on;
while 1
    epoch = epoch + 1;
    for n = 1:length(y)
        w = w + delta * x(n, :) * (y(n)-sign(x(n,:)*w'));
        if sign(x*w') == y
            check = 1;
            break;
        end
    end
    if check == 1 || epoch == numepochs
        if type == 1
            g = @(x1, x2) w(1)+ w(2)*x1 + w(3)*x2;
            fimplicit(g,'Color', 'g', 'LineWidth', 3);
        else
            g = @(x1, x2) w(1)+ w(2)*x1 + w(3)*x2;
            fimplicit(g,'Color', 'm', 'LineWidth', 3);
        end
        break;
    end
    if rem(epoch,50) == 0
        g = @(x1, x2) w(1)+ w(2)*x1 + w(3)*x2;
        fimplicit(g,'Color', 'r');
    end
    disp(epoch);
end

pos = find(y==1);
neg = find(y==-1);

plot(x1(pos), x2(pos), 'ko', 'MarkerFaceColor', 'g');
plot(x1(neg), x2(neg), 'ko', 'MarkerFaceColor', 'r');
xlabel('x1');
ylabel('x2');
