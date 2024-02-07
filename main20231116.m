function main20231116
%BOMP ASS-BOMP
l=40;v=20;fs=200;
t=0:1/fs:l/v;
n1=length(t)-2;n2=n1;n=[n1 n2];
%%
load fdouble_unequalrandn.mat
load double_matrix_unequalrandn
load 5Noise_response_noninitial_unequalrandn
ftrue1=f1(2:end-1);
ftrue2=f2(2:end-1);
ftrue1=[0;ftrue1';0];
ftrue2=[0;ftrue2';0];
Hm_14=Hm_14./norm(m1_4N);m1_4N=m1_4N./norm(m1_4N);
Hm_12=Hm_12./norm(m1_2N);m1_2N=m1_2N./norm(m1_2N);
Hm_34=Hm_34./norm(m3_4N);m3_4N=m3_4N./norm(m3_4N);
Hm_35=Hm_35./norm(m3_5N);m3_5N=m3_5N./norm(m3_5N);
Ha_34=Ha_34./norm(a3_4N);a3_4N=a3_4N./norm(a3_4N);
Ha_12=Ha_12./norm(a1_2N);a1_2N=a1_2N./norm(a1_2N);
Ha_35=Ha_35./norm(a3_5N);a3_5N=a3_5N./norm(a3_5N);
H=[Hm_14;Ha_12;Ha_35];
r=[m1_4N;a1_2N;a3_5N];
out=semiconvex(H,r,n);
f_ident=out.f;
f1_ident=f_ident(1:n1);f1_ident=[0;f1_ident;0];
f2_ident=f_ident(end-n2+1:end);f2_ident=[0;f2_ident;0];
error1=error_cal(f1_ident,ftrue1);error2=error_cal(f2_ident,ftrue2);
figure
hold on
plot(f1_ident);
plot(ftrue1);
legend('Identified results','True');
figure
hold on
plot(f2_ident);
plot(ftrue2);
legend('Identified results','True');
1
end


function error=error_cal(f,ftrue)
error=zeros(size(f,2),1);
for i=1:size(f,2)
    error(i)=norm(f(:,i)-ftrue)/norm(ftrue);
end
end
