function add_noise
load originaldoubleresponse_noninitial_unequalrandn
n1=0.01;
m1_4N=addnoise1(m1_4,n1);m1_2N=addnoise1(m1_2,n1);m3_4N=addnoise1(m3_4,n1);m3_5N=addnoise1(m3_5,n1);
a1_4N=addnoise1(a1_4,n1);a1_2N=addnoise1(a1_2,n1);a3_4N=addnoise1(a3_4,n1);a3_5N=addnoise1(a3_5,n1);
save('1Noise_response_noninitial_unequalrandn','m1_4N','m1_2N','m3_4N','m3_5N','a1_4N','a1_2N','a3_4N','a3_5N');
n1=0.05;
m1_4N=addnoise1(m1_4,n1);m1_2N=addnoise1(m1_2,n1);m3_4N=addnoise1(m3_4,n1);m3_5N=addnoise1(m3_5,n1);
a1_4N=addnoise1(a1_4,n1);a1_2N=addnoise1(a1_2,n1);a3_4N=addnoise1(a3_4,n1);a3_5N=addnoise1(a3_5,n1);
save('5Noise_response_noninitial_unequalrandn','m1_4N','m1_2N','m3_4N','m3_5N','a1_4N','a1_2N','a3_4N','a3_5N');
n1=0.1;
m1_4N=addnoise1(m1_4,n1);m1_2N=addnoise1(m1_2,n1);m3_4N=addnoise1(m3_4,n1);m3_5N=addnoise1(m3_5,n1);
a1_4N=addnoise1(a1_4,n1);a1_2N=addnoise1(a1_2,n1);a3_4N=addnoise1(a3_4,n1);a3_5N=addnoise1(a3_5,n1);
save('10Noise_response_noninitial_unequalrandn','m1_4N','m1_2N','m3_4N','m3_5N','a1_4N','a1_2N','a3_4N','a3_5N');
end
function r=addnoise1(r,nl)
r=r+nl/length(r)*sum(abs(r)).*randn(length(r),1);
end