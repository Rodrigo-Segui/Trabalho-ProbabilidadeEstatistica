pkg load io;
K = [2,6,5,1,3,1,6];
for i = 1:7
  b = xlsread('dados..xlsx',['Folha',num2str(i)]);
  x = b(:,1); 
  y = b(:,2);
  plot(x,y,'bo');
 correlacaolinear(x,y,i);
  %a'*a*x=a'*y
  k = K(i);
  A = zeros(length(x),k+1);
  for j = 1:k + 1
    A(:,j) = x.^(k + 1 - j);
  endfor
  
  X = A'*A\A'*y;
  t = min(x):0.01:max(x);
  v = zeros(1,length(t));
  for j = 0:k
    v = v + X(k - j + 1)*t.^j;
    z = (k - j + 1)*t.^j;
  endfor
  
  if i == 4 || i == 6
    H = regressao(x,y); 
    a = H(1);
    sig2 = sum((y-mean(v)).^2)/(length(v)-2);
    s2 = sum((z-mean(z)).^2)/(length(z)-1);
    vara = sig2/(length(z)-1)/s2;
    T = (a - 0)/sqrt(vara);
    n = length(z)-2;
    A = 1-0.01/2;
    if abs(T) >= tstudentdistinv(n, A)
     fprintf('Rejeitar a H0: a = 0 \n');
    else
      fprintf('Não rejeitar a H0: a=0 \n');
    endif
   endif
  
  %plotando o gráfico
  hold on  %mesmo gráfico
  
  plot(t,v,'-k');
  hold off  %mesmo gráfico
  pause(10);
endfor