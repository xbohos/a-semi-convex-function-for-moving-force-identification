function main_system_response_2
%%2023.8.1
%l=16;E=7e10;lou=2.5e3*4;I=4^3/12;EI=E*I;wn=[9.4 37.5 84.4];xi=[0.01 0.01 0.02];c=16;dt=1e-3;t=0:dt:l/c;
l=40;EI=1.274916e11;m=1.2e4;c=20;dt=1/200;t=0:dt:l/c;
%%Construct the system matrix
aa=3;
 [f1,f2]=ydhzrealdouble_force(t,aa);
 x=[1/4 2/4 3/4 3/5];
 for i=1:length(x)
     x1=x(i);
[Phi1,Phi2,mm,a]=ydhzsbdouble_systemmatrix(m,l,EI,c,x1,f1,f2);
Phi11(:,:,i)=Phi1;Phi22(:,:,i)=Phi2;M11(:,i)=mm;a11(:,i)=a;
 end
Hm_14=Phi11(:,:,1);Hm_12=Phi11(:,:,2);Hm_34=Phi11(:,:,3);Hm_35=Phi11(:,:,4);
Ha_14=Phi22(:,:,1);Ha_12=Phi22(:,:,2);Ha_34=Phi22(:,:,3);Ha_35=Phi22(:,:,4);
save('double_matrix_unequalrandn','Hm_12','Hm_14','Hm_34','Hm_35','Ha_14','Ha_12','Ha_34','Ha_35');
m1_4=M11(:,1);m1_2=M11(:,2);m3_4=M11(:,3);m3_5=M11(:,4);
a1_4=a11(:,1);a1_2=a11(:,2);a3_4=a11(:,3);a3_5=a11(:,4);
save('originaldoubleresponse_noninitial_unequalrandn','m1_4','m1_2','m3_4','m3_5','a1_4','a1_2','a3_4','a3_5');
save('fdouble_unequalrandn','f1','f2');
