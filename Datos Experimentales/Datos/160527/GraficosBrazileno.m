clear all
close all

BRSF1=importfile('BR0sinfibra.csv');
BRSF2=importfile('BR3sinfibra.csv');
BRFA1=importfile('BR4fibracero.csv');
BRFA2=importfile('BR5fibracero.csv');
BRFP1=importfile('BR1fibraplastica.csv');
BRFP2=importfile('BR2fibraplastica.csv');

BRSF1(:,4)=2*BRSF1(:,3)*10/(pi*102*65);
BRSF2(:,4)=2*BRSF2(:,3)*10/(pi*102*70);
BRFA1(:,4)=2*BRFA1(:,3)*10/(pi*102*60);
BRFA2(:,4)=2*BRFA2(:,3)*10/(pi*102*70);
BRFP1(:,4)=2*BRFP1(:,3)*10/(pi*102*75);
BRFP2(:,4)=2*BRFP2(:,3)*10/(pi*102*70);

FIBRSF1=3700;
FIBRSF2=1800;
FIBRFA1=1800;
FIBRFA2=1500;
FIBRFP1=1850;
FIBRFP2=1850;

%(P/L)(kN/m)/(2*P/(pi*D*L)(MN/m2))=D*PI/(2) mm;

figure
plot([0;(BRSF1(FIBRSF1:end,2))-5.7],[0; BRSF1(FIBRSF1:end,3)*10/1000/6.5*100/1000], 'k')
hold on
plot([0;(BRFA1(FIBRFA1:end,2))-5.55],[0; BRFA1(FIBRFA1:end,3)/100]/7*100/1000,'r')
plot([0;(BRFP1(FIBRFP1:end,2))-5.7],[0; BRFP1(FIBRFP1:end,3)/100]/6*100/1000,'b')
plot([0;(BRSF2(FIBRSF2:end,2))-5.65],[0; BRSF2(FIBRSF2:end,3)/100]/7*100/1000,'k')
plot([0;(BRFA2(FIBRFA2:end,2))-4.65],[0; BRFA2(FIBRFA2:end,3)/100]/7.5*100/1000,'r')
plot([0;(BRFP2(FIBRFP2:end,2))-5.85],[0; BRFP2(FIBRFP2:end,3)/100]/7*100/1000,'b')
legend('Sin fibras','Fibras de acero','Fibras de polipropileno', 'Location', 'northeast')
xlabel('Desplazamiento (mm)')
ylabel('Carga por unidad de largo (kN/mm)')
xlim([0 7])
set(gca, 'FontSize', 16)
set(gca,'fontname','times')  % Set it to times

ylabel(gca,'Carga por unidad de largo, q (kN/mm)');  %# Add a label to the left y axis
set(gca,'Box','off');   %# Turn off the box surrounding the whole axes
axesPosition = get(gca,'Position');          %# Get the current axes position
hNewAxes = axes('Position',axesPosition,...  %# Place a new axes on top...
                'Color','none',...           %#   ... with no background color
                'YLim',[0 1.2/(102*pi/2)*1000],...            %#   ... and a different scale
                'YAxisLocation','right',...  %#   ... located on the right
                'XTick',[],...               %#   ... with no x tick marks
                'Box','off');                %#   ... and no surrounding box
ylabel(hNewAxes,'Tensi?n de tracci?n f_t=2P/(\pi D L) (MPa)');  %# Add a label to the right y axis
set(gca, 'FontSize', 16)
set(gca,'fontname','times')  % Set it to times

%%
figure 

[ax, h] = plot2axes([0;(BRSF1(FIBRSF1:end,2))-5.7],[0; BRSF1(FIBRSF1:end,3)*10/1000/6.5*100/1000], 'ro', 'yscale',(102*pi/2)*1000); 
  title('Length vs Time'); 
  ylabel(ax(1), 'inch'); 
  ylabel(ax(2), 'millimeter'); 
  xlabel('time (sec)');

%ax=gca;
%ax2.YTick = (0:.2:1.2)/(102*pi/2)*1000;
%ax.YTickLabel= round((0:.2:1.2)/(102*pi/2)*1000,1);


