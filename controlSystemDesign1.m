clear
clc
close all

% ---------------------------------QUESTION ONE-------------------------------

%PART a)

b=0;
sys1=tf([1 1],conv(conv([1 2],[1 3]),[1 4]));
figure
bode(sys1)
grid on
[Gm,Pm,wcp,wcg] = margin(sys1); 
GmdB = 20*log10(Gm); 
b=b+1;
metrics1(:,b)=[GmdB,Pm,wcp,wcg];
disp(metrics1)
% The uncompensated system above has infinite gain and phase margin.We are
% required to get a Gain Margin of 50dB.

figure
p=0;
for K=-0.08:0.001:-0.05
    num=[1 1]*K;
    den=conv(conv([1 2],[1 3]),[1 4]);
    sys=tf(num,den);
    bode(sys);
    grid on
    hold on
    [Gm,Pm]=margin(sys);
    GmdB=20*log10(Gm);
    p=p+1;
    metrics(p,:)=[K,GmdB,Pm]; 
%     T(p,:) = table(GmdB,Pm,'VariableNames',{'Gain Margin','Phase Margin'})
end 
disp(metrics)

%From the above for loop, a Gain of -0.0760 gives a Gain Margin of 49.988dB
%and so I choose this as my Controller Gain.



%PART b)

sys=tf([1 1],[1 9 26 24]);
figure
nyquist(sys)
figure
bode(sys)
grid on
[Gm,Pm,wpc,wgc]=margin(sys);
GmdB=20*log(Gm);

metrics2=[GmdB,Pm,wpc,wgc]
%Gain crossover frequency is Not a Number when K=1. Since the system has
%infinite Gain and Phase margin, it is stable.Also,the nyquist contour does not
%cross the critical point(-1).


% use a for loop to determine the gain that gives you gain margin of 40dB


p=0;
figure
for K=-0.3:0.05:0
    num=[1 1]*K;
    den=[1 9 26 24];
    sys=tf(num,den);
    bode(sys);
    grid on
    hold on
    [Gm,Pm,wpc,wgc]=margin(sys);
    GmdB=20*log10(Gm);
    p=p+1;
    metrics(p,:)=[K,GmdB,Pm]; 
%     T(p,:) = table(GmdB,Pm,'VariableNames',{'Gain Margin','Phase Margin'})
end 

disp(metrics)
% T(p,:) = table(GmdB,Pm,'VariableNames',{'Gain Margin','Phase Margin'})

%From the for loop above, a gain of -0.25 gives a Gain Margin of 39.6454
%and so I choose this as my Gain.



