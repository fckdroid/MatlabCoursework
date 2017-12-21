function s = newton(f, p0, tol, MaxIter)

num = size(p0,2);

for i=num:-1:1
    vars(i)=sym(['X' num2str(i)]);
end

symFunc = sym(f);

H = hessian(symFunc);
invH = inv(H);

G = gradient(symFunc);

s = zeros(MaxIter,size(p0,2));
s(1,:) = p0;
dsnorm = inf;
iter = 1;

while dsnorm > tol && iter < MaxIter
    dh = subs(invH, vars, s(iter,:));
    dj = subs(G, vars, s(iter,:));
    [~, p]=chol(dh);
    if p ~= 0
        disp('the hessian matrix is not positive!');
        pause
    end
    s(iter+1,:) = s(iter,:) - dj'*dh';
    dsnorm = norm(dj);
    iter = iter+1;
end

s = s(1:iter,:)

end
