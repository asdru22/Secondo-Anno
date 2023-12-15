%main script iniziale da completare

fprintf('mat_k  nxn         max|q_ij|     max|r_ij|    2^(n-1)max|a_ij|\n');
nn=[5,10,50];
for n=nn
    for k=2:5

        switch k
            case 2
               A=mat_2(n);
            case 3
               A=mat_3(n);
            case 4
               A=mat_4(n);
            case 5
               A=mat_5(n);
        end
              
        %si fattorizza la matrice A
        [Q,R,C]=qr(A);

        maxq=max(max(Q));
        maxr=max(max(R));
        bound=2^(n-1)*max(max(A));

        fprintf('%5d %2dx%2d  %14.5f  %14.5e  %14.5e\n',k,n,n,maxq,maxr,bound);
    end
end                
