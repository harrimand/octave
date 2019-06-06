A = [1, 3, 5, 1, 5, 2, 4, 7];
B = [5, 1, 5, 2, 4, 7, 1, 3];
Size = length(A);

pushBack = @(A, B) [A, B];

A1ind = [];
for n = 1:Size
    if(A(1) == B(n))
        A1ind = pushBack(A1ind, n);
    end
end

disp(A1ind)
if(length(A1ind))
    for Bi = 1:length(A1ind)
        Binit = A1ind(Bi)
        match = true;
        for n = 1:Size
            Bindex = mod(Binit + n - 2, Size) + 1;
            fprintf("Checking Index A(%d) == B(%d)", n, Bindex)
            fprintf(" %d == %d\n", A(n), B(Bindex))
            if(not(A(n) == B(Bindex)))
                match = false;
            end
        end
        if(match)
            fprintf("Arrays Are Equal\n")
            break
        end
    end
end
  