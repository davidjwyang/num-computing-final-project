function Tests()
%Testing the performances of the algorithms on various functions.  
    fun = {@f1,@f2,@f3,@f4,@f5,@f6,@f7,@f8,@f9,@f10,@f11,@f12,@f13,@f14,@f15,@f16,@f17,@f18,@f19,@f20,@f21,....
        @f22,@f23,@f24,@f25,@f26,@f27,@f28,@f29,@f30,@f31,@f32,@f33,@f34,@f35,@f36,@f37,@f38,@f39,@f40,@f41,....
        @f42,@f43,@f44,@f45,@f46};
    
    
    tol = 10^(-16); %Tolerance
    maxit = 1000; %Maximum Number of Itertions
    %Initialize the arrays that hold the function values
    fevals_A = zeros(55,1);
    fevals_wheeler = zeros(55,1);
    fevals_pegasus = zeros(55,1);
    fevals_brent = zeros(55,1);
    
    n = 0;
    %Run the methods and save the number of function evaluations 
    for i = 5:5%length(fun)
        [end_pts,f] = fun{i}();
        [a,b,k] = end_pts();
        for j = 1:k
            n = n+1;
           [~,fevals_A(n)] = AlgorithmA(f,a(j),b(j),tol,maxit);
           [~,fevals_wheeler(n)] = modregfalsi(f,a(j),b(j),@wheeler,tol,maxit);
           [~,fevals_pegasus(n)] = modregfalsi(f,a(j),b(j),@pegasus,tol,maxit);
           options = optimset('FunValCheck','on','TolX',tol);
           [x,fval,exitflag,output] = fzero(f,[a(j),b(j)],options);
           fevals_brent(n) = output.funcCount;
        end
    end
    
    %Diplay a mean number of function evaluation
    avg_funcCount_A = mean(fevals_A)
    avg_funcCount_wheeler = mean(fevals_wheeler)
    avg_funcCount_pegasus = mean(fevals_pegasus)
    avg_funcCount_brent = mean(fevals_brent)
    
    %Run a script that displays the number of function evaluations for each
    %function. 
    %Tests1
end


function [i,f] = f1()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a = 0; b = 1.5; n=1;
    end
    
    function f = evaluate(x)
        f = sin(x) - 0.5;
    end
end

function [i,f] = f2()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a = 0; b = 1; n=1;
    end
    function f = evaluate(x)
        f = 2*x*exp(-7)+1-2*exp(-7*x);
    end
    
end

function [i,f] = f3()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a = 0; b = 1; n=1;
    end
    
    function f = evaluate(x)
        f = x^2-(1-x)^20;
    end
end

function [i,f] = f4()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a = 0; b = 1; n=1;
    end
    
    function f = evaluate(x)
        f = 1+(1+(1-15)^4)*x-(1-15*x)^4;
    end
end

function [i,f] = f5()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a = -2; b = 4; n = 1;
    end
    
    function f = evaluate(x)
        f = -(x+sin(x))*exp(-x) ;
    end       
end

function [i,f] = f6()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a = -9; b = 9; n=1;
    end
    
    function f = evaluate(x)
        f = -(x+sin(x))*exp(abs(x));
    end   
end

function [i,f] = f7()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a = 0; b = 1; n=1;
    end
    
    function f = evaluate(x)
        f = exp(-10*x)*(x-1)+x^10;

    end
end


function [i,f] = f8()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a = .01; b = 1.0; n=1;
    end

    function f = evaluate(x)
        f = (2*x-1)/x;
    end
end

function [i,f] = f9()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a = 0; b = 1.0; n=1;
    end
    
    function f = evaluate(x)
        f = sqrt(x) - cos(x);
    end
end

function [i,f] = f10()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a(1) = -2.0; b(1) = .5;
        a(2) = -.5; b(2) = 2.5;
        n=2;
    end
    
    function f = evaluate(x)
        f = 3*(x+1)*(x-5)*(x-1);
    end
end

function [i,f] = f11()
    i = @get_end_points;
    f = @evaluate;
    
    function [a,b,n] = get_end_points()
        a(1) = 0.0; b(1) = 1.0;
        a(2) = 3.2; b(2) = 4.0;
        n = 2;
    end
    
    function f = evaluate(x)
        f = x^3 -7*x^2 + 14*x -6;
    end
end

function [i,f] = f12()
    i = @get_end_points;
    f = @evaluate;

    function [a,b,n] = get_end_points()
        a(1) = -2.0; b(1) = -1.0;
        a(2) = 0.0; b(2) = 2.0;
        n = 2;
    end
    function f = evaluate(x)
        f = x^4 -2*x^3 -4*x^2 + 4*x +4;
    end
end

function [i,f] = f13()
    i = @get_end_points;
    f = @evaluate;

    function [a,b,n] = get_end_points()
        a = 0.0; b(1) = 1.0;
        n = 1;
    end
    function f = evaluate(x)
        f = x-2*(-x);
    end
end

function [i,f] = f14()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a = 0.0; b(1) = 1.0;
        n = 1;
    end
    function f = evaluate(x)
        f = exp(x) - x^2 + 3*x -2;
    end 
end

function [i,f] = f15()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = -3.0; b(1) = -2.0;
        a(2) = -1.0; b(2) = 0.0;
        n = 2;
    end  
    function f = evaluate(x)
        f = 2*x*cos(2*x) - (x+1)^2;
    end
end

function [i,f] = f16()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a = 1.0; b(1) = 2.0;
        n = 1;
    end
    function f = evaluate(x)
        f = 3*x - exp(x);
    end
end

function [i,f] = f17()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a = 0.0; b(1) = 1.0;
        n = 1;
    end
    function f = evaluate(x)
        f = x + 3*cos(x) - exp(x);
    end  
end

function [i,f] = f18()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 1.0; b(1) = 2.0;
        a(2) = 2.0; b(2) = 4.0;
        n = 2;
    end  
    function f = evaluate(x)
        f = x^2 - 4*x + 4 -log(x);
    end  
end

function [i,f] = f19()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = -3; b(1) = 1;
        a(2) = -2; b(2) = 0;
        n = 2;
    end  
    function f = evaluate(x)
        f = x + 1 -sin(pi*x);
    end   
end

function [i,f] = f20()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = -1.0; b(1) = 2.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = exp(x) -2 - cos(exp(x-2));
    end       
end

function [i,f] = f21()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = -0.5; b(1) = .5;
        a(2) = -3.0; b(2) = -1.5;
        a(3) = -2.3; b(3) = -1.5;
        n = 3;
    end  
    function f = evaluate(x)
        f = (x+2)*(x+1)^2 *x*(x-1)^3 *(x-2);
    end       
end

function [i,f] = f22()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 1.0; b(1) = 2.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = x^4 -3*x^2 -3;
    end       
end

function [i,f] = f23()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 1.0; b(1) = 2.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = x^3 -x -1;
    end       
end

function [i,f] = f24()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 0.0; b(1) = 6.3;
        n = 1;
    end  
    function f = evaluate(x)
        f = pi + 5*sin(x/2) - x;
    end             
end

function [i,f] = f25()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 0.3; b(1) = 1.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = 2^(-x)-x;
    end         
end

function [i,f] = f26()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = -5.0; b(1) = 5.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = (2-exp(-x)+x^2)/3 -x;
    end            
end

function [i,f] = f27()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 1.0; b(1) = 5.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = 5*x^(-2)+2 -x;
    end            

end

function [i,f] = f28()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 1; b(1) = 2;
        a(2) = 1.3; b(2) = .2;
        n = 2;
    end  
    function f = evaluate(x)
        f = exp(x)/3 -x;
    end            
end

function [i,f] = f29()
    i = @get_end_points;
    f = @evaluate;

    function [a,b,n] = get_end_points()
        a(1) = -2.0; b(1) = 5.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = 5^(-x) -x;
    end            
    
end

function [i,f] = f30()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = -2.0; b(1) = 1.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = 5*(sin(x)+cos(x))-x;
    end            
end

function [i,f] = f31()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = -3.0; b(1) = 3.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = -x^3 -cos(x);
    end    
end

function [i,f] = f32()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = -4.0; b(1) = 1.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = -x^3 -2*x^2-5;
    end    
end

function [i,f] = f33()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = -3.0; b(1) = -2.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = x^3 + 3*x^2 -1;
    end   
end

function [i,f] = f34()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 0.0; b(1) = 1.6;
        n = 1;
    end  
    function f = evaluate(x)
        f = x- cos(x);
    end   
end

function [i,f] = f35()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 0.0; b(1) = 14;
        n = 1;
    end  
    function f = evaluate(x)
        f = x - 8 - 2*sin(x);
    end   
end

function [i,f] = f36()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 1.0; b(1) = 2.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = exp(x) + 2^(-x) + 2*cos(x) -6;
    end   
end

function [i,f] = f37()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 1.3; b(1) = 2.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = log(x-1) + cos(x-1);
    end     
end

function [i,f] = f38()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 2.0; b(1) = 3.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = 2*x*cos(2*x) - (x-2)^2;
    end   
end

function [i,f] = f39()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 3.0; b(1) = 5.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = exp(x) - 3*x^2;
    end    
end

function [i,f] = f40()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 0.0; b(1) = 1.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = sin(x) - exp(-x);
    end    
end

function [i,f] = f41()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 1.0; b(1) = 2.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = 3*x -exp(x);
    end    
end

function [i,f] = f42()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 0.0; b(1) = 1.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = x +3*cos(x) -exp(x);
    end    
end

function [i,f] = f43()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 1.0; b(1) = 2.0;
        n = 1;
    end  
    function f = evaluate(x)
        f = x^2 -4*x +4 -log(x);
    end    
end

function [i,f] = f44()
    i = @get_end_points;
    f = @evaluate;
    %a = 0.0, b = 0.5
    %a = 0.5, b = 1.0
    function [a,b,n] = get_end_points()
        a(1) = 0.0; b(1) = 0.5;
        a(2) = 0.5; b(2) = 1.0;
        n = 2;
    end  
    function f = evaluate(x)
        f = x +1 -2*sin(pi*x);
    end    
end

%flat function. 
function [i,f] = f45()
    i = @get_end_points;
    f = @evaluate;

    function [a,b,n] = get_end_points()
        a(1) = -9; b(1) = 9;
        n = 1;
    end  
    function f = evaluate(x)
        f = exp(1/(x-10)^2)-1.2;
    end    
end

%convex function 
function [i,f] = f46()
    i = @get_end_points;
    f = @evaluate;
    function [a,b,n] = get_end_points()
        a(1) = 6; b(1) = 9;
        n = 1;
    end  
    function f = evaluate(x)
        f = exp(x)+10-1000;
    end    
   
end




