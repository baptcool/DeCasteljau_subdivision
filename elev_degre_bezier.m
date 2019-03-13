
%disp(’Click gauche pour insérer les points de contrôle et click droit pour le dernier et terminer.’);
touche = 1 
figure
axis([0 10 0 10])
grid on
hold on
x = []
y = []
i = 0
while touche == 1
  i +=1
  [xi,yi,touche] = ginput(1);
  plot(xi,yi,'r*');
  
  x = [x xi];
  y = [y yi];
end
n = length(x)  
plot(x,y,'g')
%*************************************************
x1 = []
y1 = []
x1 = x(1)
y1 =  y(1)
for i = 2:n
  v = ((i-1)/(n+1))*[x(i-1),y(i-1)] + ((n+1-(i-1))/(n+1))*[x(i),y(i)]
  x1 = [x1  v(1)];
  y1 = [y1  v(2)];
endfor
  x1 = [x1  x(n)];
  y1 = [y1  y(n)];
  plot(x1,y1,'o')
  plot(x1,y1,'m')
tracer_courbe_bezier(x,y)
tracer_courbe_bezier(x1,y1)