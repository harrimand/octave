%Word Permutations

txt = 'abcdef';
pt = sortrows( perms(txt));
lenPerms = factorial(length(txt));
ncols = 10;
nrows = lenPerms/ncols;
for R = 1:nrows
    for C = 1:ncols
        fprintf('%s    ', pt((C-1)*nrows+R,:))
    end
    fprintf('\n')
end
