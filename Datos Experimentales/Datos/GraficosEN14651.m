close all
clear all

Wes=[0.05 0.1 0.2 0.5 1.5 2.5 3.5 4.0];
Xes=[0.08 0.13 0.21 0.47 1.32 2.17 3.02 3.44];

b=(0.05-0.0)/(0.13-0.08);
a=0.05-b*0.08;

figure
plot(Xes,Wes)

xes=0:0.5:3.5;
wes=xes*b+a;
grid on
grid minor


% Cargar datos
EA1=csvread('EA1.csv'); % 1 mal y todos corridos
EA2=csvread('EA2.csv'); % del 2 al 7 mal
EP1=csvread('EP1.csv'); 
EP2=csvread('EP2.csv'); 

% Correcciones
EA1(:,1)=EA1(:,1)-0.00;
EA2(:,1)=EA2(:,1)+0.015;
EP1(:,1)=EP1(:,1)+0.02;
EP2(:,1)=EP2(:,1)+0.014;
%EA1(1,:)=[0 0];

for i=1:3
   EA1(:,2)=smooth(EA1(:,2)); 
   EA2(:,2)=smooth(EA2(:,2));
   EP1(:,2)=smooth(EP1(:,2)); 
   EP2(:,2)=smooth(EP2(:,2)); 
end

EA1=[[0, EA1(5:end,1)']', [0, EA1(5:end,2)']'];
EA2=[[0, EA2(11:end,1)']', [0, EA2(11:end,2)']'];

EP1=[[0, EP1(2:end-11,1)']', [0, EP1(2:end-11,2)']'];
EP2=[[0, EP2(11:end,1)']', [0, EP2(11:end,2)']'];


x=0.0:0.01:3.4;
beta=6;
%c=0.1;
y=19*exp(-beta*x.^(1));

figure

plot(EA1(:,1),EA1(:,2), 'b')
hold on
plot(EP1(:,1),EP1(:,2), 'r')
%xlim([-0.1 0.2])
plot(0.1+x,y,'k')
plot(EA2(:,1),EA2(:,2), 'b')
plot(EP2(:,1),EP2(:,2), 'r')


xlabel('Desplazamiento vertical \delta (mm)')
ylabel('Carga transversal P (kN)')

legend('Fibras de acero', 'Fibras pl?sticas', 'Respuesta simulada sin fibras')

ax = gca;
%ax.XTick = [-3*pi -2*pi -pi 0 pi 2*pi 3*pi];
ax.YTick = [0 5 10 15 20];

set(gca, 'FontSize', 16)
set(gca,'fontname','times')  % Set it to times

%axes(top_handle)
%xlabel('Top label')

ax1=gca;

ax2 = axes('Position', get(ax1, 'Position'),'Color', 'none');

set(ax2, 'XAxisLocation', 'top','YAxisLocation','Right');
% set the same Limits and Ticks on ax2 as on ax1;
set(ax2, 'XLim', get(ax1, 'XLim'),'YLim', get(ax1, 'YLim'));
set(ax2, 'XTick', get(ax1, 'XTick'), 'YTick', get(ax1, 'YTick'));

OppTickLabels = {'0' '0.53' '1.12' '1.71' '2.3' '2.89' '3.48' '4.1'};

asdasd=0:2:20;
asdasd=asdasd*0.5/4;
OppTickLabels2 = {'0' '0.625' '1.25' '1.875' '2.5'};


set(ax2, 'XTickLabel', OppTickLabels,'FontSize', 18, 'fontname','times','YTickLabel',OppTickLabels2);

xlabel('Abertura de grieta \omega (mm)','FontSize', 18, 'fontname','times')  % Set it to times

ylabel('Momento M (kN m)','FontSize', 18, 'fontname','times')  % Set it to times



