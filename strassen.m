n = 2048;
a = rand(n,n);
b = rand(n,n);

fprintf("NAIVE MATMUL\n");
tic;
c1 = matrix_multiplication(a, b);
toc;

fprintf("STRASSEN MATMUL\n");
tic;
c2 = strassen_multiplication(a, b);
toc;

fprintf("MATLAB's MATMUL\n");
tic;
c3 = mtimes(a,b);
toc;

zero1 = abs(c1 - c3);
zero2 = abs(c2 - c3);
avg1 = 0;
avg2 = 0;
for i = 1:n
  for j = 1:n
    avg1 = avg1 + zero1(i, j);
	avg2 = avg2 + zero2(i, j);
  end
end
avg1 = avg1 / (n^2);
avg2 = avg2 / (n^2);
fprintf("Average deviation for naive %d \n", avg1);
fprintf("Average deviation for strassen %d \n", avg2);
per1 = avg1 / (sum(sum(c1)) / n^2) * 100;
per2 = avg2 / (sum(sum(c2)) / n^2) * 100;
fprintf("Percent Average Deviation %d %% \n", per1);
fprintf("Percent Average Deviation %d %% \n", per2);

clear