function B = GramSchmidt(A)
[n n] = size(A);
Q = zeros(n);
R = zeros(n);
B = zeros (n);
for j = 1:n
	for i = 1:j-1
		R(i,j) = Q(:, i)' * A(:,j);
	endfor
	s = zeros(n, 1);
	for i = 1:j-1
		s = s + R(i, j) * Q(:, i);
	endfor
	aux = A(:, j) - s;
	R(j, j) = norm(aux, 2);
	Q(:, j) = aux/ R(j, j);
endfor
#Acesta este algoritmul lui GramSchmidt si el genereaza o matrice superior triunghiulara R si o matrice ortogonala Q 
#Q*R = A /A^-1 => Q*R*A^-1 = I /Q^t => R*A^-1 = Q^t
# Mai jos este aflarea matricei A^-1 cu ajutorul algoritmului de rezolvare a sistemului superior triunghiular
qtranspus=Q';
for i =1:n
	b = B(:,i);
	qcoloana = qtranspus(:,i);
	b(n) = qcoloana(n) / R(n,n);
	for j = n-1:-1:1
		b(j) = (qcoloana(j)-R(j,j+1:n)*b(j+1:n))/R(j,j);
	endfor
	for l=1:n
		B(l,i) = b(l);
	endfor
endfor
endfunction
