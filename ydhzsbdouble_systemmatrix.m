function [C4,C44,M1,a1]=ydhzsbdouble_systemmatrix(m,l,EI,v,x,f1,f2)
close all
%moving force identification a time domain(1997)
n=3;
%21.6.13
xi=[0.02;0.02;0.04];
wn=zeros(3,1);
wb=wn;
for i=1:3
    wn(i)=(i*pi/l)^2*(EI/m)^0.5;
    wb(i)=xi(i)*wn(i);
end

h=5e-3;
t1=0:h:l/v;

n1=1;
h1=h/n1;
t=0:h1:l/v;

f=[f1(2:end-1),f2(2:end-1)];
ls=4;
t11=0:h:ls/v;
t111=0:h:(ls+l)/v;
t3=0:h1:(ls+l)/v;
a=zeros(n,1);
y0=zeros(n,length(t));
y1=zeros(n,length(t3));
for i=1:n
    a(i)=(wn(i)^2-wb(i)^2)^0.5;
    for j=1:length(t)
        y0(i,j)=2/(m*l)*sin(i*pi*v*t(j)/l);
    end
    for k=1:length(t3)
         y1(i,k)=1/a(i)*exp(-wb(i)*t3(k))*sin(a(i)*t3(k));%这里有n个
    end
end
C=zeros(length(t1),length(t),n);
for i=1:n
    for j=1:length(t1)
        for k=1:(j-1)*n1+1
            C(j,k,i)=y1(i,(j-1)*n1-k+2)*y0(i,k)*h1;
        end
    end
end
C1=zeros(length(t11),length(t));
for i=1:n
    for j=1:length(t11)
        for k=1:length(t)
            C1(j,k)=EI*(i*pi/l)^2*sin(i*pi*x/l)*y1(i,length(t)+n1*(j-1)-k+1)*y0(i,k)*h1+C1(j,k);
        end
    end
end
C0=zeros(length(t1),length(t));
for i=1:n
    for j=1:length(t1)
        for k=1:length(t)
            C0(j,k)=EI*(i*pi/l)^2*sin(i*pi*x/l).*C(j,k,i)+C0(j,k);
        end
    end
end
C11=C0(2:length(t11),2:length(t)-1);
C12=zeros(length(t11)-1,length(t)-2);
C21=C0(length(t11)+1:length(t1),2:length(t)-1);
C22=C0(2:length(t1)-length(t11)+1,2:length(t)-1);
C32=C0(length(t1)-length(t11)+2:end,2:length(t)-1);
C31=C1(2:end,2:end-1);
C4=[C11,C12;C21,C22;C31,C32];
C4=C4(2:end,:);
M1=C4*f';

y11=zeros(n,length(t3));
y00=zeros(n,length(t));
for i=1:n
    for j=1:length(t)
             y00(i,j)=sin(i*pi*v*t(j)/l);  
    end
            for k=1:length(t3)
       y11(i,k)=1/a(i)*exp(-wb(i)*t3(k))*(sin(a(i)*t3(k))*(wb(i)^2- ...
            a(i)^2)+cos(a(i)*t3(k))*(-2*wb(i)*a(i)));
            end
end
C1a=zeros(length(t111),length(t),n);
y12=zeros(length(t111),n);
a1=zeros(length(t1),1);
for i=1:n
    for j=1:length(t1)
        y12(j,i)=sin(i*pi*v*t1(j)/l);
        a1(j)=(j-1)*n1+1;
        for k=1:(j-1)*n1+1
            C1a(j,k,i)=y11(i,(j-1)*n1-k+2)*y00(i,k)*h1;
        end
    end
end
for k=1:n
    for j=1:length(t1)
        C1a(j,a1(j),k)=C1a(j,a1(j),k)+y12(j,k);
    end
end
Ca11=zeros(length(t1),length(t));
for i=1:n
    for j=1:length(t1)
        for k=1:length(t)
            Ca11(j,k)=2/(m*l)*sin(i*pi*x/l)*C1a(j,k,i)+Ca11(j,k);
        end
    end
end
Ca1c=zeros(length(t11),length(t));
for i=1:n
    for j=1:length(t11)
        for k=1:length(t)
            Ca1c(j,k)=2/(m*l)*sin(i*pi*x/l)*y11(i,length(t)+n1*(j-1)-k+1)*y00(i,k)*h1+Ca1c(j,k);%力在过桥后变成0了所以没有影响
        end
    end
end
C111=Ca11(2:length(t11),2:length(t)-1);
C112=zeros(length(t11)-1,length(t)-2);
C221=Ca11(length(t11)+1:length(t1),2:length(t)-1);
C222=Ca11(2:length(t1)-length(t11)+1,2:length(t)-1);
C332=Ca11(length(t1)-length(t11)+2:end,2:length(t)-1);
C331=Ca1c(2:end,2:end-1);
C44=[C111,C112;C221,C222;C331,C332];
a1=C44*f';
