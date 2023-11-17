function [Q, R] = qrmgh(A)
	[m, n] = size(A);
	Q = zeros(m, n);
	R = zeros(n, n);
	Q = A;
	for j = 1:n
		R(j, j) = norm(Q(:, j));
		Q(:, j) = Q(:, j) / R(j, j);
		for k = j + 1:n
			R(j, k) = Q(:, j)' * Q(:, k);
			Q(:, k) = Q(:,k) - R(j, k) * Q(:, j);
		end
	end
end