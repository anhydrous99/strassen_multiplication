function f = strassen_multiplication(a, b)
  [n,~] = size(a);
  f = zeros(n,n);

  if n <= 48
    f = matrix_multiplication(a,b);
    return
  end
  nhalf = int32(n/2);
  a11 = a(1:nhalf,1:nhalf);
  a12 = a(1:nhalf,nhalf+1:n);
  a21 = a(nhalf+1:n,1:nhalf);
  a22 = a(nhalf+1:n,nhalf+1:n);

  b11 = b(1:nhalf,1:nhalf);
  b12 = b(1:nhalf,nhalf+1:n);
  b21 = b(nhalf+1:n,1:nhalf);
  b22 = b(nhalf+1:n,nhalf+1:n);

  m1 = strassen_multiplication(a11 + a22, b11 + b22);
  m2 = strassen_multiplication(a21 + a22, b11);
  m3 = strassen_multiplication(a11, b12 - b22);
  m4 = strassen_multiplication(a22, b21 - b11);
  m5 = strassen_multiplication(a11 + a12, b22);
  m6 = strassen_multiplication(a21 - a11, b11 + b12);
  m7 = strassen_multiplication(a12 - a22, b21 + b22);
  

  f(1:nhalf,1:nhalf) = m1 + m4 - m5 + m7;
  f(1:nhalf,nhalf+1:n) = m3 + m5;
  f(nhalf+1:n,1:nhalf) = m2 + m4;
  f(nhalf+1:n,nhalf+1:n) = m1 - m2 + m3 + m6;
  return
end