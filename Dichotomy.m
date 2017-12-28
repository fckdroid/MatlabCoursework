function min = Dichotomy(fun,x0,y0,ay,by,k,e)

while(abs(by-ay)>e)
    fx1=fun(x0+(((ay + by) / 2 + ay) / 2-y0)/k, ((ay + by) / 2 + ay) / 2);
    fx2=fun(x0+(((ay + by) / 2 + by) / 2-y0)/k, ((ay + by) / 2 + by) / 2);
    
    if (fx1<=fx2)
        by=(ay + by) / 2;
    else
        ay=(ay + by) / 2;
    end
end

min = (ay + by) / 2;

end


