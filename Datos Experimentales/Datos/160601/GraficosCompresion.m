clear all
close all

P1SF=importfile('p5sf.csv');
P2SF=importfile('p6sfa.csv');
P2SFb=importfile('p6sfb.csv');
P1FA=importfile('p3fa.csv');
P2FA=importfile('p4fa.csv');
P1FP=importfile('p1fp.csv');
P2FP=importfile('p2fp.csv');

P3SF=importfile('schonormal.csv');
P3FA=importfile('shometa2.csv');
P3FP=importfile('schoplastica.csv');


P1SFd=csvread('p5sfd.txt',1,0);
P2SFd=csvread('p6sfda.txt',1,0);
P2SFdb=csvread('p6sfdb.txt',1,0);
P1FAd=csvread('p3fad.txt',1,0);
P2FAd=csvread('p4fad.txt',1,0);
P1FPd=csvread('p1fpd.txt',1,0);
P2FPd=csvread('p2fpd.txt',1,0);

%plot(P2SFdb(:,1)) 

[M,I] = max(P1SF(:,3));
[M2,I2]=min(P1SFd(:,1));

FIP1SF=700;
FIP2SF=850;
FIP2SFb=1189;
FIP1FA=850;
FIP2FA=600;
FIP1FP=750;
FIP2FP=600;

FIP3SF=1550;
FIP3FA=1000;
FIP3FP=1200;





Rangolvdt=1150:1:2645;
rangomaquina=1:882;

%AUXK=P1SD(maquina,3)/(P1SD(maquina,2)-25.4/5*());


%figure
%plot(P2FAd(1:end,1))
%hold on
%plot(prueba(:,2))
%plot(P2FAd(1:end,3))
%plot(P2FAd(1:end,4))

[M,I] = max(P2FA(:,3));
[M2,I2]=min(P2FAd(:,1));



figure

plot((P1SFd(1:end,3)-P1SFd(1,3)+1*P1SFd(1:end,4)-1*P1SFd(1,4))/2*25.4/5/130,P1SFd(1:end,1)*M/M2*10/(102*102*pi/4))
hold on
plot(([0; P1SF(FIP1SF:end,2)/(200)-0.0048-P1SF(FIP1SF:end,3)/5750000]),[0; P1SF(FIP1SF:end,3)*10/(102*102*pi/4)], 'k')
ylabel('$\sigma=F/A_0$ (MPa)')
xlabel('$\epsilon=\delta/L_0$')
xlim([0 0.005])
title('Probeta sin fibras')
legend('Compres?metro (LVDTS)', 'Sensor de m?quina universal ajustado', 'Location', 'southeast')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')


figure

plot((P2SFd(1:end,3)-P2SFd(1,3)+0*P2SFd(1:end,4)-0*P2SFd(1,4))/2*25.4/5/130,P2SFd(1:end,1)*M/M2*10/(102*102*pi/4))
hold on
plot(([0; P2SF(FIP2SF:end,2)/(200)-0.0047-P2SF(FIP2SF:end,3)/5050000]),[0; P2SF(FIP2SF:end,3)*10/(102*102*pi/4)], 'k')
xlim([0 0.005])
ylabel('$\sigma=F/A_0$ (MPa)')
xlabel('$\epsilon=\delta/L_0$')
title('Probeta sin fibras')
legend('Compres?metro (LVDTS)', 'Sensor de m?quina universal ajustado', 'Location', 'southeast')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')



figure

plot((P1FAd(1:end,3)-P1FAd(1,3)+1*P1FAd(1:end,4)-1*P1FAd(1,4))/2*25.4/5/130,P1FAd(1:end,1)*M/M2*10/(102*102*pi/4))
hold on
plot(([0; P1FA(FIP1FA:end,2)/(200)-0.0055-P1FA(FIP1FA:end,3)/5150000]),[0; P1FA(FIP1FA:end,3)*10/(102*102*pi/4)], 'k')
title('Probeta fibras de acero')
ylabel('$\sigma=F/A_0$ (MPa)')
xlabel('$\epsilon=\delta/L_0$')
xlim([0 0.005])
set(gca, 'FontSize', 18, 'FontName','Times New Roman')
legend('Compres?metro (LVDTS)', 'Sensor de m?quina universal ajustado', 'Location', 'southeast')


figure

plot((P2FAd(1:end,3)-P2FAd(1,3)+0*P2FAd(1:end,4)-0*P2FAd(1,4))/2*25.4/5/130,P2FAd(1:end,1)*M/M2*10/(102*102*pi/4))
hold on
plot(([0; P2FA(FIP2FA:end,2)/(200)-0.0048-P2FA(FIP2FA:end,3)/5550000]),[0; P2FA(FIP2FA:end,3)*10/(102*102*pi/4)], 'k')
xlim([0 0.005])
ylabel('$\sigma=F/A_0$ (MPa)')
xlabel('$\epsilon=\delta/L_0$')
title('Probeta fibras de polipropileno')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')
legend('Compres?metro (LVDTS)', 'Sensor de m?quina universal ajustado', 'Location', 'southeast')


figure

plot((P1FPd(1:end,3)-P1FPd(1,3)+1*P1FPd(1:end,4)-1*P1FPd(1,4))/2*25.4/5/130,P1FPd(1:end,1)*M/M2*10/(102*102*pi/4))
hold on
plot(([0; P1FP(FIP1FP:end,2)/(200)-0.0082-P1FP(FIP1FP:end,3)/5750000]),[0; P1FP(FIP1FP:end,3)*10/(102*102*pi/4)], 'k')
title('Probeta fibras de acero')
ylabel('$\sigma=F/A_0$ (MPa)')
xlabel('$\epsilon=\delta/L_0$')
xlim([0 0.005])
legend('Compres?metro (LVDTS)', 'Sensor de m?quina universal ajustado', 'Location', 'southeast')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

figure

plot((P2FPd(1:end,3)-P2FPd(1,3)+1*P2FPd(1:end,4)-1*P2FPd(1,4))/2*25.4/5/130,P2FPd(1:end,1)*M/M2*10/(102*102*pi/4))
hold on
plot(([0; P2FP(FIP2FP:end,2)/(200)-0.0060-P2FP(FIP2FP:end,3)/6000000]),[0; P2FP(FIP2FP:end,3)*10/(102*102*pi/4)], 'k')
xlim([0 0.005])
title('Probeta fibras de polipropileno')
ylabel('$\sigma=F/A_0$ (MPa)')
xlabel('$\epsilon=\delta/L_0$')
legend('Compres?metro (LVDTS)', 'Sensor de m?quina universal ajustado', 'Location', 'southeast')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%grid on


figure
plot(0, 0, 'k')
hold on
plot(0, 0, 'r')
plot(0, 0, 'b')

plot(([0; P1SF(FIP1SF:end-100,2)/(200)-0.0045-P1SF(FIP1SF:end-100,3)/5750000])*1,[0; P1SF(FIP1SF:end-100,3)*10/(102*102*pi/4)], 'k')
hold on
plot(([0; P2SF(FIP2SF:end-100-600-8,2)/(200)-0.0048-P2SF(FIP2SF:end-100-600-8,3)/5050000])*1,[0; P2SF(FIP2SF:end-100-600-8,3)*10/(102*102*pi/4)], 'k')
plot(P2SFb(FIP2SFb:end-600,2)/(200)-0.00883-P2SFb(FIP2SFb:end-600,3)/5050000*1,P2SFb(FIP2SFb:end-600,3)*10/(102*102*pi/4), 'k')
plot(([0; P3SF(FIP3SF:end-100-2,2)/(200)-0.0036-P3SF(FIP3SF:end-100-2,3)/5800000])*1,[0; P3SF(FIP3SF:end-100-2,3)*10/(102*102*pi/4)], 'k')

plot(([0; P1FA(FIP1FA:end-5,2)/(200)-0.0055-P1FA(FIP1FA:end-5,3)/5050000])*1,[0; P1FA(FIP1FA:end-5,3)*10/(102*102*pi/4)], 'r')
plot(([0; P2FA(FIP2FA:end-3,2)/(200)-0.0048-P2FA(FIP2FA:end-3,3)/5550000])*1,[0; P2FA(FIP2FA:end-3,3)*10/(102*102*pi/4)], 'r')
plot(([0; P3FA(FIP3FA:end-10,2)/(200)-0.0019-P3FA(FIP3FA:end-10,3)/5200000])*1,[0; P3FA(FIP3FA:end-10,3)*10/(102*102*pi/4)], 'r')

plot(([0; P1FP(FIP1FP:end-5,2)/(200)-0.0081-P1FP(FIP1FP:end-5,3)/5850000])*1,[0; P1FP(FIP1FP:end-5,3)*10/(102*102*pi/4)], 'b')
plot(([0; P2FP(FIP2FP:end-3,2)/(200)-0.0060-P2FP(FIP2FP:end-3,3)/6000000])*1,[0; P2FP(FIP2FP:end-3,3)*10/(102*102*pi/4)], 'b')
plot(([0; P3FP(FIP3FP:end-10,2)/(200)-0.0020-P3FP(FIP3FP:end-10,3)/3300000])*1,[0; P3FP(FIP3FP:end-10,3)*10/(102*102*pi/4)], 'b')


asd131=P3SF(FIP3SF:end-2,2)/(200)-0.0036-P3SF(FIP3SF:end-2,3)/5800000;
asd131=asd131(end);
asd132=P3SF(FIP3SF:end-2,3)*10/(102*102*pi/4);
asd132=asd132(end);
plot(asd131,asd132,'xk')

asd121=P2SFb(FIP2SFb:end,2)/(200)-0.00883-P2SFb(FIP2SFb:end,3)/5050000*1;
asd121=asd121(end);
asd122=P2SFb(FIP2SFb:end,3)*10/(102*102*pi/4);
asd122=asd122(end);
plot(asd121,asd122,'xk')

asd111=P1SF(FIP1SF:end,2)/(200)-0.0045-P1SF(FIP1SF:end,3)/5750000;
asd111=asd111(end);
asd112=P1SF(FIP1SF:end,3)*10/(102*102*pi/4);
asd112=asd112(end);
plot(asd111,asd112,'xk')




asd231=P3FA(FIP3FA:end-10,2)/(200)-0.0019-P3FA(FIP3FA:end-10,3)/5200000;
asd231=asd231(end);
asd232=P3FA(FIP3FA:end-10,3)*10/(102*102*pi/4);
asd232=asd232(end);
plot(asd231,asd232,'xr')

asd221=P2FA(FIP2FA:end-3,2)/(200)-0.0048-P2FA(FIP2FA:end-3,3)/5550000;
asd221=asd221(end);
asd222=P2FA(FIP2FA:end-3,3)*10/(102*102*pi/4);
asd222=asd222(end);
plot(asd221,asd222,'xr')

asd211=P1FA(FIP1FA:end-5,2)/(200)-0.0055-P1FA(FIP1FA:end-5,3)/5050000;
asd211=asd211(end);
asd212=P1FA(FIP1FA:end-5,3)*10/(102*102*pi/4);
asd212=asd212(end);
plot(asd211,asd212,'xr')


asd331=P3FP(FIP3FP:end-10,2)/(200)-0.0020-P3FP(FIP3FP:end-10,3)/3300000*1;
asd331=asd331(end);
asd332=P3FP(FIP3FP:end-10,3)*10/(102*102*pi/4);
asd332=asd332(end);
plot(asd331,asd332,'xb')

asd321=P2FP(FIP2FP:end-3,2)/(200)-0.0060-P2FP(FIP2FP:end-3,3)/6000000;
asd321=asd321(end);
asd322=P2FP(FIP2FP:end-3,3)*10/(102*102*pi/4);
asd322=asd322(end);
plot(asd321,asd322,'xb')

asd311=P1FP(FIP1FP:end-5,2)/(200)-0.0081-P1FP(FIP1FP:end-5,3)/5850000;
asd311=asd311(end);
asd312=P1FP(FIP1FP:end-5,3)*10/(102*102*pi/4);
asd312=asd312(end);
plot(asd311,asd312,'xb')

legend('Sin fibras', 'Fibras de acero', 'Fibras de polipropileno', 'Location', 'northeast')
ylabel('$\sigma=F/A_0$ (MPa)')
xlabel('$\epsilon=\delta/L_0$')
xlim([0 0.01])
set(gca, 'FontSize', 18, 'FontName','Times New Roman')
ax=gca;
%ax.XTick = (0:1:10)/1000;

%%
OpenSees1=csvread('ElementosfuerzasSF.out');
OpenSees2=csvread('ElementosdeformacionesSF.out');



figure

plot(([0; P1SF(FIP1SF:end-100,2)/(200)-0.0045-P1SF(FIP1SF:end-100,3)/5750000])*1,[0; P1SF(FIP1SF:end-100,3)*10/(102*102*pi/4)], 'b')
%plot(([0; P3SF(FIP3SF:end-100-2,2)/(200)-0.0036-P3SF(FIP3SF:end-100-2,3)/5800000])*1,[0; P3SF(FIP3SF:end-100-2,3)*10/(102*102*pi/4)], 'k')
hold on
plot(-OpenSees2(:,2),-OpenSees1(:,2),'k')
plot(-OpenSees2(:,2),-OpenSees1(:,3),'g')
plot(-OpenSees2(:,2),-OpenSees1(:,4),'r')
plot(-OpenSees2(:,2),-OpenSees1(:,5),'c')

legend('Hormig?n sin fibras (experimentos)', 'Concrete02 (Mohd Yassin)', 'Concrete04 (Popovics)', 'Concrete06 (Thorenfeldt)', 'ConcreteCM (Chang-Mander)','Location', 'northeast' )

xlim([0 0.01])
ylim([0 80])
ylabel('$\sigma = F/A_0$ (MPa)')
xlabel('$\epsilon = \delta/L_0$ (mm/mm)')
%legend('Ensayos','Curva representativa')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')



OpenSees1=csvread('ElementosfuerzasFA.out');
OpenSees2=csvread('ElementosdeformacionesFA.out');


figure

%plot(([0; P1FA(FIP1FA:end-5,2)/(200)-0.0055-P1FA(FIP1FA:end-5,3)/5050000])*1,[0; P1FA(FIP1FA:end-5,3)*10/(102*102*pi/4)], 'b')
plot(([0; P2FA(FIP2FA:end-3,2)/(200)-0.0048-P2FA(FIP2FA:end-3,3)/5550000])*1,[0; P2FA(FIP2FA:end-3,3)*10/(102*102*pi/4)]*0.95, 'b')
%plot(([0; P3FA(FIP3FA:end-10,2)/(200)-0.0019-P3FA(FIP3FA:end-10,3)/5200000])*1,[0; P3FA(FIP3FA:end-10,3)*10/(102*102*pi/4)], 'b')
hold on
plot(-OpenSees2(:,2),-OpenSees1(:,2),'k')
plot(-OpenSees2(:,2),-OpenSees1(:,3),'g')
plot(-OpenSees2(:,2),-OpenSees1(:,4),'r')
plot(-OpenSees2(:,2),-OpenSees1(:,5),'c')

legend('Hormig?n con FA (experimentos)', 'Concrete02 (Mohd Yassin)', 'Concrete04 (Popovics)', 'Concrete06 (Thorenfeldt)', 'ConcreteCM (Chang-Mander)','Location', 'northeast' )

xlim([0 0.01])
ylim([0 90])
ylabel('$\sigma = F/A_0$ (MPa)')
xlabel('$\epsilon = \delta/L_0$ (mm/mm)')
%legend('Ensayos','Curva representativa')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

OpenSees1=csvread('ElementosfuerzasFP.out');
OpenSees2=csvread('ElementosdeformacionesFP.out');


figure

%plot(([0; P1FP(FIP1FP:end-5,2)/(200)-0.0081-P1FP(FIP1FP:end-5,3)/5850000])*1,[0; P1FP(FIP1FP:end-5,3)*10/(102*102*pi/4)], 'b')
%hold on
plot(([0; P2FP(FIP2FP:end-3,2)/(200)-0.0060-P2FP(FIP2FP:end-3,3)/6000000])*1,[0; P2FP(FIP2FP:end-3,3)*10/(102*102*pi/4)], 'b')
hold on
%plot(([0; P3FP(FIP3FP:end-10,2)/(200)-0.0020-P3FP(FIP3FP:end-10,3)/3300000])*1,[0; P3FP(FIP3FP:end-10,3)*10/(102*102*pi/4)], 'b')
hold on
plot(-OpenSees2(:,2),-OpenSees1(:,2),'k')
plot(-OpenSees2(:,2),-OpenSees1(:,3),'g')
plot(-OpenSees2(:,2),-OpenSees1(:,4),'r')
plot(-OpenSees2(:,2),-OpenSees1(:,5),'c')

legend('Hormig?n con FP (experimentos)', 'Concrete02 (Mohd Yassin)', 'Concrete04 (Popovics)', 'Concrete06 (Thorenfeldt)', 'ConcreteCM (Chang-Mander)','Location', 'northeast' )

xlim([0 0.01])
ylim([0 90])
ylabel('$\sigma = F/A_0$ (MPa)')
xlabel('$\epsilon = \delta/L_0$ (mm/mm)')
%legend('Ensayos','Curva representativa')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%%

OpenSees1=importdata('ElementosfuerzasSF.out');
OpenSees2=importdata('ElementosdeformacionesSF.out');

OpenSees1a=importdata('ElementosfuerzasFA.out');
OpenSees2a=importdata('ElementosdeformacionesFA.out');

OpenSees1p=importdata('ElementosfuerzasFP.out');
OpenSees2p=importdata('ElementosdeformacionesFP.out');

figure(1)
plot(-OpenSees2(:,2),-OpenSees1(:,5),'r')
hold on
plot(-OpenSees2a(:,2),-OpenSees1a(:,5),'g')
plot(-OpenSees2p(:,2),-OpenSees1p(:,5),'b')

set(gca, 'FontSize', 20, 'FontName','Times New Roman')
legend('Hormig?n SF', 'Hormig?n con FA', 'Hormig?n con FP', 'Location', 'northeast')

xlabel('Deformaci?n unitaria en compresi?n, \epsilon')
ylabel('Tensi?n de compresi?n (MPa)')



OpenSees1=importdata('ElementosfuerzasSFtrac.out');
OpenSees2=importdata('ElementosdeformacionesSFtrac.out');

OpenSees1a=importdata('ElementosfuerzasFAtrac.out');
OpenSees2a=importdata('ElementosdeformacionesFAtrac.out');

OpenSees1p=importdata('ElementosfuerzasFPtrac.out');
OpenSees2p=importdata('ElementosdeformacionesFPtrac.out');

figure(2)
plot(OpenSees2(:,2),OpenSees1(:,5),'r')
hold on
plot(OpenSees2a(:,2),OpenSees1a(:,5),'g')
plot(OpenSees2p(:,2),OpenSees1p(:,5),'b')

set(gca, 'FontSize', 20, 'FontName','Times New Roman')
legend('Hormig?n SF', 'Hormig?n con FA', 'Hormig?n con FP', 'Location', 'northeast')

xlabel('Deformaci?n unitaria en tracci?n, \epsilon')
ylabel('Tensi?n de tracci?n (MPa)')