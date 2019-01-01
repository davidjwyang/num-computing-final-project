function [root,n] = wheeler1(f,x0,x1,tol,maxit)
    k=1; mew=1; n=2; 
    mew_list = zeros(1,maxit);
    while abs(x1-x0)>=tol && k<=maxit && x1 ~= 0
        n = n+1;
        x2 = x1 - f(x1)*(x1-x0)/(f(x1)-mew*f(x0));
        if f(x2)*f(x1)<0
            mew = 1; x0=x1;
        else 
            mew = mew/2;
        end
        x1=x2;
        mew_list(k) = mew;
        k=k+1;
    end
    root = x1;
end