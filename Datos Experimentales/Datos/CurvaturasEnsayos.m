datos=importdata('A1Derv2-A1Derv2_1_strain-xx.txt', '	', 1);
datos2=importdata('A1Derv2-A1Derv2_1_strain-xy.txt', '	', 1);
[M N] = size(datos.data);
phisA1=zeros(M,8);
gammas=zeros(M,8);
for i=1:M
   phisA1(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,1)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('A1Derv2-A1Derv2_2_strain-xx.txt', '	', 1);
datos2=importdata('A1Derv2-A1Derv2_2_strain-xy.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA1(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,2)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('A1Derv2-A1Derv2_3_strain-xx.txt', '	', 1);
datos2=importdata('A1Derv2-A1Derv2_3_strain-xy.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA1(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,3)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('A1Derv2-A1Derv2_4_strain-xx.txt', '	', 1);
datos2=importdata('A1Derv2-A1Derv2_4_strain-xy.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA1(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,4)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('A1Izqv2-A1Izqv1_1_strain-xx.txt', '	', 1);
datos2=importdata('A1Izqv2-A1Izqv1_1_strain-xy.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA1(i,5)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,5)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('A1Izqv2-A1Izqv2_2_strain-xx.txt', '	', 1);
datos2=importdata('A1Izqv2-A1Izqv2_2_strain-xy.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA1(i,6)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,6)=abs(mean(datos2.data(i,2:end)));

end

datos=importdata('A1Izqv2-A1Izqv2_3_strain-xx.txt', '	', 1);
datos2=importdata('A1Izqv2-A1Izqv2_3_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisA1(i,7)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,7)=abs(mean(datos2.data(i,2:end)));

end

datos=importdata('A1Izqv2-A1Izqv2_4_strain-xx.txt', '	', 1);
datos2=importdata('A1Izqv2-A1Izqv2_4_strain-xy.txt', '	', 1);

[M N] = size(datos.data);

for i=1:M
   phisA1(i,8)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,8)=abs(mean(datos2.data(i,2:end)));

end

for i=1:8
   %phisA1(:,i)=smooth(phisA1(:,i));
end

xesder=650+(0:(700-0)/(length(gammas)-1):700);
xesder=690+(0:10:(10*(length(xesder)-1)));
xesizq=(60:(760-60)/(length(gammas)-1):760);
xesizq=120+(0:10:(10*(length(xesizq)-1)));
nf = 0;
figure
%plot([xesder, 1300],[phisA1(1:end-nf,1);0])
plot([xesder(1:end-30), 1300],[phisA1(1:end-nf-30,2);0], 'r')
hold on
plot([xesder(1:end-30), 1300],[phisA1(1:end-nf-30,3);0], 'g')
plot([xesder(1:end-30), 1300],[phisA1(1:end-nf-30,4);0], 'b')
%plot([0, xesizq], [0; phisA1(1:end-nf,5)])
plot([0, xesizq(20:end-5)], [0; phisA1(20:end-nf-5,6)], 'r')
plot([0, xesizq(20:end-5)], [0; phisA1(20:end-nf-5,7)], 'g')
plot([0, xesizq(20:end-5)], [0; phisA1(20:end-nf-5,8)], 'b')
xlim([0 1300])
ylim([0 0.25])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')


figure
%plot([xesder, 1300],[gammas(1:end-nf,1);0])
plot([xesder(1:end-30), 1300],[gammas(1:end-nf-30,2);0], 'r')
hold on
plot([xesder(1:end-30), 1300],[gammas(1:end-nf-30,3);0], 'g')
plot([xesder(1:end-30), 1300],[gammas(1:end-nf-30,4);0], 'b')
%plot([0, xesizq], [0; gammas(1:end-nf,5)])
plot([0, xesizq(20:end-5)], [0; gammas(20:end-nf-5,6)], 'r')
%plot([0, xesizq(20:end-5)], [0; gammas(20:end-nf-5,7)], 'g')
plot([0, xesizq(20:end-5)], [0; gammas(20:end-nf-5,8)], 'b')
xlim([0 1300])
ylim([0 0.02])
ylabel('Deformaci?n de Corte \epsilon_xy ')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')


%%

datos=importdata('A2Derv2-A2Derv2_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
phisA2=zeros(M,8);
for i=1:M
   phisA2(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('A2Derv2-A2Derv2_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA2(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('A2Derv2-A2Derv2_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA2(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

%phisA2(41:end,3)=phisA2(41,3)+abs(phisA2(41:end,3)-phisA2(41,3))

datos=importdata('A2Derv2-A2Derv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA2(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('A2Izqv2-A2Izqv2_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA2(i,5)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('A2Izqv2-A2Izqv2_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA2(i,6)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('A2Izqv2-A2Izqv2_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA2(i,7)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('A2Izqv2-A2Izqv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisA2(i,8)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

for i=1:8
   phisA2(:,i)=smooth(phisA2(:,i));
end

xesder=650+(0:(700-0)/(length(phisA2)-1):700);
xesder=690+(0:10:(10*(length(xesder)-1)));
xesizq=(60:(760-60)/(length(phisA2)-1):760);
xesizq=120+(0:10:(10*(length(xesizq)-1)));
nf = 0;
figure
%plot([xesder, 1300],[phisA2(1:end-nf,1);0])
plot([xesder(1:end), 1300],[phisA2(1:end-nf,2);0], 'r')
hold on
plot([xesder(3:end), 1300],[phisA2(3:end-nf,3);0], 'g')
plot([xesder(3:end), 1300],[phisA2(3:end-nf,4);0], 'b')

plot([0, xesizq(1:end-4)], [0; phisA2(1:end-nf-4,5)], 'r')
%plot([0, xesizq(1:end-5)], [0; phisA2(1:end-nf-5,6)], 'r')
plot([0, xesizq(1:end-3)], [0; phisA2(1:end-nf-3,7)], 'g')
plot([0, xesizq(1:end-5)], [0; phisA2(1:end-nf-5,8)], 'b')
xlim([0 1300])
ylim([0 0.4])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%%
datos=importdata('B1Derv3-B1Derv3_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
phisB1=zeros(M,8);
for i=1:M
   phisB1(i,1)=(mean(datos.data(i,2:end))/(150-30/2)*100);
end

datos=importdata('B1Derv3-B1Derv3_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB1(i,2)=(mean(datos.data(i,2:end))/(150-30/2)*100);
end

datos=importdata('B1Derv3-B1Derv3_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB1(i,3)=(mean(datos.data(i,2:end))/(150-30/2)*100);
end

%phisB1(41:end,3)=phisB1(41,3)+abs(phisB1(41:end,3)-phisB1(41,3))

datos=importdata('B1Derv2-B1Derv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB1(i,4)=(mean(datos.data(i,2:end))/(150-30/2)*100);
end


datos=importdata('B1Izqv2-B1Izqv2_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB1(i,5)=abs(mean(datos.data(i,2:end))/(150-30/2)*100);
end

datos=importdata('B1Izqv2-B1Izqv2_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB1(i,6)=abs(mean(datos.data(i,2:end))/(150-30/2)*100);
end


datos=importdata('B1Izqv2-B1Izqv2_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB1(i,7)=abs(mean(datos.data(i,2:end))/(150-30/2)*100);
end

datos=importdata('B1Izqv2-B1Izqv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB1(i,8)=abs(mean(datos.data(i,2:end))/(150-30/2)*100);
end

for i=1:8
   phisB1(:,i)=smooth(phisB1(:,i));
end

xesder=650+(0:(700-0)/(length(phisB1)-1):700);
xesder=700+(0:10:(10*(length(xesder)-1)));
xesizq=(60:(760-60)/(length(phisB1)-1):760);
xesizq=200+(0:10:(10*(length(xesizq)-1)));
nf = 0;
figure
%plot([xesder, 1300],[phisB1(1:end-nf,1);0], 'r')
plot([xesder, 1300],[phisB1(1:end-nf,2);0], 'r')
hold on
plot([xesder, 1300],[phisB1(1:end-nf,2);0], 'g')
plot([xesder, 1300],[phisB1(1:end-nf,2);0], 'b')
%plot([0, xesizq], [0; phisB1(1:end-nf,5)], 'r')
hold on
plot([0, xesizq(1:end-5)], [0; phisB1(1:end-nf-5,6)], 'r')
plot([0, xesizq+380], [0; phisB1(1:end-nf,7)], 'g')
plot([0, xesizq], [0; phisB1(1:end-nf,8)], 'b')
xlim([0 1300])
ylim([0 0.07])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%%

datos=importdata('B2Derv3-B2Derv3_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
phisB2=zeros(M,8);
for i=1:M
   phisB2(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('B2Derv3-B2Derv3_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB2(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('B2Derv3-B2Derv3_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB2(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('B2Derv3-B2Derv3_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB2(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('B2Izqv3-B2Izqv3_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB2(i,5)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('B2Izqv3-B2Izqv3_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB2(i,6)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('B2Izqv3-B2Izqv3_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB2(i,7)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('B2Izqv2-B2Izqv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisB2(i,8)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


for i=1:8
   phisB2(:,i)=smooth(phisB2(:,i));
end

xesder=650+(0:(700-0)/(length(phisB2)-1):700);
xesder=690+(0:10:(10*(length(xesder)-1)));
xesizq=(60:(760-60)/(length(phisB2)-1):760);
xesizq=120+(0:10:(10*(length(xesizq)-1)));
nf = 0;
figure
%plot([xesder, 1300],[phisB2(1:end-nf,1);0])
plot([xesder, 1300],[phisB2(1:end-nf,2);0], 'r')
hold on
plot([xesder, 1300],[phisB2(1:end-nf,3);0], 'g')
%plot([xesder, 1300],[phisB2(1:end-nf,4);0], 'b')
%plot([0, xesizq(20:end)], [0; phisB2(20:end-nf,5)])
plot([0, xesizq(20:end-5)], [0; phisB2(20:end-nf-5,6)], 'r')
plot([0, xesizq(20:end)], [0; phisB2(20:end-nf,7)], 'g')
%plot([0, xesizq(20:end)], [0; phisB2(20:end-nf,8)], 'b')
xlim([0 1300])
%ylim([0 0.2])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%%
datos=importdata('CA1v2-CA1v2_1_strain-xx.txt', '	', 1);
datos2=importdata('CA1v2-CA1v2_1_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
phisCA1=zeros(M,8);
for i=1:M
   phisCA1(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,1)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('CA1v2-CA1v2_2_strain-xx.txt', '	', 1);
datos2=importdata('CA1v2-CA1v2_2_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCA1(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,2)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('CA1v2-CA1v2_3_strain-xx.txt', '	', 1);
datos2=importdata('CA1v2-CA1v2_3_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCA1(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,3)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('CA1v2-CA1v2_4_strain-xx.txt', '	', 1);
datos2=importdata('CA1v2-CA1v2_4_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCA1(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,4)=abs(mean(datos2.data(i,2:end)));
end

for i=1:8
   phisCA1(:,i)=smooth(phisCA1(:,i));
end

xesder=650+(0:(700-0)/(length(phisCA1)-1):700);
xesder=0+(0:10:(10*(length(xesder)-1)));
nf = 0;
figure
plot([xesder, 500],[phisCA1(1:end-nf,1);0], 'r')
hold on
%plot([xesder, 600],[phisCA1(1:end-nf,2);0], 'r')
plot([xesder, 500],[phisCA1(1:end-nf,3);0], 'g')
plot([xesder, 500],[phisCA1(1:end-nf,4);0], 'b')
xlim([0 400])
ylim([0 0.5])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

xes=5:10:395;

figure
plot([xes, 400],[gammas(1:end-nf,1);0])
hold on
plot([xes(1:end), 400],[gammas(1:end-nf,2);0], 'r')
hold on
plot([xes(1:end), 400],[gammas(1:end-nf,3);0], 'g')
plot([xes(1:end), 400],[gammas(1:end-nf,4);0], 'b')
xlim([0 400])
ylim([0 0.12])
ylabel('Deformaci?n de Corte \epsilon_{xy} ')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')


%%
datos=importdata('CP1v2-CP1v2_1_strain-xx.txt', '	', 1);
datos2=importdata('CP1v2-CP1v2_1_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
phisCP1=zeros(M,8);
for i=1:M
   phisCP1(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,1)=abs(mean(datos2.data(i,2:end)));

end

datos=importdata('CP1v2-CP1v2_2_strain-xx.txt', '	', 1);
datos2=importdata('CP1v2-CP1v2_2_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCP1(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,2)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('CP1v2-CP1v2_3_strain-xx.txt', '	', 1);
datos2=importdata('CP1v2-CP1v2_3_strain-xy.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisCP1(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,3)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('CP1v2-CP1v2_4_strain-xx.txt', '	', 1);
datos2=importdata('CP1v2-CP1v2_4_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCP1(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,4)=abs(mean(datos2.data(i,2:end)));
end

for i=1:8
   phisCP1(:,i)=smooth(phisCP1(:,i));
end

xesder=650+(0:(700-0)/(length(phisCP1)-1):700);
xesder=0+(0:10:(10*(length(xesder)-1)));
nf = 0;
figure
plot([xesder, 500],[phisCP1(1:end-nf,1);0], 'r')
hold on
%plot([xesder, 500],[phisCP1(1:end-nf,2);0], 'g')
plot([xesder, 500],[phisCP1(1:end-nf,3);0], 'b')
%plot([xesder, 500],[phisCP1(1:end-nf,4);0], 'b')
xlim([0 400])
ylim([0 0.7])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')


xes=55:10:445;

figure
plot([xes, 500],[gammas(1:end-nf,1);0], 'r')
hold on
%plot([xes(1:end), 500],[gammas(1:end-nf,2);0], 'r')
plot([xes(1:end), 500],[gammas(1:end-nf,3);0], 'g')
plot([xes(1:end), 500],[gammas(1:end-nf,4);0], 'b')
xlim([0 500])
ylim([0 0.035])
ylabel('Deformaci?n de Corte \epsilon_{xy} ')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')



%%

datos=importdata('CA2v2-CA2v2_1_strain-xx.txt', '	', 1);
datos2=importdata('CA2v2-CA2v2_1_strain-xy.txt', '	', 1);
[M N] = size(datos.data);
phisCA2=zeros(M,8);
for i=1:M
   phisCA2(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,1)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('CA2v2-CA2v2_2_strain-xx.txt', '	', 1);
datos2=importdata('CA2v2-CA2v2_2_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCA2(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,2)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('CA2v2-CA2v2_3_strain-xx.txt', '	', 1);
datos2=importdata('CA2v2-CA2v2_3_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCA2(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,3)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('CA2v2-CA2v2_4_strain-xx.txt', '	', 1);
datos2=importdata('CA2v2-CA2v2_4_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCA2(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,4)=abs(mean(datos2.data(i,2:end)));
end

for i=1:8
   phisCA2(:,i)=smooth(phisCA2(:,i));
end

xesder=650+(0:(700-0)/(length(phisCA2)-1):700);
xesder=100+(0:10:(10*(length(xesder)-1)));
nf = 0;
figure
plot([0, xesder, 600],[0; phisCA2(1:end-nf,1);0], 'r')
hold on
plot([0, xesder, 600],[0; phisCA2(1:end-nf,2);0], 'g')
plot([0, xesder, 600],[0; phisCA2(1:end-nf,3);0], 'b')
%plot([0, xesder, 600],[0; phisCA2(1:end-nf,4);0], 'b')
xlim([0 600])
ylim([0 0.15])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

xes=-15:10:415;

figure
plot([xes, 400],[gammas(1:end-nf,1);0], 'r')
hold on
plot([xes(1:end), 400],[gammas(1:end-nf,2);0], 'g')
hold on
plot([xes(1:end), 400],[gammas(1:end-nf,3);0], 'b')
%plot([xes(1:end), 400],[gammas(1:end-nf,4);0], 'b')
xlim([0 400])
ylim([0 0.035])
ylabel('Deformaci?n de Corte \epsilon_{xy} ')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')



%%
datos=importdata('CP2v2-CP2v2_1_strain-xx.txt', '	', 1);
datos2=importdata('CP2v2-CP2v2_1_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
phisCP2=zeros(M,8);
for i=1:M
   phisCP2(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,1)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('CP2v2-CP2v2_2_strain-xx.txt', '	', 1);
datos2=importdata('CP2v2-CP2v2_2_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCP2(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,2)=abs(mean(datos2.data(i,2:end)));
end

datos=importdata('CP2v2-CP2v2_3_strain-xx.txt', '	', 1);
datos2=importdata('CP2v2-CP2v2_3_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCP2(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,3)=abs(mean(datos2.data(i,2:end)));
end

%phisCP2(41:end,3)=phisCP2(41,3)+abs(phisCP2(41:end,3)-phisCP2(41,3))

datos=importdata('CP2v2-CP2v2_4_strain-xx.txt', '	', 1);
datos2=importdata('CP2v2-CP2v2_4_strain-xy.txt', '	', 1);

[M N] = size(datos.data);
for i=1:M
   phisCP2(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
   gammas(i,4)=abs(mean(datos2.data(i,2:end)));
end


for i=1:8
   phisCP2(:,i)=smooth(phisCP2(:,i));
end

xesder=650+(0:(700-0)/(length(phisCP2)-1):700);
xesder=100+(0:10:(10*(length(xesder)-1)));
nf = 0;
figure
%plot([0, xesder, 600],[0; phisCP2(1:end-nf,1);0], 'r')
%hold on
plot([0, xesder, 600],[0; phisCP2(1:end-nf,2);0], 'r')
hold on
plot([0, xesder, 600],[0; phisCP2(1:end-nf,3);0], 'g')
plot([0, xesder, 600],[0; phisCP2(1:end-nf,4);0], 'b')
xlim([0 600])
ylim([0 0.5])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')



xes=35:10:465;

figure
plot([xes, 500],[gammas(1:end-nf,1);0], 'r')
hold on
plot([xes(1:end), 500],[gammas(1:end-nf,2);0], 'r')
plot([xes(1:end), 500],[gammas(1:end-nf,3);0], 'g')
plot([xes(1:end), 500],[gammas(1:end-nf,4);0], 'b')
xlim([0 500])
ylim([0 0.08])
ylabel('Deformaci?n de Corte \epsilon_{xy} ')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')



%%

datos=importdata('DA1Derv3-DA1Derv3_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
phisDA1=zeros(M,8);
for i=1:M
   phisDA1(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DA1Derv3-DA1Derv3_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA1(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DA1Derv2-DA1Derv2_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA1(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

%phisDA1(41:end,3)=phisDA1(41,3)+abs(phisDA1(41:end,3)-phisDA1(41,3))

datos=importdata('DA1Derv2-DA1Derv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA1(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('DA1Izqv2-DA1Izqv2_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA1(i,5)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DA1Izqv2-DA1Izqv2_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA1(i,6)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('DA1Izqv2-DA1Izqv2_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA1(i,7)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DA1Izqv2-DA1Izqv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA1(i,8)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


for i=1:8
   phisDA1(:,i)=smooth(phisDA1(:,i));
   phisDA1(:,i)=smooth(phisDA1(:,i));
end

xesder=650+(0:(700-0)/(length(phisDA1)-1):700);
xesder=675+(0:10:(10*(length(xesder)-1)));
xesizq=(60:(760-60)/(length(phisDA1)-1):760);
xesizq=120+(0:10:(10*(length(xesizq)-1)));
nf = 0;
figure
plot([xesder, 1300],[phisDA1(1:end-nf,1);0],'r')
hold on
plot([xesder(1:end), 1300],[phisDA1(1:end-nf,2);0], 'g')
%hold on
%plot([xesder(1:end), 1300],[phisDA1(1:end-nf,3);0], 'g')
%plot([xesder(1:end), 1300],[phisDA1(1:end-nf,4);0], 'b')

%plot([0, xesizq(1:end)], [0; phisDA1(1:end-nf,5)], 'r')
%plot([0, xesizq(1:end-5)], [0; phisDA1(1:end-nf-5,6)], 'g')
plot([0, xesizq(5:end)], [0; phisDA1(5:end-nf,7)], 'r')
plot([0, xesizq(5:end)], [0; phisDA1(5:end-nf,8)], 'g')
xlim([0 1300])
ylim([0 0.3])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%%

datos=importdata('DA2Derv2-DA2Derv2_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
phisDA2=zeros(M,8);
for i=1:M
   phisDA2(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DA2Derv2-DA2Derv2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA2(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DA2Derv2-DA2Derv2_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA2(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('DA2Derv2-DA2Derv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA2(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('DA2Izqv3-DA2Izqv3_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA2(i,5)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DA2Izqv3-DA2Izqv3_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA2(i,6)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('DA2Izqv3-DA2Izqv3_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA2(i,7)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DA2Izqv2-DA2Izqv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDA2(i,8)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

for i=1:8
   phisDA2(:,i)=smooth(phisDA2(:,i));
end


xesder=650+(0:(700-0)/(length(phisDA2)-1):700);
xesder=650+(0:10:(10*(length(xesder)-1)));
xesizq=(60:(760-60)/(length(phisDA2)-1):760);
xesizq=120+(0:10:(10*(length(xesizq)-1)));
nf = 0;
figure
%plot([xesder, 1300],[phisDA2(1:end-nf,1);0],'r')
plot([xesder(1:end), 1300],[phisDA2(1:end-nf,2);0], 'r')
hold on
plot([xesder(1:end), 1300],[phisDA2(1:end-nf,3);0], 'g')
plot([xesder(1:end), 1300],[phisDA2(1:end-nf,4);0], 'b')

plot([0, xesizq(1:end)], [0; phisDA2(1:end-nf,5)], 'r')
plot([0, xesizq(1:end-5)], [0; phisDA2(1:end-nf-5,6)], 'g')
plot([0, xesizq(1:end)], [0; phisDA2(1:end-nf,7)], 'b')
%plot([0, xesizq(1:end)], [0; phisDA2(1:end-nf,8)], 'b')
xlim([0 1300])
ylim([0 0.7])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%%

datos=importdata('DP1Derv2-DP1Derv2_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
phisDP1=zeros(M,8);
for i=1:M
   phisDP1(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DP1Derv2-DP1Derv2_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP1(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DP1Derv2-DP1Derv2_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP1(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DP1Derv2-DP1Derv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP1(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('DP1Izqv2-DP1Izqv2_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP1(i,5)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DP1Izqv2-DP1Izqv2_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP1(i,6)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('DP1Izqv2-DP1Izqv2_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP1(i,7)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DP1Izqv2-DP1Izqv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP1(i,8)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

for i=1:8
   phisDP1(:,i)=smooth(phisDP1(:,i));
end

xesder=650+(0:(700-0)/(length(phisDP1)-1):700);
xesder=690+(0:10:(10*(length(xesder)-1)));
xesizq=(60:(760-60)/(length(phisDP1)-1):760);
xesizq=120+(0:10:(10*(length(xesizq)-1)));
nf = 0;
figure
%plot([xesder, 1300],[phisDP1(1:end-nf,1);0], 'r')
plot([xesder(1:end), 1300],[phisDP1(1:end-nf,2);0], 'r')
hold on
plot([xesder(1:end), 1300],[phisDP1(1:end-nf,3);0], 'g')
plot([xesder(1:end), 1300],[phisDP1(1:end-nf,4);0], 'b')

plot([0, xesizq(1:end)], [0; phisDP1(1:end-nf,5)], 'r')
plot([0, xesizq(1:end-5)], [0; phisDP1(1:end-nf-5,6)], 'g')
plot([0, xesizq(1:end)], [0; phisDP1(1:end-nf,7)], 'b')
%plot([0, xesizq(1:end)], [0; phisDP1(1:end-nf,8)], 'b')
xlim([0 1300])
ylim([0 0.6])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%%

datos=importdata('DP2Derv2-DP2Derv2_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
phisDP2=zeros(M,8);
for i=1:M
   phisDP2(i,1)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DP2Derv2-DP2Derv2_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP2(i,2)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DP2Derv2-DP2Derv2_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP2(i,3)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

%phisDP2(41:end,3)=phisDP2(41,3)+abs(phisDP2(41:end,3)-phisDP2(41,3))

datos=importdata('DP2Derv2-DP2Derv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP2(i,4)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('DP2Izqv2-DP2Izqv2_1_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP2(i,5)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DP2Izqv2-DP2Izqv2_2_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP2(i,6)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end


datos=importdata('DP2Izqv2-DP2Izqv2_3_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP2(i,7)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

datos=importdata('DP2Izqv2-DP2Izqv2_4_strain-xx.txt', '	', 1);
[M N] = size(datos.data);
for i=1:M
   phisDP2(i,8)=abs(mean(datos.data(i,2:end))/(150-30/2)*1000);
end

for i=1:8
   phisDP2(:,i)=smooth(phisDP2(:,i));
end

xesder=650+(0:(700-0)/(length(phisDP2)-1):700);
xesder=690+(0:10:(10*(length(xesder)-1)));
xesizq=(60:(760-60)/(length(phisDP2)-1):760);
xesizq=120+(0:10:(10*(length(xesizq)-1)));
nf = 0;
figure
%plot([xesder, 1300],[phisDP2(1:end-nf,1);0], 'r')
plot([xesder(1:end), 1300],[phisDP2(1:end-nf,2);0], 'r')
hold on
plot([xesder(1:end), 1300],[phisDP2(1:end-nf,3);0], 'g')
plot([xesder(1:end), 1300],[phisDP2(1:end-nf,4);0], 'b')

plot([0, xesizq(1:end)], [0; phisDP2(1:end-nf,5)], 'r')
%plot([0, xesizq(1:end-5)], [0; phisDP2(1:end-nf-5,6)], 'r')
plot([0, xesizq(1:end)], [0; phisDP2(1:end-nf,7)], 'g')
plot([0, xesizq(1:end)], [0; phisDP2(1:end-nf,8)/1.0], 'b')
xlim([0 1300])
ylim([0 1.0])
ylabel('Curvatura \phi=\epsilon_{x}/d  ( 1/m)')
xlabel('Posici?n (mm)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%%

figure 

plot(phisA1(:,3))

