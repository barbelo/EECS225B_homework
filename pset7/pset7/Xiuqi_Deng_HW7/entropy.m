function h = entropy(img)
[m, n] = size(img);
t = zeros(1, 256);
for i = 1:256
    t(i) = length(find(img == (i - 1))) / (m * n);
end

h = 0.0;
for i = 1:256
    if(t(i) > 0)
        h = h - t(i) * log2(t(i));
    end
end


