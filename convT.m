
% M = reshape(1:9, 3, 3)';
M = round(rand(12))
tic()

[rM, cM] = size(M);
R = zeros(rM+2, cM+2);
R = [[M(end,end),M(end,:),M(end,1)];...
    [M(:,end),M(:,:),M(:,1)];...
    [M(1,end),M(1,:),M(1,1)]];
mask = [1, 1, 1; 1, 0, 1; 1, 1, 1];
mSum = convn(R, mask, 'same')(2:end-1,2:end-1)
Mc = M & (mSum > 1) & (mSum < 4) | (~M & (mSum == 3))
imagesc(xor(Mc, M))
colormap([0,0,1;0,1,0])

1/toc()

% R(1,:) = [M(end,end),M(end,:),M(end,1)];
% R(2:rM+1,1:cM+2) = [M(:,end),M(:,:),M(:,1)];
% R(rM+2,:) = [M(1,end),M(1,:),M(1,1)];

% mSum = convn(R, mask, 'same');
% mSum = mSum(2:end-1,2:end-1);
