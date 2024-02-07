function [f1,f2]=ydhzrealdouble_force(t,a)
%%2023.8.1
if a==1
    f1=5.*(1+0.15*sin(10*pi*t)+0.05*cos(35*pi*t));
    f2=20.*(1-0.1*sin(10*pi*t)+0.15*cos(40*pi*t));
elseif a==2
    f1=zeros(length(t),1);f2=f1;
    for i=1:length(t)
    if t(i)<0.6
     f1(i)=5.*(1+0.15*sin(10*pi*t)+0.05*cos(35*pi*t));
    else      
     f1(i)=5.*(1+0.15*sin(10*pi*t)+0.05*cos(35*pi*t)+1.5.*exp(-35*(t(i)-0.6))*sin(125*(t(i)-0.6)));
    end
    end
    for i=1:length(t)
    if t(i)<0.6
     f2(i)=20.*(1+0.15*sin(10*pi*t)+0.05*cos(35*pi*t));
    else      
     f2(i)=20.*(1+0.15*sin(10*pi*t)+0.05*cos(35*pi*t)+1.5.*exp(-35*(t(i)-0.6))*sin(125*(t(i)-0.6)));
    end
    end
elseif a==3
    f1=zeros(1,length(t));f2=zeros(1,length(t));
    for i=1:length(t)
    f1(i)=5.*(1+0.15*randn);
    f2(i)=20.*(1-0.1*randn);
    end
elseif a==4
        f1=zeros(length(t),1);f2=f1;
    for i=1:length(t)
    if t(i)<0.6
     f1(i)=5.*(1+0.15*randn);
     f2(i)=20.*(1-0.1*randn);
    else      
     f1(i)=5.*((1+0.15*randn)+1.5.*exp(-35*(t(i)-0.6))*abs(randn));
     f2(i)=20.*((1-0.1*randn)+1.5.*exp(-35*(t(i)-0.6))*abs(randn));
    end
    end
elseif a==5
    f1=zeros(length(t),1);f2=f1;
    for i=1:length(t)
    if t(i)<0.3
     f1(i)=5.*(1+0.15*randn);f2(i)=20.*(1+0.15*randn);
    else
        if t(i)<0.6    
     f1(i)=5.*(1+0.25*randn+1.5.*exp(-35*(t(i)-0.3))*abs(randn));
     f2(i)=5.*(1+0.25*randn+1.5.*exp(-35*(t(i)-0.3))*abs(randn));
    else 
             f1(i)=20.*(1+0.25*randn+1.5.*exp(-35*(t(i)-0.3))*abs(randn)+1.5.*exp(-35*(t(i)-0.6))*abs(randn));
             f2(i)=20.*(1+0.25*randn+1.5.*exp(-35*(t(i)-0.3))*abs(randn)+1.5.*exp(-35*(t(i)-0.6))*abs(randn));
        end
    end
    end
 elseif a==6
    f1=zeros(1,length(t));f2=zeros(1,length(t));
    for i=1:length(t)
    f1(i)=20.*(1+0.15*randn);
    f2(i)=20.*(1-0.1*randn);
    end
end