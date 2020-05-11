function H = laplacianTF4e(P, Q)

H = zeros(P, Q);
for i = 1:P
    for j = 1:Q
        H(i, j) = -4 *(pi^2) * (i^2 + j^2);
    end
end
