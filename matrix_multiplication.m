function f = matrix_multiplication(a, b)
 [n1,m1] = size(a);
 [n2,m2] = size(b);
 f = zeros(n1,m2);
 
  for i = 1:n1
    for j = 1:m2
	  for k = 1:m1
	    f(i,j) = f(i,j) + a(i,k) * b(k,j);
	  end
	end
  end
  
end