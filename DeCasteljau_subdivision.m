
% DeCasteljau_subdivision([1 0.5; 2 6; 5 7; 8 6; 9 0.5])

function[] = DeCasteljau_subdivision(points)
%**********************
for i=1:length(points)
  Pix(i) = points(i,1)
  Piy(i) = points(i,2)
end
  hold on
  
  
  %******************
  PX=zeros(length(points),length(points));
  PY=zeros(length(points),length(points));
  for i = 1: length(points)
    PX(i,1) = points(i,1)
    PY(i,1) = points(i,2)
  endfor
   x = (0:0.2:1)
	 

    for i=(1:length(x))
      v = calculs(PX,PY,2,length(points),x(i))
      X1(i) = v(1)    
      X2(i) = v(2)  
    endfor
    %figure
    plot(X1,X2,'k')
    hold on
    tracer_courbe_bezier(X1,X2)
endfunction

function[v] = calculs(pointsX,pointsY, k, n, t)
  if(k-1 == n)
    v(1) = pointsX(1,n)
    v(2) = pointsY(1,n)
  else
    for i = 1: n-k+1
      pointsX(i,k) = (1-t) * pointsX(i,k-1) + t*pointsX(i+1,k-1)
      pointsY(i,k) = (1-t) * pointsY(i,k-1) + t*pointsY(i+1,k-1)
    endfor
    v = calculs(pointsX,pointsY, k+1, n, t)
   endif
endfunction