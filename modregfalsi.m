function [zero,funcCount] = modregfalsi(f,a,b,mew,tol,maxit)
%Input: f is a function handle for the function were are finding a zero
%for. a and b are two initial iterates that must differ in sign. mew is a
%function that computes the reduced or "fake" function value. tol is the
%tolerance in x for which we can consider the iterates as converged, maxit
%is the maximum number of iterates that the method can run. 

fa=f(a); fb=f(b);
x = b; fx = fb;

%Let n be the number of function evaluations.
n=2;

i = 1;
while ((i<=maxit) && (abs(b-a)>tol) && (fx ~= 0))
    
    %convergence criteria
    m = 0.5*(b - a);
    toler = 2.0*tol*max(abs(b),1.0);
    if (abs(m) <= toler) || (fb == 0.0) 
        break
    end
    
    i = i+1;
    %Step of secant. 
    dx = -fx/(fb-fa) * (b-a);
    x = x+dx; 
    
    %step of delta
    if abs(x-b) < tol; x = b - tol*sign(b-a); end
    
    fx = f(x);
    n = n+1;
    if fx*fb <0
        a = b; fa = fb;
        fprintf('u')
    else
        fa = mew(fa,fb,fx);
        fprintf('m')
    end
    b=x; fb=fx;
end
zero = x;
funcCount = n;
format = 'n: %4d  f(x): %16e\n';
fprintf(format,n,fx); 
end