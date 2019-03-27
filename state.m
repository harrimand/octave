%state
% State Machine J-K Flip Flop Calculations

seqLen = 12;

Jt = ['0', '1', 'X', 'X'];
Kt = ['X', 'X', '1', '0'];

dec2gray = @(n) bitxor(n, bitshift(n, -1));

% rp = randperm(seqLen)-1;
rp = randperm(2^ceil(log2(seqLen))-1)(1:seqLen);

rpB = dec2bin(rp);
nQ = length(dec2bin(max(rp)));  % Number of Flip Flops
% tb = zeros(seqLen, nQ);

% ----------------------------------------------------------------------------
% Sort rp to Karnaugh Map Sequence
kMapSeq = reshape([dec2gray(0:3);...
               dec2gray(7:-1:4);...
               dec2gray(8:11);...
               dec2gray(15:-1:12)]',1,16);
if(nQ == 5)
    kMapSeq(17:32) = kMapSeq + 16;
end
for r = 1:length(rp)
    rGcs(r) = find(kMapSeq == rp(r));
end

% ----------------------------------------------------------------------------

%{
for r = 1:2^nQ
    for c = 1:nQ
        JtK{r, c} = 'X';
        KtK{r, c} = 'X';
    end
end
%}

transState = 0;
JtK = {char(ones(2^nQ, nQ) .* 'X')};
KtK = {char(ones(2^nQ, nQ) .* 'X')};
for n = 1:seqLen
    np1 = mod(n, seqLen) + 1;
    for b = 1:nQ
        transState = uint8(bin2dec([rpB(n,b),rpB(np1,b)]));
        % JtK{n,b} = Jt(transState + 1);
        % KtK{n,b} = Kt(transState + 1);
        JtK{1}(n,b) = Jt(transState + 1);
        KtK{1}(n,b) = Kt(transState + 1);
    end
end

% ----------------------------------------------------------------------------
% Find Dont Care inputs 
DC = [];
DCind = 1;
for it = 0:2^nQ-1
    if(isempty(find(rp==it)))
        DC(DCind) = it;
        DCind += 1;
    end
end
% ----------------------------------------------------------------------------

fprintf('\n Sequence length = %d\n\n', seqLen)
disp(rp)

% Print Column Headers
fprintf('\n  Seq\tBin\t')
for jk = 1:nQ
    fprintf('\tJ%d\tK%d', jk, jk)
end

% Print (State | Binary | J1, K1, J2, K2, J3...)
for st = 1:seqLen
    fprintf('\n\n  %d\t%s\t', rp(st), rpB(st,:))
    for jk = 1:nQ
        % fprintf('\t%s', JtK{st, jk})
        % fprintf('\t%s', KtK{st, jk})
        fprintf('\t%s', JtK{1}(st, jk))
        fprintf('\t%s', KtK{1}(st, jk))
    end
end
fprintf('\n\n')

for st = 1:length(DC)
    fprintf('\n\n  %d\t%s\t', DC(st), dec2bin(DC(st), 4))
    for jk = 1:nQ
        % fprintf('\t%s', JtK{st, jk})
        % fprintf('\t%s', KtK{st, jk})
        % fprintf('\t%s', JtK{1}(DC(st)+1, jk))
        % fprintf('\t%s', KtK{1}(DC(st)+1, jk))
        fprintf('\t%s', 'X')
        fprintf('\t%s', 'X')
    end
end


fprintf('\n\n')


% ----------------------------------------------------------------------------
% Place 0, 1, X on Karnaugh Map
% dec2gray = @(n) bitxor(n, bitshift(n, -1));
% seqLen = 12;
% rp = randperm(2^ceil(log2(seqLen))-1)(1:seqLen);

% rpCh = char(rp + 65); % Test Characters in place of JtK and KtK.

gS = ([dec2gray(0:3); dec2gray(7:-1:4); dec2gray(8:11); dec2gray(15:-1:12)]);
gS = reshape(gS', 1, 16);

% Km = char(ones(1, 16) .* 88);
%{
Km(1,:) = char(ones(1, 16) .* 88);
Km(2,:) = char(ones(1, 16) .* 88);

rpLen = length(rp);

for i = 1:rpLen
    % Km(find(gS == rp(i))) = rpCh(i);
    Km(1, find(gS == rp(i))) = JtK{}(i,1);
    Km(2, find(gS == rp(i))) = JtK{}(i,2);    
end

% Kmap = reshape(Km, 4, 4)';
Kmap(:,:,1) = reshape(Km(1,:), 4, 4)';
Kmap(:,:,2) = reshape(Km(2,:), 4, 4)';

rp
JtK{}(:,1)'
Kmap(:,:,1)
JtK{}(:,2)'
Kmap(:,:,2)
%}

rpLen = length(rp);

for q = 1:nQ
    Jm = char(ones(1, 16) .* 88);
    Km = char(ones(1, 16) .* 88);
    for i = 1:rpLen
        Jm(find(gS == rp(i))) = JtK{}(i,q);
        Km(find(gS == rp(i))) = KtK{}(i,q);
    end
    Jmap(:,:,q) = reshape(Jm, 4, 4)';
    Kmap(:,:,q) = reshape(Km, 4, 4)';
end

rp
% JtK{}(:,1)'
% Jmap(:,:,1)

% KtK{}(:,1)'
% Kmap(:,:,1)

fid = fopen('stateKmaps.txt', 'w');
fprintf(fid, 'Sequence:\n\t')
fdisp(fid, rp)
fprintf(fid, '\n\n')

for q = 1:nQ
    fprintf('Q%d\t\tJ%d\t\t\tK%d\n', q, q, q)
    fprintf(fid, 'Q%d\t\tJ%d\t\t\tK%d\n', q, q, q)
    for jq = 1:nQ
        fprintf('\t\t')
        fprintf(fid, '\t\t')
        for jx = 1:nQ
            fprintf('% 3s', Jmap(jq, jx, q))
            fprintf(fid, '% 3s', Jmap(jq, jx, q))
        end
        fprintf('\t\t')
        fprintf(fid, '\t\t')
        for jx = 1:nQ
            fprintf('% 3s', Kmap(jq, jx, q))
            fprintf(fid, '% 3s', Kmap(jq, jx, q))
        end
        fprintf('\n\n')
        fprintf(fid, '\n\n')
    end
    fprintf('\n\n')
    fprintf(fid, '\n\n\n\n')
end
% fprintf(fid, '--END FILE--\n')
fclose(fid)

% ----------------------------------------------------------------------------




%{
% for qj = 1:seqLen
for qj = 1:2^nQ
    % fprintf('\n\t%d\t%s', qj-1, JtK{find(rp==(qj-1)),1})
    fprintf('\n\t%d\t%s', qj-1, JtK{1}(find(rp==(qj-1)),1))
    fprintf('\n')
end

fprintf('\n\n')

for qn = 0:seqLen-1
    qj = dec2gray(qn);
    % fprintf('\n\t%d\t%s', qj, JtK{find(rp==(qj)),1})
    fprintf('\n\t%d\t%s', qj, JtK{1}(find(rp==(qj)),1))
    fprintf('\n')
end


% char(ones(4,4) .* 'X')

K = reshape(dec2gray(0:15), 4, 4)';
K(2:2:4,1:4) = K(2:2:4, 4:-1:1);
K = reshape(K', 1,16);

% K2 = K + 16;

% Find Dont Care inputs 
DC = [];
DCind = 1;
for it = 0:2^nQ-1
    if(isempty(find(rp==it)))
        DC(DCind) = it;
        DCind += 1;
    end
end
%}
