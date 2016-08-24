clear all
close all

% Cargar todos los datos

A1=importdata('b011.txt','	',1);
A1=A1.data;%7 cols
A2=importdata('b021.txt','	',1); %7 cols
A2=A2.data;%7 cols

B1=importdata('a11.txt','	',1); %8 cols
B1=B1.data;%7 cols

B2=importdata('a21.txt','	',1); %7 cols
B2=B2.data;%7 cols

DP1=importdata('dp21.txt','	',1); %8 cols
DP1=DP1.data;%7 cols

DP2=importdata('dp1.txt','	',1); %7 cols
DP2=DP2.data;%7 cols

DA1=importdata('da13.txt','	',1); %8 cols
DA1=DA1.data;%7 cols

DA2=importdata('da21.txt','	',1); %7 cols
DA2=DA2.data;%7 cols


for j=1:200
for i=1:7
    A1(:,i)=smooth(A1(:,i));
    A2(:,i)=smooth(A2(:,i));
    B2(:,i)=smooth(B2(:,i));
    DP2(:,i)=smooth(DP2(:,i));
    DA2(:,i)=smooth(DA2(:,i));
end

for i=1:8
    B1(:,i)=smooth(B1(:,i));
    DP1(:,i)=smooth(DP1(:,i));
    DA1(:,i)=smooth(DA1(:,i));
end
end

%plot(A1(:,5))

figure
plot(A2(:,1))
hold on
plot(A2(:,2))
plot(A2(:,3))
plot(A2(:,4))
plot(A2(:,5))
plot(A2(:,6))
plot(A2(:,7))
xlabel('Tiempo (20 Hz de frecuencia de muestreo)')
ylabel('Voltaje (V)')
legend('Celda de carga vertical', 'LVDT1', 'LVDT2', 'LVDT3', 'LVDT4', 'LVDT5', 'Celda de carga axial', 'Location', 'northwest')
set(gca,'fontname','times')  % Set it to times

ylim([-2 6])
set(gca, 'FontSize', 20)
set(gca,'fontname','times')  % Set it to times



% Inicio de cada ensayo; 


FinicioA1=4500;
FinicioA2=12700+735;
FinicioB1=1700;
FinicioB2=3500+2500+100;
FinicioDP1=1900;
FinicioDP2=1500+4000;
FinicioDA1=6000;
FinicioDA2=1000+3000+300;

% Final de cada lvdt para cada ensayo

FfinalA1L1=16301;
FfinalA1L2=15301;
FfinalA1L3=17301;
FfinalA1L4=10101;
FfinalA1L5=13301;

FfinalA2L1=28461;
FfinalA2L2=26461;
FfinalA2L3=28461;
FfinalA2L4=22121;
FfinalA2L5=24461;

FfinalB1L1=5400;
FfinalB1L2=5700;
FfinalB1L3=5800;
FfinalB1L4=3800;
FfinalB1L5=5900;
FfinalB1US=9000;

FfinalB2L1=FinicioB2+5000;
FfinalB2L2=FinicioB2+6000;
FfinalB2L3=FinicioB2+6000;
FfinalB2L4=FinicioB2+4500;
FfinalB2L5=FinicioB2+5700;

FfinalDP1L1=FinicioDP1+14500;
FfinalDP1L2=FinicioDP1+14500;
FfinalDP1L3=FinicioDP1+14500;
FfinalDP1L4=FinicioDP1+9800;
FfinalDP1L5=FinicioDP1+11000;
FfinalDP1US=FinicioDP1+16000;

FfinalDP2L1=FinicioDP2+13500;
FfinalDP2L2=FinicioDP2+12000;
FfinalDP2L3=FinicioDP2+13400;
FfinalDP2L4=FinicioDP2+7500;
FfinalDP2L5=FinicioDP2+11100;

FfinalDA1L1=FinicioDA1+6400;
FfinalDA1L2=FinicioDA1+6800;
FfinalDA1L3=FinicioDA1+6200;
FfinalDA1L4=FinicioDA1+2900;
FfinalDA1L5=FinicioDA1+5000;
FfinalDA1US=FinicioDA1+7000;

FfinalDA2L1=FinicioDA2+9000;
FfinalDA2L2=FinicioDA2+9700;
FfinalDA2L3=FinicioDA2+9000;
FfinalDA2L4=FinicioDA2+5000;
FfinalDA2L5=FinicioDA2+10500;

% Transformar a kN o mm seg?n sea el caso. 

Volt1=mean(A2(FinicioA2:FfinalA2L1,7));
Volt2=mean(A1(FinicioA1:FfinalA1L1,7));

A=(200-60)/(Volt1-Volt2);
B=(-200*Volt2+60*Volt1)/(Volt1-Volt2);

FCCCL1=60/0.3; % kN/V
FCCCL2=1; % kN
FCLVDT1=2*25.4/5*1; % mm/V
FCLVDT2=25.4/5; %mm/V
FCLVDT3=2*25.4/5; %mm/V
FCLVDT4=25.4/5; %mm/V
FCLVDT5=25.4/5; %mm/V
FCCCA1=A; % kN/V
FCCCA2=B; % kN

FCSU1= 10*5.4358;% mm/V
FCSU2= 10*2.8461; % mm

A1(:,1)=FCCCL1*A1(:,1)+FCCCL2;
A1(:,2)=(A1(:,2)-A1(FinicioA1,2))*FCLVDT1;
A1(:,3)=(A1(:,3)-A1(FinicioA1,3))*FCLVDT2;
A1(:,4)=(A1(:,4)-A1(FinicioA1,4))*FCLVDT3;
A1(:,5)=(A1(:,5)-A1(FinicioA1,5))*FCLVDT4;
A1(:,6)=(A1(:,6)-A1(FinicioA1,6))*FCLVDT5;
A1(:,7)=FCCCA1*A1(:,7)+FCCCA2;

A2(:,1)=FCCCL1*A2(:,1)+FCCCL2;
A2(:,2)=(A2(:,2)-A2(FinicioA2,2))*FCLVDT1;
A2(:,3)=(A2(:,3)-A2(FinicioA2,3))*FCLVDT2;
A2(:,4)=(A2(:,4)-A2(FinicioA2,4))*FCLVDT3;
A2(:,5)=(A2(:,5)-A2(FinicioA2,5))*FCLVDT4;
A2(:,6)=(A2(:,6)-A2(FinicioA2,6))*FCLVDT5;
A2(:,7)=FCCCA1*A2(:,7)+FCCCA2;

B1(:,1)=FCCCL1*B1(:,1)+FCCCL2;
B1(:,2)=(B1(:,2)-B1(FinicioB1,2))*FCLVDT1;
B1(:,3)=(B1(:,3)-B1(FinicioB1,3))*FCLVDT2;
B1(:,4)=(B1(:,4)-B1(FinicioB1,4))*FCLVDT3;
B1(:,5)=(B1(:,5)-B1(FinicioB1,5))*FCLVDT4;
B1(:,6)=(B1(:,6)-B1(FinicioB1,6))*FCLVDT5;
B1(:,7)=FCCCA1*B1(:,7)+FCCCA2;
B1(:,8)=FCSU1*B1(:,8)+FCSU2;

B2(:,1)=FCCCL1*B2(:,1)+FCCCL2;
B2(:,2)=(B2(:,2)-B2(FinicioB2,2))*FCLVDT1;
B2(:,3)=(B2(:,3)-B2(FinicioB2,3))*FCLVDT2;
B2(:,4)=(B2(:,4)-B2(FinicioB2,4))*FCLVDT3;
B2(:,5)=(B2(:,5)-B2(FinicioB2,5))*FCLVDT4;
B2(:,6)=(B2(:,6)-B2(FinicioB2,6))*FCLVDT5;
B2(:,7)=FCCCA1*B2(:,7)+FCCCA2;

DP1(:,1)=FCCCL1*DP1(:,1)+FCCCL2;
DP1(:,2)=(DP1(:,2)-DP1(FinicioDP1,2))*FCLVDT1;
DP1(:,3)=(DP1(:,3)-DP1(FinicioDP1,3))*FCLVDT2;
DP1(:,4)=(DP1(:,4)-DP1(FinicioDP1,4))*FCLVDT3;
DP1(:,5)=(DP1(:,5)-DP1(FinicioDP1,5))*FCLVDT4;
DP1(:,6)=(DP1(:,6)-DP1(FinicioDP1,6))*FCLVDT5;
DP1(:,7)=FCCCA1*DP1(:,7)+FCCCA2;
DP1(:,8)=FCSU1*DP1(:,8)+FCSU2;

DP2(:,1)=FCCCL1*DP2(:,1)+FCCCL2;
DP2(:,2)=(DP2(:,2)-DP2(FinicioDP2,2))*FCLVDT1;
DP2(:,3)=(DP2(:,3)-DP2(FinicioDP2,3))*FCLVDT2;
DP2(:,4)=(DP2(:,4)-DP2(FinicioDP2,4))*FCLVDT3;
DP2(:,5)=(DP2(:,5)-DP2(FinicioDP2,5))*FCLVDT4;
DP2(:,6)=(DP2(:,6)-DP2(FinicioDP2,6))*FCLVDT5;
DP2(:,7)=FCCCA1*DP2(:,7)+FCCCA2;

DA1(:,1)=FCCCL1*DA1(:,1)+FCCCL2;
DA1(:,2)=(DA1(:,2)-DA1(FinicioDA1,2))*FCLVDT1;
DA1(:,3)=(DA1(:,3)-DA1(FinicioDA1,3))*FCLVDT2;
DA1(:,4)=(DA1(:,4)-DA1(FinicioDA1,4))*FCLVDT3;
DA1(:,5)=(DA1(:,5)-DA1(FinicioDA1,5))*FCLVDT4;
DA1(:,6)=(DA1(:,6)-DA1(FinicioDA1,6))*FCLVDT5;
DA1(:,7)=FCCCA1*DA1(:,7)+FCCCA2;
DA1(:,8)=FCSU1*DA1(:,8)+FCSU2;

DA2(:,1)=FCCCL1*DA2(:,1)+FCCCL2;
DA2(:,2)=(DA2(:,2)-DA2(FinicioDA2,2))*FCLVDT1;
DA2(:,3)=(DA2(:,3)-DA2(FinicioDA2,3))*FCLVDT2;
DA2(:,4)=(DA2(:,4)-DA2(FinicioDA2,4))*FCLVDT3;
DA2(:,5)=(DA2(:,5)-DA2(FinicioDA2,5))*FCLVDT4;
DA2(:,6)=(DA2(:,6)-DA2(FinicioDA2,6))*FCLVDT5;
DA2(:,7)=FCCCA1*DA2(:,7)+FCCCA2;

% Gr?ficos


figure
plot(A2(FinicioA2:FfinalA2L1,1)/10)
hold on
plot(A2(FinicioA2:FfinalA2L1,2))
plot(A2(FinicioA2:FfinalA2L2,3))
plot(A2(FinicioA2:FfinalA2L3,4))
plot(A2(FinicioA2:FfinalA2L4,5))
plot(A2(FinicioA2:FfinalA2L5,6))
plot(A2(FinicioA2:FfinalA2L1,7)/10)
xlabel('Tiempo (20 Hz de frecuencia de muestreo)')
ylabel('Desplazamiento (mm) o Carga (Ton)')
legend('Celda de carga vertical', 'LVDT1', 'LVDT2', 'LVDT3', 'LVDT4', 'LVDT5', 'Celda de carga axial', 'Location', 'northwest')
set(gca,'fontname','times')  % Set it to times

%ylim([-2 6])
set(gca, 'FontSize', 16)
%%

figure
%plot([0; B1(FinicioB1:FfinalB1L4,5)],[0; B1(FinicioB1:FfinalB1L4,1)/1])
plot([0; B1([FinicioB1:2520, 3650:FfinalB1L4],5)],[0; B1([FinicioB1:2520, 3650:FfinalB1L4],1)/1])
hold on
%plot([0; B1(FinicioB1:FfinalB1L1,2)],[0; B1(FinicioB1:FfinalB1L1,1)/1])
plot([0; B1([FinicioB1:2520, 3650:FfinalB1L1],2)],[0; B1([FinicioB1:2520, 3650:FfinalB1L1],1)/1])
%plot([0; B1(FinicioB1:FfinalB1L4,4)],[0; B1(FinicioB1:FfinalB1L4,1)/1])
plot([0; B1([FinicioB1:2520, 3650:FfinalB1L4],4)],[0; B1([FinicioB1:2520, 3650:FfinalB1L4],1)/1])

%plot(A2(FinicioA2:FfinalA2L1,2))
%plot(A2(FinicioA2:FfinalA2L2,3))
%plot(A2(FinicioA2:FfinalA2L3,4))
%plot(A2(FinicioA2:FfinalA2L4,5))
%plot(A2(FinicioA2:FfinalA2L5,6))
%plot(A2(FinicioA2:FfinalA2L1,7)/10)
xlabel('Desplazamiento central (mm)')
ylabel('Carga transversal (kN)')
legend('LVDT 4','LVDT 1', 'LVDT 3', 'Location', 'northwest')
set(gca,'fontname','times')  % Set it to times
%xlim([-2 8])
%ylim([0 35])
xlim([0 14])
%ylim([10 35])
set(gca, 'FontSize', 20)


%clear all
close all
%%
figure
plot([0; A1(FinicioA1+780:FfinalA1L1,2)+0.28+0.28-2.8],[0; A1(FinicioA1+780:FfinalA1L1,1)])
hold on
%xlim([0 70])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot(A1(FinicioA1:FfinalA1L2,3)+0.42+0.42,A1(FinicioA1:FfinalA1L2,1))
plot([0; A1(FinicioA1+780:FfinalA1L3,4)+0.37+0.37-2.8],[0; A1(FinicioA1+780:FfinalA1L3,1)])
plot([0; A1(FinicioA1+780:FfinalA1L4,5)+0.55-2],[0; A1(FinicioA1+780:FfinalA1L4,1)])
%plot(A1(FinicioA1:FfinalA1L5,6)+0.33+0.33,A1(FinicioA1:FfinalA1L5,1))
legend('1', '3', '4')
title('A1 (Marco y doble malla a 60 kN Axial)')

figure
plot([0;A2((FinicioA2+1255):FfinalA2L1,2)+0.28+0.28+0.45+1.2],[0.8; A2((FinicioA2+1255):FfinalA2L1,1)])
hold on
%xlim([0 70])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([0; A2((FinicioA2+1450):FfinalA2L2,3)+0.42+0.42+4],[0.8; A2((FinicioA2+1450):FfinalA2L2,1)])
plot([0; A2((FinicioA2+1070):FfinalA2L3,4)+0.37+0.37+0.1],[0.8;A2((FinicioA2+1070):FfinalA2L3,1)])
plot(A2(FinicioA2:FfinalA2L4,5)+0.55+0.65-0.5-0.65+0.05,A2(FinicioA2:FfinalA2L4,1))
%plot(A2(FinicioA2:FfinalA2L5,6)+0.33+0.33+1.3-0.7-1,A2(FinicioA2:FfinalA2L5,1))
legend('1', '3', '4')
title('A2 (Marco y doble malla a 200 kN Axial)')

B11=B1((FinicioB1):FfinalB1L1,2); 
B13=B1((FinicioB1):FfinalB1L1,4);
B14=B1((FinicioB1):FfinalB1L1,5);
B1P=B1((FinicioB1):FfinalB1L1,1);
B11=[B11(1:760); B11(2210:end)];
B13=[B13(1:760); B13(2210:end)];
B14=[B14(1:760); B14(2210:end)];
B1P=[B1P(1:760); B1P(2210:end)];

figure
plot([0; B11],[0; B1P])
hold on
%xlim([0 15])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([B1((FinicioB1):FfinalB1L2,3)],[B1((FinicioB1):FfinalB1L2,1)])
plot([0; B13],[0; B1P])
plot([0; B14],[0; B1P])
%plot(B1(FinicioB1:FfinalB1L5,6),B1(FinicioB1:FfinalB1L5,1))
%plot(B1(FinicioB1:FfinalB1L5,8)-108+0.8,B1(FinicioB1:FfinalB1L5,1))
legend('1', '3', '4', 'US')
title('B1 (doble malla a 60 kN Axial)')

% filtrar de 760 hasta 1610

% figure
% 
% plot(B1(FinicioB1:end,1))
% hold on
% plot(B1(FinicioB1:FfinalB1L1,2))
% plot(B1(FinicioB1:FfinalB1L2,3))
% plot(B1(FinicioB1:FfinalB1L3,4))
% plot(B1(FinicioB1:FfinalB1L4,5))
% plot(B1(FinicioB1:FfinalB1L5,6))
% plot(B1(FinicioB1:end,7))
% plot(B1(FinicioB1:FfinalB1US,8))
% legend('Lateral', '1', '2', '3', '4', '5', 'axial', 'ultrasonico')

%B2(:,5)=2*B2(:,5)
figure
plot([0; B2((FinicioB2+110):FfinalB2L1,2)+0.3+1.0-0.4+0.1],[0; B2((FinicioB2+110):FfinalB2L1,1)])
hold on
%xlim([0 60])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([0; B2((FinicioB2+1100):FfinalB2L2,3)]-0.4,[0; B2((FinicioB2+1100):FfinalB2L2,1)])
plot([0; B2((FinicioB2+110):FfinalB2L3,4)+1.0-0.6-0.5+0.9],[0; B2((FinicioB2+110):FfinalB2L3,1)])
plot([0; B2((FinicioB2+110):FfinalB2L4,5)+0.4-0.2+2.0-0.9],[0; B2(FinicioB2+110:FfinalB2L4,1)])
%plot([0; B2(FinicioB2+700:FfinalB2L5,6)]+0.0,[0; B2(FinicioB2+700:FfinalB2L5,1)])
legend('1', '3', '4')
title('B2 (doble malla a 200 kN Axial)')

% figure
% 
% plot(B2(FinicioB2:end,1))
% hold on
% plot(B2(FinicioB2:FfinalB2L1,2))
% plot(B2(FinicioB2:FfinalB2L2,3))
% plot(B2(FinicioB2:FfinalB2L3,4))
% plot(B2(FinicioB2:FfinalB2L4,5))
% plot(B2(FinicioB2:FfinalB2L5,6))
% plot(B2(FinicioB2:end,7))
% legend('Lateral', '1', '2', '3', '4', '5', 'axial')

figure
plot([0; DP1((FinicioDP1+600):FfinalDP1L1,2)-0.6+0.2],[0; DP1((600+FinicioDP1):FfinalDP1L1,1)])
hold on
%xlim([0 50])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([DP1((FinicioDP1):FfinalDP1L2,3)],[DP1((FinicioDP1):FfinalDP1L2,1)])
plot([0; DP1((FinicioDP1+600):FfinalDP1L3,4)-0.6+0.3],[0; DP1((FinicioDP1+600):FfinalDP1L3,1)])
plot([0; DP1(FinicioDP1+600:FfinalDP1L4,5)-0.6+0.4-0.1],[0; DP1(FinicioDP1+600:FfinalDP1L4,1)])
%plot(DP1(FinicioDP1:FfinalDP1L5,6),DP1(FinicioDP1:FfinalDP1L5,1))
%plot([0; DP1(FinicioDP1+600:FfinalDP1L5,8)-108+0.8+12+1.3-0.3-0.3],[0; DP1(FinicioDP1+600:FfinalDP1L5,1)])
legend('1', '3', '4', 'US')
title('DP1 (Marco, fibras pl?sticas, y malla en compresi?n a 60 kN Axial)')

% figure
% 
% plot(DP1(FinicioDP1:end,1))
% hold on
% plot(DP1(FinicioDP1:FfinalDP1L1,2))
% plot(DP1(FinicioDP1:FfinalDP1L2,3))
% plot(DP1(FinicioDP1:FfinalDP1L3,4))
% plot(DP1(FinicioDP1:FfinalDP1L4,5))
% plot(DP1(FinicioDP1:FfinalDP1L5,6))
% plot(DP1(FinicioDP1:end,7))
% plot(DP1(FinicioDP1:FfinalDP1US,8))
% legend('Lateral', '1', '2', '3', '4', '5', 'axial', 'ultrasonico')

figure
plot([0; DP2((FinicioDP2+800):FfinalDP2L1,2)-3.2-0.2],[0; DP2((FinicioDP2+800):FfinalDP2L1,1)])
hold on
%xlim([0 60])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([0; DP2((FinicioDP2):FfinalDP2L2,3)],[0; DP2((FinicioDP2):FfinalDP2L2,1)])
plot([0; DP2((FinicioDP2+800):FfinalDP2L3,4)-3.2-0.4],[0; DP2((FinicioDP2+800):FfinalDP2L3,1)])
plot([0; DP2(FinicioDP2+800:FfinalDP2L4,5)-3.2+0.6],[0; DP2(FinicioDP2+800:FfinalDP2L4,1)])
%plot([0; DP2(FinicioDP2+605:FfinalDP2L5,6)-2.0],[0; DP2(FinicioDP2+605:FfinalDP2L5,1)])
legend('1', '3', '4')
title('DP2 (Marco, fibras pl?sticas, y malla en compresi?n a 200 kN Axial)')

% figure
% 
% plot(DP2(FinicioDP2:end,1))
% hold on
% plot(DP2(FinicioDP2:FfinalDP2L1,2))
% plot(DP2(FinicioDP2:FfinalDP2L2,3))
% plot(DP2(FinicioDP2:FfinalDP2L3,4))
% plot(DP2(FinicioDP2:FfinalDP2L4,5))
% plot(DP2(FinicioDP2:FfinalDP2L5,6))
% plot(DP2(FinicioDP2:end,7))
% legend('Lateral', '1', '2', '3', '4', '5', 'axial')


figure
plot([0; DA1((FinicioDA1+270):FfinalDA1L1,2)-0.2],[0; DA1((FinicioDA1+270):FfinalDA1L1,1)])
hold on
%xlim([0 50])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([DA1((FinicioDA1):FfinalDA1L2,3)],[DA1((FinicioDA1):FfinalDA1L2,1)])
plot([0; DA1((FinicioDA1+270):FfinalDA1L3,4)-0.2],[0; DA1((FinicioDA1+270):FfinalDA1L3,1)])
plot([0; DA1(FinicioDA1+270:FfinalDA1L4,5)-0.2],[0; DA1(FinicioDA1+270:FfinalDA1L4,1)])
%plot(DA1(FinicioDA1:FfinalDA1L5,6),DA1(FinicioDA1:FfinalDA1L5,1))
%plot([0; DA1(FinicioDA1+270:FfinalDA1L5,8)-108+0.8+12+1.3-14-0.2],[0; DA1(FinicioDA1+270:FfinalDA1L5,1)])
legend('1', '3', '4', 'US')
title('DA1 (Marco, fibras de acero, y malla en compresi?n a 60 kN Axial)')

% figure
% 
% plot(DA1(FinicioDA1:end,1))
% hold on
% plot(DA1(FinicioDA1:FfinalDA1L1,2))
% plot(DA1(FinicioDA1:FfinalDA1L2,3))
% plot(DA1(FinicioDA1:FfinalDA1L3,4))
% plot(DA1(FinicioDA1:FfinalDA1L4,5))
% plot(DA1(FinicioDA1:FfinalDA1L5,6))
% plot(DA1(FinicioDA1:end,7))
% plot(DA1(FinicioDA1:FfinalDA1US,8))
% legend('Lateral', '1', '2', '3', '4', '5', 'axial', 'ultrasonico')

figure
plot([0; DA2((FinicioDA2+110):FfinalDA2L1,2)+0.8],[0; DA2((FinicioDA2+110):FfinalDA2L1,1)])
hold on
%xlim([0 60])
%xlim([0 10])
%ylim([0 30])
%ylim([0 25])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([0; DA2((FinicioDA2):FfinalDA2L2,3)],[0; DA2((FinicioDA2):FfinalDA2L2,1)])
plot([0; DA2((FinicioDA2+110):FfinalDA2L3,4)+1.2],[0; DA2((FinicioDA2+110):FfinalDA2L3,1)])
plot([0; DA2(FinicioDA2+110:FfinalDA2L4,5)+0.8],[0; DA2(FinicioDA2+110:FfinalDA2L4,1)])
%plot([0; DA2(FinicioDA2+905:FfinalDA2L5,6)+2.0],[0; DA2(FinicioDA2+905:FfinalDA2L5,1)])
legend('1', '3', '4')
title('DA2 (Marco, fibras de acero, y malla en compresi?n a 200 kN Axial)')

% figure
% 
% plot(DA2(FinicioDA2:end,1))
% hold on
% plot(DA2(FinicioDA2:FfinalDA2L1,2))
% plot(DA2(FinicioDA2:FfinalDA2L2,3))
% plot(DA2(FinicioDA2:FfinalDA2L3,4))
% plot(DA2(FinicioDA2:FfinalDA2L4,5))
% plot(DA2(FinicioDA2:FfinalDA2L5,6))
% plot(DA2(FinicioDA2:end,7))
% legend('Lateral', '1', '2', '3', '4', '5', 'axial')
KA1=13;
KA2=8;
KB1=15;
KB2=26;
KDA1=31;
KDA2=6;
KDP1=10000;
KDP2=21;

%%
figure

plot([0; A1(FinicioA1+790:FfinalA1L4,5)+0.55+1.0-0.2-2-A1(FinicioA1+790:FfinalA1L4,1)/KA1],[0; A1(FinicioA1+790:FfinalA1L4,1)],'k--')
hold on
plot([0; A2(FinicioA2+800:FfinalA2L4,5)+0.55+0.65-0.5-0.75+0.05-A2(FinicioA2+800:FfinalA2L4,1)/KA2],[0; A2(FinicioA2+800:FfinalA2L4,1)],'k-')
plot([0; B14(500:end)+0.1-B1P(500:end)/KB1],[0; B1P(500:end)],'g--')
plot([0; B2((FinicioB2+150):FfinalB2L4,5)+0.4-0.2+2.0-0.9-1.2-B2(FinicioB2+150:FfinalB2L4,1)/KB2],[0; B2(FinicioB2+150:FfinalB2L4,1)], 'g-')
plot([0; DP1(FinicioDP1+600:FfinalDP1L4,5)-0.6+0.4-0.1],[0; DP1(FinicioDP1+600:FfinalDP1L4,1)],'b--')
plot([0; DP2(FinicioDP2+800:FfinalDP2L4,5)-3.2+0.6-DP2(FinicioDP2+800:FfinalDP2L4,1)/KDP2],[0; DP2(FinicioDP2+800:FfinalDP2L4,1)],'b-')
plot([0; DA1(FinicioDA1+370:FfinalDA1L4,5)-0.2-DA1(FinicioDA1+370:FfinalDA1L4,1)/KDA1],[0; DA1(FinicioDA1+370:FfinalDA1L4,1)],'r--')
plot([0; DA2(FinicioDA2+210:FfinalDA2L4,5)+0.8-DA2(FinicioDA2+210:FfinalDA2L4,1)/KDA2],[0; DA2(FinicioDA2+210:FfinalDA2L4,1)],'r-')
xlabel('Desplazamiento central (mm)')
ylabel('Carga transversal (kN)')
xlim([0 30])
legend('A1','A2','B1','B2','DP1','DP2','DA1','DA2')
set(gca, 'FontSize', 16)
%xlim([0 1])
set(gca,'fontname','times')  % Set it to times

%ylim([0 30])


KA1=9;
KA2=25;
KB1=16;
KB2=9;
KDA1=39;
KDA2=4.8;
KDP1=10000;
KDP2=13;

figure 

plot([0; A1(FinicioA1+790:FfinalA1L1,2)+0.55+1.0-0.2-2-A1(FinicioA1+790:FfinalA1L1,1)/KA1],[0; A1(FinicioA1+790:FfinalA1L1,1)],'k--')
hold on
plot([0; A2(FinicioA2+800:FfinalA2L1,2)+0.55+0.65-0.5-0.75+0.05-A2(FinicioA2+800:FfinalA2L1,1)/KA2],[0; A2(FinicioA2+800:FfinalA2L1,1)],'k-')
plot([0; B11(500:end)+0.1-B1P(500:end)/KB1],[0; B1P(500:end)],'g--')
plot([0; B2((FinicioB2+150):FfinalB2L1,2)+0.4-0.2+2.0-0.9-1.2-B2(FinicioB2+150:FfinalB2L1,1)/KB2],[0; B2(FinicioB2+150:FfinalB2L1,1)], 'g-')
plot([0; DP1(FinicioDP1+600:FfinalDP1L1,2)-0.6+0.4-0.1],[0; DP1(FinicioDP1+600:FfinalDP1L1,1)],'b--')
plot([0; DP2(FinicioDP2+800:FfinalDP2L1,2)-3.2+0.6-DP2(FinicioDP2+800:FfinalDP2L1,1)/KDP2],[0; DP2(FinicioDP2+800:FfinalDP2L1,1)],'b-')
plot([0; DA1(FinicioDA1+370:FfinalDA1L1,2)-0.2-DA1(FinicioDA1+370:FfinalDA1L1,1)/KDA1],[0; DA1(FinicioDA1+370:FfinalDA1L1,1)],'r--')
plot([0; DA2(FinicioDA2+210:FfinalDA2L1,2)+0.8-DA2(FinicioDA2+210:FfinalDA2L1,1)/KDA2],[0; DA2(FinicioDA2+210:FfinalDA2L1,1)],'r-')
xlabel('Desplazamiento central (mm)')
ylabel('Carga transversal (kN)')
xlim([0 50])
legend('A1','A2','B1','B2','DP1','DP2','DA1','DA2')
set(gca, 'FontSize', 16)
%xlim([0 1])
set(gca,'fontname','times')  % Set it to times
%ylim([0 35])

figure
plot([0; A1(FinicioA1+790:FfinalA1L1,2)+0.55+1.0-0.2-2-A1(FinicioA1+790:FfinalA1L1,1)/KA1],[0; A1(FinicioA1+790:FfinalA1L1,1)],'k--')
hold on
plot([0; A2(FinicioA2+800:FfinalA2L1,2)+0.55+0.65-0.5-0.75+0.05-A2(FinicioA2+800:FfinalA2L1,1)/KA2],[0; A2(FinicioA2+800:FfinalA2L1,1)],'k-')
xlabel('Desplazamiento central (mm)')
ylabel('Carga transversal (kN)')
xlim([0 60])
legend('A1','A2')
set(gca, 'FontSize', 16)
%xlim([0 1])
set(gca,'fontname','times')  % Set it to times
%ylim([0 35])



figure
plot([0; B11(500:end)+0.1-B1P(500:end)/KB1],[0; B1P(500:end)],'g--')
hold on
plot([0; B2((FinicioB2+150):FfinalB2L1,2)+0.4-0.2+2.0-0.9-1.2-B2(FinicioB2+150:FfinalB2L1,1)/KB2],[0; B2(FinicioB2+150:FfinalB2L1,1)], 'g-')
xlabel('Desplazamiento central (mm)')
ylabel('Carga transversal (kN)')
xlim([0 60])
legend('B1','B2')
set(gca, 'FontSize', 16)
%xlim([0 1])
set(gca,'fontname','times')  % Set it to times
%ylim([0 35])


figure
plot([0; DP1(FinicioDP1+600:FfinalDP1L1,2)-0.6+0.4-0.1],[0; DP1(FinicioDP1+600:FfinalDP1L1,1)],'b--')
hold on
plot([0; DP2(FinicioDP2+800:FfinalDP2L1,2)-3.2+0.6-DP2(FinicioDP2+800:FfinalDP2L1,1)/KDP2],[0; DP2(FinicioDP2+800:FfinalDP2L1,1)],'b-')
xlabel('Desplazamiento central (mm)')
ylabel('Carga transversal (kN)')
xlim([0 60])
legend('DP1','DP2')
set(gca, 'FontSize', 16)
%xlim([0 1])
set(gca,'fontname','times')  % Set it to times
%ylim([0 35])



figure
plot([0; DA1(FinicioDA1+370:FfinalDA1L1,2)-0.2-DA1(FinicioDA1+370:FfinalDA1L1,1)/KDA1],[0; DA1(FinicioDA1+370:FfinalDA1L1,1)],'r--')
hold on
plot([0; DA2(FinicioDA2+210:FfinalDA2L1,2)+0.8-DA2(FinicioDA2+210:FfinalDA2L1,1)/KDA2],[0; DA2(FinicioDA2+210:FfinalDA2L1,1)],'r-')
xlabel('Desplazamiento central (mm)')
ylabel('Carga transversal (kN)')
xlim([0 60])
legend('DP1','DP2')
set(gca, 'FontSize', 16)
%xlim([0 1])
set(gca,'fontname','times')  % Set it to times
%ylim([0 35])




figure 
plot([0; DP2(FinicioDP2+800:FfinalDP2L4,5)-3.2+0.6],[0; DP2(FinicioDP2+800:FfinalDP2L4,1)],'b-')

E=20000; % MPa
I= 1/12*(500*150*150*150); % mm4
L=1300; % mm
Rigidez=48*E*I/(L*L*L)/1000; % entre 5 y 30 kN/mm
Rigidez;


close all
%%
x1=0:1/20:(length(A1(FinicioA1:FfinalA1L5))/20-1/20);
x2=0:1/20:(length(B1(FinicioB1:FfinalB1L5))/20-1/20);
x3=0:1/20:(length(DP1(FinicioDP1:FfinalDP1L5))/20-1/20);
x4=0:1/20:(length(DA1(FinicioDA1:FfinalDA1L5))/20-1/20);

x5=0:1/20:(length(A2(FinicioA2:FfinalA2L5))/20-1/20);
x6=0:1/20:(length(B2(FinicioB2:FfinalB2L5))/20-1/20);
x7=0:1/20:(length(DP2(FinicioDP2:FfinalDP2L5))/20-1/20);
x8=0:1/20:(length(DA2(FinicioDA2:FfinalDA2L5))/20-1/20);


figure
plot(x1,A1(FinicioA1:FfinalA1L5,7))
hold on
plot(x2, B1(FinicioB1:FfinalB1L5,7))
plot(x3, DP1(FinicioDP1:FfinalDP1L5,7))
plot(x4, DA1(FinicioDA1:FfinalDA1L5,7))
xlabel('Tiempo (s)')
ylabel('Carga axial (kN)')
set(gca, 'FontSize', 16)
%xlim([0 1])
ylim([50 70])
legend('A1', 'B1', 'DP1', 'DA1')
set(gca,'fontname','times')  % Set it to times


figure
plot(x5,A2(FinicioA2:FfinalA2L5,7))
hold on
plot(x6, B2(FinicioB2:FfinalB2L5,7))
plot(x7, DP2(FinicioDP2:FfinalDP2L5,7))
plot(x8, DA2(FinicioDA2:FfinalDA2L5,7))
xlabel('Tiempo (s)')
ylabel('Carga axial (kN)')
set(gca, 'FontSize', 16)
%xlim([0 1])
ylim([185 215])
legend('A2', 'B2', 'DP2', 'DA2')
set(gca,'fontname','times')  % Set it to times



%%
KA1L1=10000;

figure
plot([0; A1(FinicioA1+780:FfinalA1L1,2)+1.0+0.28+0.28-2.8-A1(FinicioA1+780:FfinalA1L1,1)/KA1],[0; A1(FinicioA1+780:FfinalA1L1,1)])
hold on
%xlim([0 70])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot(A1(FinicioA1:FfinalA1L2,3)+0.42+0.42,A1(FinicioA1:FfinalA1L2,1))
plot([0; A1(FinicioA1+780:FfinalA1L3,4)+0.7+0.37+0.37-2.8-A1(FinicioA1+780:FfinalA1L3,1)/KA1],[0; A1(FinicioA1+780:FfinalA1L3,1)])
plot([0; A1(FinicioA1+780:FfinalA1L4,5)+0.9+0.55-2-A1(FinicioA1+780:FfinalA1L4,1)/KA1],[0; A1(FinicioA1+780:FfinalA1L4,1)])
%plot(A1(FinicioA1:FfinalA1L5,6)+0.33+0.33,A1(FinicioA1:FfinalA1L5,1))
legend('1', '3', '4')
title('A1 (Marco y doble malla a 60 kN Axial)')

figure
plot([0;A2((FinicioA2+1005):FfinalA2L1,2)+0.28+0.28+0.45+1.2-A2((FinicioA2+1005):FfinalA2L1,1)/KA2],[0.8; A2((FinicioA2+1005):FfinalA2L1,1)])
hold on
%xlim([0 70])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([0; A2((FinicioA2+1450):FfinalA2L2,3)+0.42+0.42+4],[0.8; A2((FinicioA2+1450):FfinalA2L2,1)])
plot([0; A2((FinicioA2+870):FfinalA2L3,4)+0.5+0.37+0.37+0.1-A2((FinicioA2+870):FfinalA2L3,1)/KA2],[0.8;A2((FinicioA2+870):FfinalA2L3,1)])
plot([0; A2(FinicioA2+1000:FfinalA2L4,5)+0.4+0.55+0.65-0.5-0.65+0.05-A2(FinicioA2+1000:FfinalA2L4,1)/KA2],[0; A2(FinicioA2+1000:FfinalA2L4,1)])
%plot(A2(FinicioA2:FfinalA2L5,6)+0.33+0.33+1.3-0.7-1,A2(FinicioA2:FfinalA2L5,1))
legend('1', '3', '4')
title('A2 (Marco y doble malla a 200 kN Axial)')


figure
plot([0; B11(50:end)-B1P(50:end)/KB1+0.07],[0; B1P(50:end)])
hold on
%xlim([0 15])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([B1((FinicioB1):FfinalB1L2,3)],[B1((FinicioB1):FfinalB1L2,1)])
plot([0; B13(50:end)-B1P(50:end)/KB1+0.07],[0; B1P(50:end)])
plot([0; B14(50:end)-B1P(50:end)/KB1+0.07],[0; B1P(50:end)])
%plot(B1(FinicioB1:FfinalB1L5,6),B1(FinicioB1:FfinalB1L5,1))
%plot(B1(FinicioB1:FfinalB1L5,8)-108+0.8,B1(FinicioB1:FfinalB1L5,1))
legend('1', '3', '4', 'US')
title('B1 (doble malla a 60 kN Axial)')

%B2(:,5)=2*B2(:,5)
figure
plot([0; B2((FinicioB2+310):FfinalB2L1,2)-3.0+0.3+1.0-0.4+0.1-B2((FinicioB2+310):FfinalB2L1,1)/KB2],[0; B2((FinicioB2+310):FfinalB2L1,1)])
hold on
%xlim([0 60])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([0; B2((FinicioB2+1100):FfinalB2L2,3)]-0.4,[0; B2((FinicioB2+1100):FfinalB2L2,1)])
plot([0; B2((FinicioB2+310):FfinalB2L3,4)-4.0+1.0+1.0-0.6-0.5+0.9-B2((FinicioB2+310):FfinalB2L3,1)/KB2],[0; B2((FinicioB2+310):FfinalB2L3,1)])
plot([0; B2((FinicioB2+110):FfinalB2L4,5)-3.0+2.2+0.4-0.2+2.0-0.9-B2(FinicioB2+110:FfinalB2L4,1)/KB2],[0; B2(FinicioB2+110:FfinalB2L4,1)])
%plot([0; B2(FinicioB2+700:FfinalB2L5,6)]+0.0,[0; B2(FinicioB2+700:FfinalB2L5,1)])
legend('1', '3', '4')
title('B2 (doble malla a 200 kN Axial)')



figure
plot([0; DP1((FinicioDP1+600):FfinalDP1L1,2)-0.6+0.2-DP1((600+FinicioDP1):FfinalDP1L1,1)/KDP1],[0; DP1((600+FinicioDP1):FfinalDP1L1,1)])
hold on
%xlim([0 50])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([DP1((FinicioDP1):FfinalDP1L2,3)],[DP1((FinicioDP1):FfinalDP1L2,1)])
plot([0; DP1((FinicioDP1+600):FfinalDP1L3,4)-0.6+0.3-DP1((FinicioDP1+600):FfinalDP1L3,1)/KDP1],[0; DP1((FinicioDP1+600):FfinalDP1L3,1)])
plot([0; DP1(FinicioDP1+600:FfinalDP1L4,5)-0.6+0.4-0.1-DP1(FinicioDP1+600:FfinalDP1L4,1)/KDP1],[0; DP1(FinicioDP1+600:FfinalDP1L4,1)])
%plot(DP1(FinicioDP1:FfinalDP1L5,6),DP1(FinicioDP1:FfinalDP1L5,1))
%plot([0; DP1(FinicioDP1+600:FfinalDP1L5,8)-108+0.8+12+1.3-0.3-0.3],[0; DP1(FinicioDP1+600:FfinalDP1L5,1)])
legend('1', '3', '4', 'US')
title('DP1 (Marco, fibras pl?sticas, y malla en compresi?n a 60 kN Axial)')

figure
plot([0; DP2((FinicioDP2+800):FfinalDP2L1,2)-3.2-0.2-DP2((FinicioDP2+800):FfinalDP2L1,1)/KDP2],[0; DP2((FinicioDP2+800):FfinalDP2L1,1)])
hold on
%xlim([0 60])
%xlim([0 10])
%ylim([0 30])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([0; DP2((FinicioDP2):FfinalDP2L2,3)],[0; DP2((FinicioDP2):FfinalDP2L2,1)])
plot([0; DP2((FinicioDP2+800):FfinalDP2L3,4)-3.2-0.4-DP2((FinicioDP2+800):FfinalDP2L3,1)/KDP2],[0; DP2((FinicioDP2+800):FfinalDP2L3,1)])
plot([0; DP2(FinicioDP2+800:FfinalDP2L4,5)-3.2+0.3+0.6-DP2(FinicioDP2+800:FfinalDP2L4,1)/KDP2],[0; DP2(FinicioDP2+800:FfinalDP2L4,1)])
%plot([0; DP2(FinicioDP2+605:FfinalDP2L5,6)-2.0],[0; DP2(FinicioDP2+605:FfinalDP2L5,1)])
legend('1', '3', '4')
title('DP2 (Marco, fibras pl?sticas, y malla en compresi?n a 200 kN Axial)')


figure
plot([0; DA1((FinicioDA1+370):FfinalDA1L1,2)-0.2-DA1((FinicioDA1+370):FfinalDA1L1,1)/KDA1],[0; DA1((FinicioDA1+370):FfinalDA1L1,1)])
hold on
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([DA1((FinicioDA1):FfinalDA1L2,3)],[DA1((FinicioDA1):FfinalDA1L2,1)])
plot([0; DA1((FinicioDA1+370):FfinalDA1L3,4)-0.2-DA1((FinicioDA1+370):FfinalDA1L3,1)/KDA1],[0; DA1((FinicioDA1+370):FfinalDA1L3,1)])
plot([0; DA1(FinicioDA1+370:FfinalDA1L4,5)-0.2-DA1(FinicioDA1+370:FfinalDA1L4,1)/KDA1],[0; DA1(FinicioDA1+370:FfinalDA1L4,1)])
%plot(DA1(FinicioDA1:FfinalDA1L5,6),DA1(FinicioDA1:FfinalDA1L5,1))
%plot([0; DA1(FinicioDA1+270:FfinalDA1L5,8)-108+0.8+12+1.3-14-0.2],[0; DA1(FinicioDA1+270:FfinalDA1L5,1)])
legend('1', '3', '4', 'US')
title('DA1 (Marco, fibras de acero, y malla en compresi?n a 60 kN Axial)')

figure
plot([0; DA2((FinicioDA2+610):FfinalDA2L1,2)+0.8-DA2((FinicioDA2+610):FfinalDA2L1,1)/KDA2],[0; DA2((FinicioDA2+610):FfinalDA2L1,1)])
hold on
%xlim([0 60])
%xlim([0 10])
%ylim([0 30])
%ylim([0 25])
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
%plot([0; DA2((FinicioDA2):FfinalDA2L2,3)],[0; DA2((FinicioDA2):FfinalDA2L2,1)])
plot([0; DA2((FinicioDA2+610):FfinalDA2L3,4)+1.4+1.2-DA2((FinicioDA2+610):FfinalDA2L3,1)/KDA2],[0; DA2((FinicioDA2+610):FfinalDA2L3,1)])
plot([0; DA2(FinicioDA2+610:FfinalDA2L4,5)+1.4+0.8-DA2(FinicioDA2+610:FfinalDA2L4,1)/KDA2],[0; DA2(FinicioDA2+610:FfinalDA2L4,1)])
%plot([0; DA2(FinicioDA2+905:FfinalDA2L5,6)+2.0],[0; DA2(FinicioDA2+905:FfinalDA2L5,1)])
legend('1', '3', '4')
title('DA2 (Marco, fibras de acero, y malla en compresi?n a 200 kN Axial)')

%close all

%%

FInicioA=5000;
FInicioB=12000;

Ffinal1A=1.45*10000;
Ffinal2A=1.1*10000;
Ffinal3A=0.9*10000;
Ffinal4A=1.15*10000;
Ffinal5A=0.50*10000;
Ffinal6A=0.85*10000;
Ffinal7A=1.5*10000;

Ffinal1B=1.45*10000;
Ffinal2B=1.5*10000;
Ffinal3B=1.5*10000;
Ffinal4B=1.4*10000;
Ffinal5B=0.7*10000;
Ffinal6B=1.33*10000;
Ffinal7B=1.5*10000;


A=A(FInicioA:length(A),1:7);

B=B(FInicioB:length(B),1:7);

FUC=340;

A(:,1)=A(:,1)-min(A(:,1));
A(:,2)=A(:,2)-min(A(:,2));
A(:,3)=A(:,3)-min(A(:,3));
A(:,4)=A(:,4)-min(A(:,4));
A(:,5)=A(:,5)-min(A(:,5));
A(:,6)=A(:,6)-min(A(:,6));
A(:,7)=A(:,7)-min(A(:,7));

A(:,1)=A(:,1)*60/0.3;

%A(:,2:6)=A(:,2:6)*25.4/5;

FCLVDT1=25.4/5;

A(:,2)=A(:,2)*FCLVDT1;
A(:,3)=A(:,3)*FCLVDT1;
A(:,4)=A(:,4)*FCLVDT1;
A(:,5)=A(:,5)*FCLVDT1;
A(:,6)=A(:,6)*FCLVDT1;


A(:,2)=A(:,2)*2;
A(:,5)=A(:,5)*2;

%A(:,7)=A(:,7)*60/0.185;
A(:,7)=A(:,7)*FUC;

%

B(:,1)=B(:,1)-min(B(:,1));
B(:,2)=B(:,2)-min(B(:,2));
B(:,3)=B(:,3)-min(B(:,3));
B(:,4)=B(:,4)-min(B(:,4));
B(:,5)=B(:,5)-min(B(:,5));
B(:,6)=B(:,6)-min(B(:,6));
B(:,7)=B(:,7)-min(B(:,7));

B(:,1)=B(:,1)*60/0.3;

%B(:,2:6)=B(:,2:6)*25.4/5;

B(:,2)=B(:,2)*FCLVDT1;
B(:,3)=B(:,3)*FCLVDT1;
B(:,4)=B(:,4)*FCLVDT1;
B(:,5)=B(:,5)*FCLVDT1;
B(:,6)=B(:,6)*FCLVDT1;

B(:,2)=B(:,2)*2;
B(:,4)=B(:,4)*2;

%B(:,7)=B(:,7)*200/0.55;
B(:,7)=B(:,7)*FUC;

% 

figure 

%plot(A(1:Ffinal7A,7))
hold on
plot(A(1:Ffinal6A,6))
plot(A(1:Ffinal5A,5))
plot(A(1:Ffinal4A,4))
plot(A(1:Ffinal3A,3))
plot(A(1:Ffinal2A,2))
%plot(A(1:Ffinal1A,1))

legend('LVDT Izquierdo', 'LVDT central 2', 'LVDT central 3', 'LVDT derecho', 'LVDT central 1', 'Carga lateral') 

xlabel('Tiempo (20 muestras/segundo)')
ylabel('kN (cargas), mm (desplazamientos)')

title('Datos semi crudos (llevados a 0 y calibrados nominalmente), Carga axial 6 toneladas')

%ylim([0 100])

%


figure 

%plot(B(1:Ffinal7B,7))
hold on
plot(B(1:Ffinal6B,6))
plot(B(1:Ffinal5B,5))
plot(B(1:Ffinal4B,4))
plot(B(1:Ffinal3B,3))
plot(B(1:Ffinal2B,2))
%plot(B(1:Ffinal1B,1))

legend('LVDT Izquierdo', 'LVDT central 2', 'LVDT central 3', 'LVDT derecho', 'LVDT central 1', 'Carga lateral') 

xlabel('Tiempo (20 muestras/segundo)')
ylabel('kN (cargas), mm (desplazamientos)')

title('Datos semi crudos (llevados a 0 y calibrados nominalmente), Carga axial 20 toneladas')

%ylim([0 250])

% 

figure

plot(A(7:Ffinal7A,7))

xlabel('Tiempo (20 muestras/segundo)')
ylabel('kN (Carga axial), 6 toneladas')

title('Carga axial (kN)')


%


figure

plot(B(7:Ffinal7B,7))

xlabel('Tiempo (20 muestras/segundo)')
ylabel('kN (Carga axial)')

title('Carga axial (kN), 20 toneladas')

% 


figure 

plot(A(1:Ffinal6A,6),A(1:Ffinal6A,1))
hold on
plot(A(1:Ffinal5A,5),A(1:Ffinal5A,1))
plot(A(1:Ffinal4A,4),A(1:Ffinal4A,1))
plot(A(1:Ffinal3A,3),A(1:Ffinal3A,1))
plot(A(1:Ffinal2A,2),A(1:Ffinal2A,1))

xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')

legend('LVDT Izquierdo', 'LVDT central 2', 'LVDT central 3', 'LVDT derecho', 'LVDT central 1') 

title('P-\delta, Axial 6 toneladas')

figure 

plot(B(1:Ffinal6B,6),B(1:Ffinal6B,1))
hold on
plot(B(1:Ffinal5B,5),B(1:Ffinal5B,1))
plot(B(1:Ffinal4B,4),B(1:Ffinal4B,1))
plot(B(1:Ffinal3B,3),B(1:Ffinal3B,1))
plot(B(1:Ffinal2B,2),B(1:Ffinal2B,1))

xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')

legend('LVDT Izquierdo', 'LVDT central 2', 'LVDT central 3', 'LVDT derecho', 'LVDT central 1') 

title('P-\delta, Axial 20 toneladas')


