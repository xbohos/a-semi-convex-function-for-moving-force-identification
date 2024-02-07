function out=semiconvex(A,b,n)
%2023.11.16
%Preprocessing
%addpath('...\regu');
alpha=zeros(length(n),1);
Phi=[ones(n(1),1) zeros(n(1),1);zeros(n(2),1) ones(n(2),1)];
B=A*Phi;
lambda_cons=2*10^(-52);
Mat_cons=(B'*B+lambda_cons.*eye(size(B,2)))\B';
epsilon1=1e-6;epsilon2=1e-6;
[U,s,~] = csvd(A);
lambda_vary = l_curve (U,s,b);
Mat_vary=(A'*A+lambda_vary.*eye(size(A,2)))\A';
%Main iteration
k=1;
while 1
%f_varying
    b_fvary=b-B*alpha;
    f_vary=Mat_vary*b_fvary;
    %f_constant
    b_constant=b-A*f_vary; 
    alpha1=Mat_cons*b_constant;
    if norm(alpha1-alpha)/norm(alpha1)<epsilon1
        out.statue=1;
        out.iter=k;
        break
    end
    alpha=alpha1;
    if k>2
        if norm(f_vary-f_vary0)/norm(f_vary)<epsilon2
        out.statue=2;
        out.iter=k;
        break
        end
    end
    f_vary0=f_vary;
    k=k+1;
end
out.fcons=Phi*alpha1;
out.fvary=f_vary;
out.f=out.fcons+out.fvary;
end

    