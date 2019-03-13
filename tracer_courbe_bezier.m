%Millot Duchange
% exemple d'appelle de fonction --> % tracer_courbe_bezier([0 0 1 1 ], [0 1 1 0])
function []  = tracer_courbe_bezier(px,py)
     t = [0:0.005:1]
     n= length(px)-1 %n est égale aux nombres de points -1
     somme =0
     for k = 1: length(t)
       for i = (1:(n+1))
              somme += [px(i),py(i)]*bernstein(n,i-1,t(k))     %voici la formule
       end
       x(k) = somme(1) %on récupère la coordonnée en x
       y(k) = somme(2);%en y
       somme = 0;
     end
     
      plot(x,y)
      
endfunction

function[b] = bernstein(n,i,t)
      b = bnew(n,i) * (t^i)*((1-t)^(n-i))
endfunction

function[f] = bnew(n,a) 
  f = factorial(n)/(factorial(n-a)*factorial(a))
endfunction