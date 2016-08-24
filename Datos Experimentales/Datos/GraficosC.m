close all

% Cargar todos los datos

CP1=importdata('cp11.txt','	',1); %6 cols
CP1=CP1.data;
CP2=importdata('cp21.txt','	',1); %6 cols
CP2=CP2.data;
CA1=importdata('ca11.txt','	',1); %6 cols
CA1=CA1.data;
CA2=importdata('ca21.txt','	',1); %6 cols
CA2=CA2.data;
CA22=importdata('ca22.txt','	',1); %6 cols
CA22=CA22.data;

for j=1:1
for i=1:6
    %CA1(:,i)=smooth(CA1(:,i));
    %CA2(:,i)=smooth(CA2(:,i));
    %CA22(:,i)=smooth(CA22(:,i));
    %CP2(:,i)=smooth(CP2(:,i));
    %CP1(:,i)=smooth(CP1(:,i));
end
end

%plot(A1(:,5))

figure
plot(CP2(:,1))
hold on
plot(CP2(:,2))
plot(CP2(:,3))
plot(CP2(:,4))
plot(CP2(:,5))
plot(CP2(:,6))
xlabel('Tiempo (20 Hz de frecuencia de muestreo)')
ylabel('Voltaje (V)')
legend('Celda de carga vertical', 'LVDT1', 'LVDT2', 'LVDT3', 'LVDT4','Celda de carga axial', 'Location', 'northwest')
set(gca,'fontname','times')  % Set it to times

ylim([-2 6])
set(gca, 'FontSize', 20)
set(gca,'fontname','times')  % Set it to times



% Inicio de cada ensayo; 


FinicioCA1=2500;
FinicioCA22=7400;
FinicioCA2=11200;
FinicioCP1=3800;
FinicioCP2=3400;


% Final de cada lvdt para cada ensayo

FfinalCA1L1=7900;
FfinalCA1L2=7900;
FfinalCA1L3=7900;
FfinalCA1L4=7900;

FfinalCA2L1=14350;
FfinalCA2L2=14350;
FfinalCA2L3=14350;
FfinalCA2L4=14350;

FfinalCA22L1=10500;
FfinalCA22L2=10500;
FfinalCA22L3=10500;
FfinalCA22L4=10500;

FfinalCP1L1=8500;
FfinalCP1L2=8500;
FfinalCP1L3=8500;
FfinalCP1L4=8500;

FfinalCP2L1=8200;
FfinalCP2L2=8200;
FfinalCP2L3=8200;
FfinalCP2L4=8200;

% Transformar a kN o mm seg?n sea el caso. 

%Volt1=mean(A2(FinicioA2:FfinalA2L1,7));
%Volt2=mean(A1(FinicioA1:FfinalA1L1,7));

A=265.62;
B=60;

FCCCL1=60/0.3; % kN/V
FCCCL2=1; % kN
FCLVDT1=1*25.4/5*1; % mm/V
FCLVDT2=1*25.4/5; %mm/V
FCLVDT3=1*25.4/5; %mm/V
FCLVDT4=25.4/5; %mm/V
FCCCA1=A; % kN/V
FCCCA2=B; % kN

%FCSU1= 10*5.4358;% mm/V
%FCSU2= 10*2.8461; % mm

CA1(:,1)=FCCCL1*CA1(:,1)+FCCCL2;
CA1(:,2)=(CA1(:,2)-CA1(FinicioCA1,2))*FCLVDT1;
CA1(:,3)=(CA1(:,3)-CA1(FinicioCA1,3))*FCLVDT2;
CA1(:,4)=(CA1(:,4)-CA1(FinicioCA1,4))*FCLVDT3;
CA1(:,5)=(CA1(:,5)-CA1(FinicioCA1,5))*FCLVDT4;
CA1(:,6)=FCCCA1*CA1(:,6)+FCCCA2;

CA2(:,1)=FCCCL1*CA2(:,1)+FCCCL2;
CA2(:,2)=(CA2(:,2)-CA2(FinicioCA1,2))*FCLVDT1;
CA2(:,3)=(CA2(:,3)-CA2(FinicioCA1,3))*FCLVDT2;
CA2(:,4)=(CA2(:,4)-CA2(FinicioCA1,4))*FCLVDT3;
CA2(:,5)=(CA2(:,5)-CA2(FinicioCA1,5))*FCLVDT4;
CA2(:,6)=FCCCA1*CA2(:,6)+FCCCA2;

CA22(:,1)=FCCCL1*CA22(:,1)+FCCCL2;
CA22(:,2)=(CA22(:,2)-CA22(FinicioCA1,2))*FCLVDT1;
CA22(:,3)=(CA22(:,3)-CA22(FinicioCA1,3))*FCLVDT2;
CA22(:,4)=(CA22(:,4)-CA22(FinicioCA1,4))*FCLVDT3;
CA22(:,5)=(CA22(:,5)-CA22(FinicioCA1,5))*FCLVDT4;
CA22(:,6)=FCCCA1*CA22(:,6)+FCCCA2;

CP1(:,1)=FCCCL1*CP1(:,1)+FCCCL2;
CP1(:,2)=(CP1(:,2)-CP1(FinicioCP1,2))*FCLVDT1;
CP1(:,3)=(CP1(:,3)-CP1(FinicioCP1,3))*FCLVDT2;
CP1(:,4)=(CP1(:,4)-CP1(FinicioCP1,4))*FCLVDT3;
CP1(:,5)=(CP1(:,5)-CP1(FinicioCP1,5))*FCLVDT4;
CP1(:,6)=FCCCA1*CP1(:,6)+FCCCA2;

CP2(:,1)=FCCCL1*CP2(:,1)+FCCCL2;
CP2(:,2)=(CP2(:,2)-CP2(FinicioCA1,2))*FCLVDT1;
CP2(:,3)=(CP2(:,3)-CP2(FinicioCA1,3))*FCLVDT2;
CP2(:,4)=(CP2(:,4)-CP2(FinicioCA1,4))*FCLVDT3;
CP2(:,5)=(CP2(:,5)-CP2(FinicioCA1,5))*FCLVDT4;
CP2(:,6)=FCCCA1*CP2(:,6)+FCCCA2;

% Gr?ficos


figure
plot(CA1(FinicioCA1:FfinalCA1L1,1)/10)
hold on
plot(CA1(FinicioCA1:FfinalCA1L1,2))
plot(CA1(FinicioCA1:FfinalCA1L2,3))
plot(CA1(FinicioCA1:FfinalCA1L3,4))
plot(CA1(FinicioCA1:FfinalCA1L4,5))
plot(CA1(FinicioCA1:FfinalCA1L1,6)/10)
xlabel('Tiempo (20 Hz de frecuencia de muestreo)')
ylabel('Desplazamiento (mm) o Carga (Ton)')
legend('Celda de carga vertical', 'LVDT1', 'LVDT2', 'LVDT3', 'LVDT4', 'Celda de carga axial', 'Location', 'northwest')
set(gca,'fontname','times')  % Set it to times

%ylim([-2 6])
set(gca, 'FontSize', 16)


figure
plot(CA2(FinicioCA2:FfinalCA2L1,1)/10)
hold on
plot(CA2(FinicioCA2:FfinalCA2L1,2))
plot(CA2(FinicioCA2:FfinalCA2L2,3))
plot(CA2(FinicioCA2:FfinalCA2L3,4))
plot(CA2(FinicioCA2:FfinalCA2L4,5))
plot(CA2(FinicioCA2:FfinalCA2L1,6)/10)
xlabel('Tiempo (20 Hz de frecuencia de muestreo)')
ylabel('Desplazamiento (mm) o Carga (Ton)')
legend('Celda de carga vertical', 'LVDT1', 'LVDT2', 'LVDT3', 'LVDT4', 'Celda de carga axial', 'Location', 'northwest')
set(gca,'fontname','times')  % Set it to times

%ylim([-2 6])
set(gca, 'FontSize', 16)


figure
plot(CA22(FinicioCA22:FfinalCA22L1,1)/10)
hold on
plot(CA22(FinicioCA22:FfinalCA22L1,2))
plot(CA22(FinicioCA22:FfinalCA22L2,3))
plot(CA22(FinicioCA22:FfinalCA22L3,4))
plot(CA22(FinicioCA22:FfinalCA22L4,5))
plot(CA22(FinicioCA22:FfinalCA22L1,6)/10)
xlabel('Tiempo (20 Hz de frecuencia de muestreo)')
ylabel('Desplazamiento (mm) o Carga (Ton)')
legend('Celda de carga vertical', 'LVDT1', 'LVDT2', 'LVDT3', 'LVDT4', 'Celda de carga axial', 'Location', 'northwest')
set(gca,'fontname','times')  % Set it to times

%ylim([-2 6])
set(gca, 'FontSize', 16)



figure
plot(CP1(FinicioCP1:FfinalCP1L1,1)/10)
hold on
plot(CP1(FinicioCP1:FfinalCP1L1,2))
plot(CP1(FinicioCP1:FfinalCP1L2,3))
plot(CP1(FinicioCP1:FfinalCP1L3,4))
plot(CP1(FinicioCP1:FfinalCP1L4,5))
plot(CP1(FinicioCP1:FfinalCP1L1,6)/10)
xlabel('Tiempo (20 Hz de frecuencia de muestreo)')
ylabel('Desplazamiento (mm) o Carga (Ton)')
legend('Celda de carga vertical', 'LVDT1', 'LVDT2', 'LVDT3', 'LVDT4', 'Celda de carga axial', 'Location', 'northwest')
set(gca,'fontname','times')  % Set it to times

%ylim([-2 6])
set(gca, 'FontSize', 16)


figure
plot(CP2(FinicioCP2:FfinalCP2L1,1)/10)
hold on
plot(CP2(FinicioCP2:FfinalCP2L1,2))
plot(CP2(FinicioCP2:FfinalCP2L2,3))
plot(CP2(FinicioCP2:FfinalCP2L3,4))
plot(CP2(FinicioCP2:FfinalCP2L4,5))
plot(CP2(FinicioCP2:FfinalCP2L1,6)/10)
xlabel('Tiempo (20 Hz de frecuencia de muestreo)')
ylabel('Desplazamiento (mm) o Carga (Ton)')
legend('Celda de carga vertical', 'LVDT1', 'LVDT2', 'LVDT3', 'LVDT4', 'Celda de carga axial', 'Location', 'northwest')
set(gca,'fontname','times')  % Set it to times

%ylim([-2 6])
set(gca, 'FontSize', 16)


%%

figure 
plot([0; CA1(FinicioCA1:FfinalCA1L1,2)+0.2-1*(CA1(FinicioCA1:FfinalCA1L1,4)+CA1(FinicioCA1:FfinalCA1L1,5))/2] ,[0; CA1(FinicioCA1:FfinalCA1L1,1)])
hold on
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
plot([0; CA1(FinicioCA1:FfinalCA1L2,3)+0.2-1*(CA1(FinicioCA1:FfinalCA1L2,4)+CA1(FinicioCA1:FfinalCA1L2,5))/2] ,[0; CA1(FinicioCA1:FfinalCA1L2,1)])
legend('LVDT 1','LVDT 2', 'LVDT 4', 'Location', 'southeast' )
set(gca, 'FontSize', 16, 'FontName','Times New Roman')
%ylabel(gca,'Carga por unidad de largo, q (kN/mm)');  %# Add a label to the left y axis
set(gca,'Box','off');   %# Turn off the box surrounding the whole axes
axesPosition = get(gca,'Position');          %# Get the current axes position
hNewAxes = axes('Position',axesPosition,...  %# Place a new axes on top...
                'Color','none',...           %#   ... with no background color
                'YLim',[0 300*0.42/4],...            %#   ... and a different scale
                'YAxisLocation','right',...  %#   ... located on the right
                'XTick',[],...               %#   ... with no x tick marks
                'Box','off');                %#   ... and no surrounding box
ylabel(hNewAxes,'Momento M=PL/4 (kN m)');  %# Add a label to the right y axis
set(gca, 'FontSize', 16)
set(gca, 'FontSize', 16, 'FontName','Times New Roman')

figure 
plot([0; CA2(FinicioCA2:FfinalCA2L1,2)+0.6-0.5-1*(CA2(FinicioCA2:FfinalCA2L1,4)+CA2(FinicioCA2:FfinalCA2L1,5))/2] ,[0; CA2(FinicioCA2:FfinalCA2L1,1)])
hold on
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
plot([0; CA2(FinicioCA2:FfinalCA2L2,3)+0.6-0.5-1*(CA2(FinicioCA2:FfinalCA2L2,4)+CA2(FinicioCA2:FfinalCA2L2,5))/2] ,[0; CA2(FinicioCA2:FfinalCA2L2,1)])
plot([ CA22(FinicioCA22+100:FfinalCA22L1,2)+0.6-0.3-0*(CA22(FinicioCA22+100:FfinalCA22L1,4)+CA22(FinicioCA22+100:FfinalCA22L1,5))/2] ,[CA22(FinicioCA22+100:FfinalCA22L1,1)], 'Color',[0, 0.4470, 0.7410] )
plot([ CA22(FinicioCA22:FfinalCA22L2,3)+0.6-0.1-1*(CA22(FinicioCA22:FfinalCA22L2,4)+CA22(FinicioCA22:FfinalCA22L2,5))/2] ,[ CA22(FinicioCA22:FfinalCA22L2,1)], 'Color', [0.8500, 0.3250, 0.0980])

legend('LVDT 1','LVDT 2', 'Location', 'southeast' )
set(gca, 'FontSize', 16, 'FontName','Times New Roman')
ylabel(gca,'Carga por unidad de largo, q (kN/mm)');  %# Add a label to the left y axis
set(gca,'Box','off');   %# Turn off the box surrounding the whole axes
axesPosition = get(gca,'Position');          %# Get the current axes position
%hNewAxes = axes('Position',axesPosition,...  %# Place a new axes on top...
 %              'Color','none',...           %#   ... with no background color
  %              'YLim',[0 300*0.5/4],...            %#   ... and a different scale
   %             'YAxisLocation','right',...  %#   ... located on the right
    %            'XTick',[],...               %#   ... with no x tick marks
     %           'Box','off');                %#   ... and no surrounding box
%ylabel(hNewAxes,'Momento M=PL/4 (kN m)');  %# Add a label to the right y axis
set(gca, 'FontSize', 16)
set(gca, 'FontSize', 16, 'FontName','Times New Roman')


figure 
plot([0; CP1(FinicioCP1:FfinalCP1L1,2)+0.6-1*(CP1(FinicioCP1:FfinalCP1L1,4)+CP1(FinicioCP1:FfinalCP1L1,5))/2] ,[0; CP1(FinicioCP1:FfinalCP1L1,1)])
hold on
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
plot([0; CP1(FinicioCP1:FfinalCP1L2,3)+0.6-0.0-1*(CP1(FinicioCP1:FfinalCP1L2,4)+CP1(FinicioCP1:FfinalCP1L2,5))/2] ,[0; CP1(FinicioCP1:FfinalCP1L2,1)])
legend('LVDT 1','LVDT 2', 'LVDT 4', 'Location', 'southeast' )
set(gca, 'FontSize', 16, 'FontName','Times New Roman')
%ylabel(gca,'Carga por unidad de largo, q (kN/mm)');  %# Add a label to the left y axis
set(gca,'Box','off');   %# Turn off the box surrounding the whole axes
%axesPosition = get(gca,'Position');          %# Get the current axes position
%hNewAxes = axes('Position',axesPosition,...  %# Place a new axes on top...
   %             'Color','none',...           %#   ... with no background color
 %               'YLim',[0 300*0.42/4],...            %#   ... and a different scale
  %              'YAxisLocation','right',...  %#   ... located on the right
    %            'XTick',[],...               %#   ... with no x tick marks
     %           'Box','off');                %#   ... and no surrounding box
%ylabel(hNewAxes,'Momento M=PL/4 (kN m)');  %# Add a label to the right y axis
set(gca, 'FontSize', 16)
set(gca, 'FontSize', 16, 'FontName','Times New Roman')


figure 
plot([0; CP2(FinicioCP2:FfinalCP2L1,2)+0.6-1.0+0*(CP2(FinicioCP2:FfinalCP2L1,4)+CP2(FinicioCP2:FfinalCP2L1,5))/2] ,[0; CP2(FinicioCP2:FfinalCP2L1,1)])
hold on
xlabel('Desplazamiento (mm)')
ylabel('Carga vertical (kN)')
plot([0; CP2(FinicioCP2:FfinalCP2L2,3)+0.6-2.2+1.0-0*(CP2(FinicioCP2:FfinalCP2L2,4)+CP2(FinicioCP2:FfinalCP2L2,5))/2] ,[0; CP2(FinicioCP2:FfinalCP2L2,1)])
legend('LVDT 1','LVDT 2', 'LVDT 4', 'Location', 'southeast' )
set(gca, 'FontSize', 16, 'FontName','Times New Roman')
%ylabel(gca,'Carga por unidad de largo, q (kN/mm)');  %# Add a label to the left y axis
set(gca,'Box','off');   %# Turn off the box surrounding the whole axes
%axesPosition = get(gca,'Position');          %# Get the current axes position
%hNewAxes = axes('Position',axesPosition,...  %# Place a new axes on top...
     %           'Color','none',...           %#   ... with no background color
    %            'YLim',[0 300*0.5/4],...            %#   ... and a different scale
   %             'YAxisLocation','right',...  %#   ... located on the right
  %              'XTick',[],...               %#   ... with no x tick marks
 %               'Box','off');                %#   ... and no surrounding box
%ylabel(hNewAxes,'Momento M=PL/4 (kN m)');  %# Add a label to the right y axis
set(gca, 'FontSize', 16)
set(gca, 'FontSize', 16, 'FontName','Times New Roman')

%%
t = 1/20:1/20:length(CP2(FinicioCP2:FfinalCP2L2,6))/20;
t2 = 1/20:1/20:length(CP1(FinicioCP1:FfinalCP1L2,6))/20;
t3 = 1/20:1/20:length(CA2(FinicioCA2:FfinalCA2L2,6))/20;
t4 = 1/20:1/20:length(CA1(FinicioCA1:FfinalCA1L2,6))/20;

figure
plot(t, CP2(FinicioCP2:FfinalCP2L2,6))
hold on
plot(t3, CA2(FinicioCA2:FfinalCA2L2,6))
ylabel('Carga axial (kN)')
xlabel('Tiempo (s)')
ylim([190 210])
set(gca, 'FontSize', 16, 'FontName','Times New Roman')
legend('CP2', 'CA2')
%export_fig Cargaaxial41.pdf
%print('Cargaaxial41','-depsc')



figure
plot(t2, CP1(FinicioCP1:FfinalCP1L2,6))
hold on
plot(t4, CA1(FinicioCA1:FfinalCA1L2,6))
ylabel('Carga axial (kN)')
xlabel('Tiempo (s)')
legend('CP1', 'CA1')
ylim([50 120])

set(gca, 'FontSize', 16, 'FontName','Times New Roman')
%set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3])
