function R = Algebraic(file,d)
[A L]=citire(file);#citesc si generez matricea de adiacenta si vectorul cu numarul vecinilor fiecarui nod
[n n] = size(A);
I=eye(n);#initializez I
#generez matricea M
for i =1:n
	for j =1:n
		if A(j,i) == 1
			M(i,j) = 1/L(j);
		endif
	endfor
endfor
unu=ones(n,1);
#Cu ajutorul formulei intorc page rangul algebric
R=GramSchmidt(I-d*M)*unu*(1-d)/n;
endfunction
