function A = tstudentdist(n,x)

% Função densidade de probabilidade
f = @(n,x) gamma((n+1)/2)/(sqrt(n*pi)*gamma(n/2))*(1+x.^2./n).^(-(n+1)/2);

linf = 0; dx = (x-linf)/5000;

%a = linf:0.001:-linf; b = f(n,a); plot(a,b,'r'); hold on

A = .5;
for i = linf:dx:x
   v = f(n,i); 
   A = A + dx*v;
    
%  plot([i-dx/2 i-dx/2],[0 v],'b');
%  plot([i+dx/2 i+dx/2],[0 v],'b');
%  plot([i-dx/2 i+dx/2],[v v],'b');
  
end