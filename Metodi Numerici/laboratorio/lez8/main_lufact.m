%main script iniziale da completare

fprintf('mat_k  nxn         max|l_ij|     max|u_ij|    2^(n-1)max|a_ij|\n');
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
        [L,U,P]=lu(A);

        maxl=max(norm(U(:,n)));

        maxu=max(norm(L(:,n)));
       
        bound=2^(n-1)*max(norm(A(:,n)));

        fprintf('%5d %2dx%2d  %14.5f  %14.5e  %14.5e\n',k,n,n,maxl,maxu,bound);
    end
end                
