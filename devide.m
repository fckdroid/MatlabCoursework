function [x, y] = devide(func, ax1, bx1,ay,by, del,v)
    z_min = 100000000000;
    ax = ax1;
    bx = bx1;
    x_min = 0;
    y_min = 0;
    x_avg = (ax + bx) / 2 ;  
    
    while abs((ax - bx)) >= del
        avg_left = (ax + x_avg) / 2;
        avg_right = (x_avg + bx) / 2;     
        if(func(ax,v(2)) > func(x_avg,v(2)) && func(bx,v(2)) > func(x_avg,v(2)))
                ax =  avg_left;
                bx =  avg_right;
        else if(func(ax,v(2)) > func(x_avg,v(2)))
                ax = x_avg; 
            else
                bx = x_avg;
            end
        end
        x_avg = (ax + bx) / 2;
       if (func(x_avg,v(2)) < z_min)
           z_min = func(x_avg,v(2));
           x_min = x_avg;
           y_min = v(2);
       end;   
    end;
    
    y_avg = (ay + by) / 2;
    while abs((ay - by))  > del
          avg_left = (ay + y_avg) / 2;
        avg_right = (y_avg + by) / 2;     
        if(func(x_min,ay) > func(x_min,y_avg) && func(x_min,by) > func(x_min,y_avg))
                ay =  avg_left;
                by =  avg_right;
        else if(func(x_min,ay) > func(x_min,y_avg))
                ay = y_avg; 
            else
                by = y_avg;
            end
        end
        y_avg = (ay + by) / 2;
        if(func(x_min,y_avg) < z_min)
            z_min = func(x_min,y_avg);
            y_min = y_avg;
        end     
    end
        x = x_min;
        y = y_min;