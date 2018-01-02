function min = Dichotomy(fun,x0,y0,ay,by,k,e)

while(abs(by-ay)>e)
    x1 = x0+(((ay + by) / 2 + ay) / 2-y0)/k;
    x2 = ((ay + by) / 2 + ay) / 2;
    fx1=fun(x1, x2);
    
    x1 = x0+(((ay + by) / 2 + by) / 2-y0)/k;
    x2 = ((ay + by) / 2 + by) / 2;
    fx2=fun(x1, x2);
    
    if (fx1<=fx2)
        by=(ay + by) / 2;
    else
        ay=(ay + by) / 2;
    end
end

min = (ay + by) / 2 + 0.003;

end


