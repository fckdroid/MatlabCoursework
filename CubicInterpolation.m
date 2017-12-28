function [xMin, yMin, k3] = CubicInterpolation(fun, x1, delta, eps1, eps2)

% 2) Find derivative of fun at X
syms x
dx = diff(fun(x), 'x');


% 3) Check devirative sign and find M
M = 0;
while true
    dx0 = subs(dx, x, x1);
    if dx0 < 0
        x2 = x1 + 2.^M * delta;
    else
        x2 = x1 - 2.^M * delta;
    end
    
    dx1 = subs(dx, x, x2);
    M = M + 1;
    if dx0 * dx1 <= 0
        break
    else
        x1 = x2;
    end
end

while true
    % 4) Find f1 f2 dx0 dx1
    f1 = subs(fun, x, x1);
    f2 = subs(fun, x, x2);
    dx0 = subs(dx, x, x1);
    dx1 = subs(dx, x, x2);
    
    % 5) Find min of cubic polynom
    z = 3 * (f1 - f2) / (x2 - x1) + dx0 + dx1;
    w = (z^2 - dx0 * dx1)^(1/2);
    if x1 > x2
        w = -w;
    end
    mu = (dx1 + w - z) / (dx1 - dx0 + 2*w);
    if mu < 0
        xFinal = x2;
    elseif (mu >= 0 && mu <= 1)
        xFinal = x2 - mu * (x2 - x1);
    else
        xFinal = x1;
    end
    
    fxFinal = subs(fun, x, xFinal);
    
    % 6) Ñheck condition of decrease
    if fxFinal < f1
        % 7) check condition of ending
        dxFinal = subs(dx, x, xFinal);
        if abs(dxFinal) <= eps1 && abs((xFinal - x1) / xFinal) <= eps2
            break;
        else
            if dxFinal * subs(dx, x, x1) < 0
                x2 = x1;
                x1 = xFinal;
            elseif dxFinal * subs(dx, x, x2) < 0
                x1 = xFinal;
            end
        end
    else
        while true
            xFinal = xFinal - (xFinal - x1) / 2;
            fxFinal = subs(fun, x, xFinal);
            if fxFinal <= f1
                break
            end
        end
    end
end

xMin = xFinal;
yMin = subs(fun, x, xFinal);
k3 = eps1;
end