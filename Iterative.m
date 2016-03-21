function R = Iterative(file , d , eps)
[A L]=citire(file);
[n n]=size(A);
M=zeros(n,n);
#dupa ce fac citirea si creerea matricei de adiacenta voi creea matricea M cu ajutorul formulei M(i,j)=1/L(j)
for i =1:n
	for j =1:n
		if A(j,i) == 1
			M(i,j) = 1/L(j);
		endif
	endfor
endfor

unu=ones(n,1);
PR=zeros(n,1);
PRR=zeros(n,1);
#PRR este page rangul initial cu ajutorul caruia se va genera page rangul final.

PRR=d*M*PR+((1-d)/n)*unu;
while (norm(PRR-PR)>eps)
	PR=PRR;
	PRR=d*M*PR+((1-d)/n)*unu;
	
endwhile
R=PRR;
endfunction
