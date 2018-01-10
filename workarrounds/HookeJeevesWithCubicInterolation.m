function [x1, y1, x2, y2, x3, y3] = HookeJeevesWithCubicInterolation(fun, x0, y0, ax, bx, exp)
ay=ax;
by=bx;
q=0.1;
x3=x0;
y3=y0;
k3=1;

while (exp >= q)
    x0=x3;
    y0=y3;
    
    x1=x0;
    y1=y0;
    flag=10;
    while (exp>=q && (x1==x0) && (y1==y0))
        if (fun(x0, y0) > fun(x0 + exp, y0 + exp*(k3-1)))
            x1 = x0 + exp*k3;
            y1 = y0 + exp*(k3-1);
            flag=0;
        else if (fun(x0, y0) > fun(x0 - exp*(k3-1), y0 + exp))
                x1 = x0 - exp*(k3-1);
                y1 = y0 + exp*k3;
                flag=1;
            else if (fun(x0, y0) > fun(x0 - exp, y0 - exp*(k3-1)))
                    x1 = x0 - exp*k3;
                    y1 = y0 - exp*(k3-1);
                    flag=0;
                else if (fun(x0, y0) > fun(x0 + exp*(k3-1), y0 - exp))
                        x1 = x0 + exp*(k3-1);
                        y1 = y0 - exp*k3;
                        flag=1;
                    else
                        exp = exp / 2;
                    end
                end
            end
        end
    end
    
    x2=x1;
    y2=y1;
    while (exp>=q && (x1==x2) && (y1==y2))
        line([x0,x1],[y0,y1],'Color','r','LineWidth',1.5)
        x2 = x1;
        y2 = y1;
        if (x0 ~= x1 && y0 == y1)
            if (fun(x1, y1) > fun(x1, y1 + exp))
                x2 = x1;
                y2 = y1 + exp;
            else if (fun(x1, y1) > fun(x1, y1 - exp))
                    x2 = x1;
                    y2 = y1 - exp;
                else
                    exp = exp / 2;
                end
            end
        end
        if (y0 ~= y1 && x0 == x1)
            if (fun(x1, y1) > fun(x1 + exp, y1))
                x2 = x1 + exp;
                y2 = y1;
            else if (fun(x1, y1) > fun(x1 - exp, y1))
                    x2 = x1 - exp;
                    y2 = y1;
                else
                    exp = exp / 2;
                end
            end
        end
        if (y0 ~= y1 && x0 ~= x1)
            if (flag==0)
                if (fun(x1, y1) > fun(x1 - exp*(k3-1), y1 - exp*k3))
                    x2 = x1 - exp*(k3-1);
                    y2 = y1 - exp*k3;
                else if(fun(x1, y1) > fun(x1 + exp*(k3-1), y1 + exp*k3))
                        x2 = x1 + exp*(k3-1);
                        y2 = y1 + exp*k3;
                    else
                        exp = exp / 2;
                    end
                end
            end
            if (flag==1)
                if (fun(x1, y1) > fun(x1 - exp*k3, y1 + exp*(k3-1)))
                    x2 = x1 - exp*k3;
                    y2 = y1 + exp*(k3-1);
                else if(fun(x1, y1) > fun(x1 + exp*k3, y1 - exp*(k3-1)))
                        x2 = x1 + exp*k3;
                        y2 = y1 - exp*(k3-1);
                    else
                        exp = exp / 2;
                    end
                end
            end
        end
    end
    if (x2 ~= x1 || y2 ~= y1)
        line([x1,x2],[y1,y2],'Color','g','LineWidth',1.5)
        k=(y2-y0)/(x2-x0);
        if((y2-y0)>0)
            line([x0,(by-y0)/k+x0],[y0,by],'Color','b','LineWidth',1.5)
        end
        if((y2-y0)<0)
            line([x0,(ay-y0)/k+x0],[y0,ay],'Color','b','LineWidth',1.5)
        end
    end
    
    try
        e = 0.01;
        if ((y2 - y0) > 0)
            if (abs(k) >= 1)
                y3=Dichotomy(fun,x0,y0,y0,by,k,e);
                x3=x0+(y3-y0)/k;
                k31=(y3 - y0)/sqrt((y3 - y0)*(y3 - y0)+(x3 - x0)*(x3 - x0));
            else
                x3=Dichotomy(fun,x0,y0,x0,bx,k,e);
                y3=k*(x3 - x0)+y0;
                k31=(y3 - y0)/sqrt((y3 - y0)*(y3 - y0)+(x3 - x0)*(x3 - x0));
            end
            
        else
            if (abs(k) >= 1)
                y3=Dichotomy(fun,x0,y0,ay,y0,k,e);
                x3=x0-(y0-y3)/k;
                k31=(y3 - y0)/sqrt((y3 - y0)*(y3 - y0)+(x3 - x0)*(x3 - x0));
            else
                x3=Dichotomy(fun,x0,y0,ax,x0,k,e);
                y3=y0-k*(x0-x3);
                k31=(y3 - y0)/sqrt((y3 - y0)*(y3 - y0)+(x3 - x0)*(x3 - x0));
            end
        end
        
    catch
        msgbox('invalid arg')
    end
    k3 = k31;
end
end
