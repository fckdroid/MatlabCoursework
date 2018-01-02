function [x_opt, y_opt] = Bisection(fun, a, b)
    k_min = 0.03;
    k = abs(b - a);

    while k > k_min
        x_sr = (a + b) / 2;
        k = abs(b - a);
        f_x_sr = fun(x_sr);

        x1 = a + k / 4;
        x2 = b - k / 4;
        f_x1 = fun(x1);
        f_x2 = fun(x2);

        if f_x1 < f_x_sr
            b = x_sr;
            x_sr = x1;
        end

        if f_x1 >= f_x_sr
            if f_x2 < f_x_sr
               a = x_sr; 
               x_sr = x2;
            end

            if f_x2 >= f_x_sr
               a = x1; 
               b = x2; 
            end
        end

        k = abs(b - a);
    
        if k <= k_min
            x_opt = x_sr;
            y_opt = f_x_sr;
        end
    end
end