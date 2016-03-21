function [A L] = citire(file)
fid = fopen(file,'r');#cu ajutorul functie citire voi citi din fisier si voi construi matricea de adiacenta A si L
n = fscanf(fid,"%d",1);#citesc  n = numarul de noduri
A = zeros(n,n); # initializez matricea de adiacenta cu 0
for i=1:n
	i = fscanf(fid,"%d",1); # citesc fiecare nod
	L(i) = fscanf(fid,"%d",1);#citesc numarul de vecini
		for j=1:L(i)
			vecin = fscanf(fid,"%d",1); # adaug in matricea de adiacenta vecinul doar daca acesta nu este chiar el insusi
			if i==vecin 
				A(i,i)=0;
				L(i)=L(i)-1;
			else
				A(i,vecin)=1;
			endif
		endfor
endfor
fclose(fid)
endfunction

