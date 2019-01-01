function p = bisection(f,a,b,tol)

% provide the equation you want to solve with R.H.S = 0 form. 
% Write the L.H.S by using inline function
% Give initial guesses.
% Solves it by method of bisection.
% A very simple code. But may come handy
n = 2;
if f(a)*f(b)>0 
    disp('Wrong choice bro')
else
   n= n+1;
   p = (a + b)/2;
   err = abs(f(p));
   while err > tol
   if f(a)*f(p)<0 
       b = p;
   else
       a = p;          
   end
    p = (a + b)/2; 
   err = abs(b-a);
    end
end
disp(n);
end

if abs(x-b) < tol; x = b - tol*sign(b-a); end