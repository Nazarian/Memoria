close all;


NodosLining=importdata('NodosLiningMatlab.txt');

for i=0:27
    datoscomp=obtenerdatos(NodosLining,i);
    str=strcat('Alpha05Noslipsec',int2str(27-i));
    dlmwrite(str,datoscomp)
end
%%

datos=datoscomp(:,4)/1000;

FDescala=5*2/max(abs(datos))/10;
quiebre1=15;
quiebre2=155;
quiebrederecho=169;

datosaplotear=zeros(quiebrederecho,2);
datosaplotear2=zeros(length(NodosLining)-quiebrederecho+2,2);

for i=1:quiebre1
    datosaplotear(i,1)=NodosLining(i,2)+sign(NodosLining(i,2))*FDescala*datos(i)*1.0;
    datosaplotear(i,2)=NodosLining(i,3);
end

for i=(quiebre1+1):quiebre2
    datosaplotear(i,1)=NodosLining(i,2)+sign(NodosLining(i,2))*FDescala*datos(i)*abs(NodosLining(i,2))/(NodosLining(i,2)*NodosLining(i,2)+NodosLining(i,3)*NodosLining(i,3))^(0.5);
    datosaplotear(i,2)=NodosLining(i,3)+1*FDescala*datos(i)*abs(NodosLining(i,3))/(NodosLining(i,2)*NodosLining(i,2)+NodosLining(i,3)*NodosLining(i,3))^(0.5);
end


for i=(quiebre2+1):quiebrederecho
    datosaplotear(i,1)=NodosLining(i,2)+sign(NodosLining(i,2))*FDescala*datos(i)*1.0;
    datosaplotear(i,2)=NodosLining(i,3);
end

FDescala2=FDescala/1;

for i=1:(length(datosaplotear2)-1)
    datosaplotear2(i,1)=NodosLining(i+169-1,2);
    datosaplotear2(i,2)=NodosLining(i+169-1,3)+FDescala2*datos(i+169-1)*(-1.0);
end

datosaplotear2(end,2)=NodosLining(1,3)+FDescala2*datos(1)*(-1.0);
datosaplotear2(end,1)=NodosLining(1,2);

datosaplotear=[datosaplotear; 5 -2];
datosaplotear2=[5 -2; datosaplotear2];

datosaplotear(:,2)=datosaplotear(:,2)-14-5;
datosaplotear2(:,2)=datosaplotear2(:,2)-14-5;


% encontrar zeros

indices1=[];
for i=1:(length(datos)-1)
    if(datos(i)>0 && datos(i+1)<0)
       indices1=[indices1 i]; 
    end
    if(datos(i)<0 && datos(i+1)>0)
       indices1=[indices1 i]; 
    end
end

for i=1:length(indices1)
   if indices1(i)> quiebrederecho
       indices1(i)=indices1(i)+1;
   end
end


figure

plot([NodosLining(:,2);NodosLining(1,2)],[NodosLining(:,3)-19;NodosLining(1,3)-19],'k')
hold on
xlabel('x (m)')
ylabel('profundidad (m)')
xlim([-8 8])
ylim([-24 -12])
set(gca, 'FontSize', 16)
set(gca,'fontname','times')  % Set it to times
plot(datosaplotear(:,1),datosaplotear(:,2),'Color',[0 0 1])
plot(datosaplotear2(:,1),datosaplotear2(:,2),'Color',[1 0 0])

%figure

colores=[1 0 0 ; 0 0 1];
indices1=[1, indices1, length(datos)+1];
i=1; 
plot(datosaplotear(1:2,1),datosaplotear(1:2,2),'Color',colores(rem(i+1,2)+1,:))
plot([NodosLining(1,2) datosaplotear(1,1)],[NodosLining(1,3)-19 datosaplotear(1,2)],'Color',colores(rem(i+1,2)+1,:))
datosaplotear2(end,2)=datosaplotear2(1,2);
datosaplotear(end-1,1)=-datosaplotear(1,1);
datosaplotear(end-2,1)=-datosaplotear(2,1);
datosaplotear(end-3,1)=-datosaplotear(3,1);
datosaplotear(end-4,1)=-datosaplotear(4,1);
datosaplotear(end-5,1)=-datosaplotear(5,1);
datosaplotear(end,1)=-datosaplotear(1,1);

for i=1:(length(indices1)-1)
    if (indices1(i)<quiebrederecho && indices1(i+1)<quiebrederecho)
        plot(datosaplotear(indices1(i)+1:(indices1(i+1)+1),1),datosaplotear(indices1(i)+1:(indices1(i+1)+1),2),'Color',colores(rem(i,2)+1,:))
        for j=indices1(i)+1:indices1(i+1)
            plot([NodosLining(j,2) datosaplotear(j,1)],[NodosLining(j,3)-19 datosaplotear(j,2)],'Color',colores(rem(i,2)+1,:))
        end
    end
    if (indices1(i)<quiebrederecho && indices1(i+1)>quiebrederecho)
      %  plot(datosaplotear(indices1(i)+1:quiebrederecho+1,1),datosaplotear(indices1(i)+1:quiebrederecho+1,2),'Color',colores(rem(i,2)+1,:))
        for j=indices1(i)+1:(quiebrederecho+1)
            plot([NodosLining(j,2) datosaplotear(j,1)],[NodosLining(j,3)-19 datosaplotear(j,2)],'Color',colores(rem(i+1,2)+1,:))
        end
       % plot(datosaplotear2(1:indices1(i+1)-quiebrederecho+1,1),datosaplotear2(1:indices1(i+1)+1-quiebrederecho,2),'Color',colores(rem(i,2)+1,:))
        for j=1:(indices1(i+1)-quiebrederecho+1)
   %         plot([NodosLining(j+quiebrederecho-2,2) datosaplotear2(j,1)],[NodosLining(j+quiebrederecho-2,3)-19 datosaplotear2(j,2)],'Color',colores(rem(i,2)+1,:))
        end
    end
    if (indices1(i)>quiebrederecho)
     %   plot(datosaplotear2(indices1(i)+1-quiebrederecho:indices1(i+1)-quiebrederecho+2,1),datosaplotear2(indices1(i)+1-quiebrederecho:indices1(i+1)-quiebrederecho+2,2),'Color',colores(rem(i,2)+1,:))
        for j=indices1(i):(indices1(i+1)-1)
       %     plot([NodosLining(j,2) datosaplotear2(j-quiebrederecho+2,1)],[NodosLining(j,3)-19 datosaplotear2(j-quiebrederecho+2,2)],'Color',colores(rem(i,2)+1,:))
        end
    end
end
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%plot([NodosLining(1,2) datosaplotear2(indices1(i+1)-quiebrederecho+1,1)],[NodosLining(1,3)-19 datosaplotear2(indices1(i+1)-quiebrederecho+1,2)],'Color',colores(rem(i,2)+1,:))
%plot([NodosLining(1,2) datosaplotear2(end,1)],[NodosLining(1,3)-19 datosaplotear2(end,2)],'Color',colores(rem(i,2)+1,:))

%plot(datosaplotear(1:2,1),datosaplotear(1:2,2),'Color',colores(rem(i,2)+1,:))
%plot([NodosLining(1,2) datosaplotear(end,1)],[NodosLining(1,3)-19 datosaplotear(1,2)],'Color',colores(rem(i,2)+1,:))

axis equal




figure 

datos=smooth(datos);
plot(linspace(-asin(2/5)*180/pi,180+asin(2/5)*180/pi,166),datos(1:166))


xlabel('\theta (Posici?n)')
ylabel('Carga (kN)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')


%%

j=3; % 1 deformacion axial, 2 curvatura, 3 carga axial, 4 momentos
inicio=15;
final=155;
legenda=[];
nodosuelocostado=load('Nodo8052disp.out');
nodosuelomedio=load('Nodo26086disp.out');
nodoliningsinferior=load('Nodo214599disp.out');
nodoliningssuperior =load('Nodo219715disp.out');
gammalejos=nodosuelocostado(:,1)/49;
gammamedio=nodosuelomedio(:,1)/49;
gammalining=(nodoliningssuperior(:,1)-nodoliningsinferior(:,1))/7;


figure(1)
plot(gammalejos*100, smooth(gammalejos./gammamedio))
hold on
plot(gammalejos1*100, smooth(gammalejos1./gammamedio1))
xlabel('\gamma_{l} (%)')
ylabel('R_{s}=\gamma_{l}/\gamma_{c}')
set(gca, 'FontSize', 20, 'FontName','Times New Roman')
legend('No-slip', 'Full-slip', 'Location', 'Northwest')
xlim([0 0.2])

figure(2)
plot(gammamedio*100, smooth(gammalining(13:end)./gammamedio))
hold on
plot(gammamedio1*100, smooth(gammalining1(13:end)./gammamedio1))
xlabel('\gamma_{c} (%)')
ylabel('R_{r}=\gamma_{r}/\gamma_{c}')
set(gca, 'FontSize', 20, 'FontName','Times New Roman')
legend('No-slip', 'Full-slip')
xlim([0 0.1])

figure(3)
plot(gammalejos*100, smooth(gammalining(13:end)./gammalejos))
hold on
plot(gammalejos1*100, smooth(gammalining1(13:end)./gammalejos1))
xlabel('\gamma_{l} (%)')
ylabel('R_{rs}=\gamma_{r}/\gamma_{l}')
set(gca, 'FontSize', 20, 'FontName','Times New Roman')
legend('No-slip', 'Full-slip')
xlim([0 0.25])

%%
Colocacionlining=[13 14 16 19 22 26];
%Colocacionlining=[-2 1 4 7];

j=3; % 1 deformacion axial, 2 curvatura, 3 carga axial, 4 momentos
figure
inicio=1;
final=260;
for i=Colocacionlining
    archivo1=strcat('Alpha05Noslip',int2str(i));
    datos1=load(archivo1);
    archivo2=strcat('Alpha05Noslipsec',int2str(i));
    datos2=load(archivo2);
    plotear=smooth(datos1(:,j)+datos2(:,j));
    plotear=smooth(plotear);
    plotear=smooth(plotear);
    plotear=smooth(plotear);
    plotear=smooth(plotear);
    plotear=smooth(plotear);
    plotear=smooth(plotear);
    plot(linspace(0,360,final-inicio+1),plotear(inicio:final)/1000')
    hold on
    xlabel('\theta (?)')
    %legenda=[legenda, strcat('\gamma=',int2str())]
    %ylabel('Momento (kN m)')
    ylabel('Carga axial (kN)')
    %ylim([-1.5 1.5]*10^-3)
end

cargasaxiales=plotear;
   legend('\gamma=0.006%','\gamma=0.012%', '\gamma=0.024%', '\gamma=0.043%', '\gamma=0.06%', '\gamma=0.09%',  'Location', 'Northeast')

set(gca, 'FontSize', 18, 'FontName','Times New Roman')


NodosLining=importdata('NodosLiningMatlab.txt');

datos=plotear;

FDescala=-5*2/max(abs(datos))/10;
quiebre1=15;
quiebre2=155;
quiebrederecho=169;

datosaplotear=zeros(quiebrederecho,2);
datosaplotear2=zeros(length(NodosLining)-quiebrederecho+2,2);

for i=1:quiebre1
    datosaplotear(i,1)=NodosLining(i,2)-sign(NodosLining(i,2))*FDescala*datos(i)*1.0;
    datosaplotear(i,2)=NodosLining(i,3);
end

for i=(quiebre1):quiebre2
    datosaplotear(i,1)=NodosLining(i,2)-sign(NodosLining(i,2))*FDescala*datos(i)*abs(NodosLining(i,2))/(NodosLining(i,2)*NodosLining(i,2)+NodosLining(i,3)*NodosLining(i,3))^(0.5);
    datosaplotear(i,2)=NodosLining(i,3)-1*FDescala*datos(i)*abs(NodosLining(i,3))/(NodosLining(i,2)*NodosLining(i,2)+NodosLining(i,3)*NodosLining(i,3))^(0.5);
end


for i=(quiebre2+1):quiebrederecho
    datosaplotear(i,1)=NodosLining(i,2)-sign(NodosLining(i,2))*FDescala*datos(i)*1.0;
    datosaplotear(i,2)=NodosLining(i,3);
end

FDescala2=FDescala/1;

for i=1:(length(datosaplotear2)-1)
    datosaplotear2(i,1)=NodosLining(i+169-1,2);
    datosaplotear2(i,2)=NodosLining(i+169-1,3)+FDescala2*datos(i+169-1)*(-1.0);
end

datosaplotear2(end,2)=NodosLining(1,3)+FDescala2*datos(1)*(-1.0);
datosaplotear2(end,1)=NodosLining(1,2);

%datosaplotear=[datosaplotear; 5 -2];
%datosaplotear2=[5 -2; datosaplotear2];

datosaplotear(:,2)=datosaplotear(:,2)-14-5;
%datosaplotear2(:,2)=datosaplotear2(:,2)-14-5;


% encontrar zeros

indices1=[];
for i=1:(length(datos)-1)
    if(datos(i)>0 && datos(i+1)<0)
       indices1=[indices1 i]; 
    end
    if(datos(i)<0 && datos(i+1)>0)
       indices1=[indices1 i]; 
    end
end

for i=1:length(indices1)
   if indices1(i)> quiebrederecho
       indices1(i)=indices1(i)+1;
   end
end


figure(3)

plot([NodosLining(:,2);NodosLining(1,2)],[NodosLining(:,3)-19;NodosLining(1,3)-19],'k')
hold on
%plot([0 -5], [-14-5 -2-14-5], 'k')
%plot([0 -5], [-14-5 0-14-5], 'k')
plot(datosaplotear(1:quiebrederecho,1),datosaplotear(1:quiebrederecho,2),'Color',[0 0 0])
plot(datosaplotear2(:,1),datosaplotear2(:,2)-19,'Color',[0 0 0])
xlabel('x (m)')
ylabel('profundidad (m)')
xlim([-8 8])
ylim([-24 -12])
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%figure

colores=[1 0 0 ; 0 0 1];
indices1=[1, indices1, length(datos)+1];
i=1; 
for asd=1:quiebrederecho
   plot([NodosLining(asd,2), datosaplotear(asd,1)], [NodosLining(asd,3)-19, datosaplotear(asd,2)], 'k') 
end

for asd=quiebrederecho+1:260
       plot([NodosLining(asd,2), datosaplotear2(asd-quiebrederecho,1)], [NodosLining(asd,3)-19, datosaplotear2(asd-quiebrederecho,2)-19], 'k') 

end
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%plot([NodosLining(1,2) datosaplotear2(indices1(i+1)-quiebrederecho+1,1)],[NodosLining(1,3)-19 datosaplotear2(indices1(i+1)-quiebrederecho+1,2)],'Color',colores(rem(i,2)+1,:))
%plot([NodosLining(1,2) datosaplotear2(end,1)],[NodosLining(1,3)-19 datosaplotear2(end,2)],'Color',colores(rem(i,2)+1,:))

%plot(datosaplotear(1:2,1),datosaplotear(1:2,2),'Color',colores(rem(i,2)+1,:))
%plot([NodosLining(1,2) datosaplotear(end,1)],[NodosLining(1,3)-19 datosaplotear(1,2)],'Color',colores(rem(i,2)+1,:))

axis equal


FDescala=5*2/max(abs(datos))/10;
quiebre1=15;
quiebre2=155;
quiebrederecho=169;

datosaplotear=zeros(quiebrederecho,2);
datosaplotear2=zeros(length(NodosLining)-quiebrederecho+2,2);

for i=1:quiebre1
    datosaplotear(i,1)=NodosLining(i,2)+sign(NodosLining(i,2))*FDescala*datos(i)*1.0;
    datosaplotear(i,2)=NodosLining(i,3);
end

for i=(quiebre1+1):quiebre2
    datosaplotear(i,1)=NodosLining(i,2)+sign(NodosLining(i,2))*FDescala*datos(i)*abs(NodosLining(i,2))/(NodosLining(i,2)*NodosLining(i,2)+NodosLining(i,3)*NodosLining(i,3))^(0.5);
    datosaplotear(i,2)=NodosLining(i,3)+1*FDescala*datos(i)*abs(NodosLining(i,3))/(NodosLining(i,2)*NodosLining(i,2)+NodosLining(i,3)*NodosLining(i,3))^(0.5);
end


for i=(quiebre2+1):quiebrederecho
    datosaplotear(i,1)=NodosLining(i,2)+sign(NodosLining(i,2))*FDescala*datos(i)*1.0;
    datosaplotear(i,2)=NodosLining(i,3);
end

FDescala2=FDescala/1;

for i=1:(length(datosaplotear2)-1)
    datosaplotear2(i,1)=NodosLining(i+169-1,2);
    datosaplotear2(i,2)=NodosLining(i+169-1,3)+FDescala2*datos(i+169-1)*(-1.0);
end

datosaplotear2(end,2)=NodosLining(1,3)+FDescala2*datos(1)*(-1.0);
datosaplotear2(end,1)=NodosLining(1,2);

datosaplotear=[datosaplotear; 5 -2];
datosaplotear2=[5 -2; datosaplotear2];

datosaplotear(:,2)=datosaplotear(:,2)-14-5;
datosaplotear2(:,2)=datosaplotear2(:,2)-14-5;


% encontrar zeros

indices1=[];
for i=1:(length(datos)-1)
    if(datos(i)>0 && datos(i+1)<0)
       indices1=[indices1 i]; 
    end
    if(datos(i)<0 && datos(i+1)>0)
       indices1=[indices1 i]; 
    end
end

for i=1:length(indices1)
   if indices1(i)> quiebrederecho
       indices1(i)=indices1(i)+1;
   end
end


figure

plot([NodosLining(:,2);NodosLining(1,2)],[NodosLining(:,3)-19;NodosLining(1,3)-19],'k')
hold on
xlabel('x (m)')
ylabel('profundidad (m)')
xlim([-8 8])
ylim([-24 -12])
set(gca, 'FontSize', 16)
set(gca,'fontname','times')  % Set it to times
plot(datosaplotear(:,1),datosaplotear(:,2),'Color',[0 0 1])
plot(datosaplotear2(:,1),datosaplotear2(:,2),'Color',[1 0 0])

%figure

colores=[1 0 0 ; 0 0 1];
indices1=[1, indices1, length(datos)+1];
i=1; 
plot(datosaplotear(1:2,1),datosaplotear(1:2,2),'Color',colores(rem(i+1,2)+1,:))
plot([NodosLining(1,2) datosaplotear(1,1)],[NodosLining(1,3)-19 datosaplotear(1,2)],'Color',colores(rem(i+1,2)+1,:))
datosaplotear2(end,2)=datosaplotear2(1,2);
datosaplotear(end-1,1)=-datosaplotear(1,1);
datosaplotear(end-2,1)=-datosaplotear(2,1);
datosaplotear(end-3,1)=-datosaplotear(3,1);
datosaplotear(end-4,1)=-datosaplotear(4,1);
datosaplotear(end-5,1)=-datosaplotear(5,1);
datosaplotear(end,1)=-datosaplotear(1,1);

for i=1:(length(indices1)-1)
    if (indices1(i)<quiebrederecho && indices1(i+1)<quiebrederecho)
        plot(datosaplotear(indices1(i)+1:(indices1(i+1)+1),1),datosaplotear(indices1(i)+1:(indices1(i+1)+1),2),'Color',colores(rem(i,2)+1,:))
        for j=indices1(i)+1:indices1(i+1)
            plot([NodosLining(j,2) datosaplotear(j,1)],[NodosLining(j,3)-19 datosaplotear(j,2)],'Color',colores(rem(i,2)+1,:))
        end
    end
    if (indices1(i)<quiebrederecho && indices1(i+1)>quiebrederecho)
      %  plot(datosaplotear(indices1(i)+1:quiebrederecho+1,1),datosaplotear(indices1(i)+1:quiebrederecho+1,2),'Color',colores(rem(i,2)+1,:))
        for j=indices1(i)+1:(quiebrederecho+1)
            plot([NodosLining(j,2) datosaplotear(j,1)],[NodosLining(j,3)-19 datosaplotear(j,2)],'Color',colores(rem(i+1,2)+1,:))
        end
       % plot(datosaplotear2(1:indices1(i+1)-quiebrederecho+1,1),datosaplotear2(1:indices1(i+1)+1-quiebrederecho,2),'Color',colores(rem(i,2)+1,:))
        for j=1:(indices1(i+1)-quiebrederecho+1)
   %         plot([NodosLining(j+quiebrederecho-2,2) datosaplotear2(j,1)],[NodosLining(j+quiebrederecho-2,3)-19 datosaplotear2(j,2)],'Color',colores(rem(i,2)+1,:))
        end
    end
    if (indices1(i)>quiebrederecho)
     %   plot(datosaplotear2(indices1(i)+1-quiebrederecho:indices1(i+1)-quiebrederecho+2,1),datosaplotear2(indices1(i)+1-quiebrederecho:indices1(i+1)-quiebrederecho+2,2),'Color',colores(rem(i,2)+1,:))
        for j=indices1(i):(indices1(i+1)-1)
       %     plot([NodosLining(j,2) datosaplotear2(j-quiebrederecho+2,1)],[NodosLining(j,3)-19 datosaplotear2(j-quiebrederecho+2,2)],'Color',colores(rem(i,2)+1,:))
        end
    end
end
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%plot([NodosLining(1,2) datosaplotear2(indices1(i+1)-quiebrederecho+1,1)],[NodosLining(1,3)-19 datosaplotear2(indices1(i+1)-quiebrederecho+1,2)],'Color',colores(rem(i,2)+1,:))
%plot([NodosLining(1,2) datosaplotear2(end,1)],[NodosLining(1,3)-19 datosaplotear2(end,2)],'Color',colores(rem(i,2)+1,:))

%plot(datosaplotear(1:2,1),datosaplotear(1:2,2),'Color',colores(rem(i,2)+1,:))
%plot([NodosLining(1,2) datosaplotear(end,1)],[NodosLining(1,3)-19 datosaplotear(1,2)],'Color',colores(rem(i,2)+1,:))

axis equal
%%
%Colocacionlining=[-2 1 4 7];
Colocacionlining=[13 14 16 19 22 26];

inicio=1;
final=260;
j=4; % 1 deformacion axial, 2 curvatura, 3 carga axial, 4 momentos
figure
for i=Colocacionlining
    archivo1=strcat('Alpha05Noslip',int2str(i));
    datos1=load(archivo1);
    archivo2=strcat('Alpha05Noslipsec',int2str(i));
    datos2=load(archivo2);
    plotear=smooth(datos1(:,j)+datos2(:,j));
    plotear=smooth(plotear);
    plotear=smooth(plotear);
    plotear=smooth(plotear);
    plotear=smooth(plotear);
    plotear=smooth(plotear);
    plotear=smooth(plotear);
    plot(linspace(0,360,final-inicio+1),plotear(inicio:final)'/1000)
    hold on
    xlabel('\theta (?)')
    %legenda=[legenda, strcat('\gamma=',int2str())]
    ylabel('Momento (kN m)')
    %ylabel('Curvatura (1/m)')
    %ylim([-1.5 2.5]/1000)
    ylim([-80 40])
end
    %legend('\alpha=0.45', '\alpha=0.25','\alpha=0.1','\alpha=0.001')
   legend('\gamma=0.006%','\gamma=0.012%', '\gamma=0.024%', '\gamma=0.043%', '\gamma=0.06%', '\gamma=0.09%',  'Location', 'Northeast')

set(gca, 'FontSize', 18, 'FontName','Times New Roman')

datosmomentos=plotear; 


NodosLining=importdata('NodosLiningMatlab.txt');

datos=plotear;

FDescala=-5*2/max(abs(datos))/4;
quiebre1=15;
quiebre2=155;
quiebrederecho=169;

datosaplotear=zeros(quiebrederecho,2);
datosaplotear2=zeros(length(NodosLining)-quiebrederecho+2,2);

for i=1:quiebre1
    datosaplotear(i,1)=NodosLining(i,2)+sign(NodosLining(i,2))*FDescala*datos(i)*1.0;
    datosaplotear(i,2)=NodosLining(i,3);
end

for i=(quiebre1):quiebre2
    datosaplotear(i,1)=NodosLining(i,2)+sign(NodosLining(i,2))*FDescala*datos(i)*abs(NodosLining(i,2))/(NodosLining(i,2)*NodosLining(i,2)+NodosLining(i,3)*NodosLining(i,3))^(0.5);
    datosaplotear(i,2)=NodosLining(i,3)+1*FDescala*datos(i)*abs(NodosLining(i,3))/(NodosLining(i,2)*NodosLining(i,2)+NodosLining(i,3)*NodosLining(i,3))^(0.5);
end


for i=(quiebre2+1):quiebrederecho
    datosaplotear(i,1)=NodosLining(i,2)+sign(NodosLining(i,2))*FDescala*datos(i)*1.0;
    datosaplotear(i,2)=NodosLining(i,3);
end

FDescala2=FDescala/1;

for i=1:(length(datosaplotear2)-1)
    datosaplotear2(i,1)=NodosLining(i+169-1,2);
    datosaplotear2(i,2)=NodosLining(i+169-1,3)+FDescala2*datos(i+169-1)*(-1.0);
end

datosaplotear2(end,2)=NodosLining(1,3)+FDescala2*datos(1)*(-1.0);
datosaplotear2(end,1)=NodosLining(1,2);

%datosaplotear=[datosaplotear; 5 -2];
%datosaplotear2=[5 -2; datosaplotear2];

datosaplotear(:,2)=datosaplotear(:,2)-14-5;
%datosaplotear2(:,2)=datosaplotear2(:,2)-14-5;


% encontrar zeros

indices1=[];
for i=1:(length(datos)-1)
    if(datos(i)>0 && datos(i+1)<0)
       indices1=[indices1 i]; 
    end
    if(datos(i)<0 && datos(i+1)>0)
       indices1=[indices1 i]; 
    end
end

for i=1:length(indices1)
   if indices1(i)> quiebrederecho
       indices1(i)=indices1(i)+1;
   end
end


figure

plot([NodosLining(:,2);NodosLining(1,2)],[NodosLining(:,3)-19;NodosLining(1,3)-19],'k')
hold on
plot(datosaplotear(1:quiebrederecho,1),datosaplotear(1:quiebrederecho,2),'Color',[0 0 0])
plot(datosaplotear2(:,1),datosaplotear2(:,2)-19,'Color',[0 0 0])

xlabel('x (m)')
ylabel('profundidad (m)')
xlim([-8 8])
ylim([-24 -12])
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%figure

colores=[1 0 0 ; 0 0 1];
indices1=[1, indices1, length(datos)+1];
i=1; 
for asd=1:quiebrederecho
   plot([NodosLining(asd,2), datosaplotear(asd,1)], [NodosLining(asd,3)-19, datosaplotear(asd,2)], 'k') 
end

for asd=quiebrederecho+1:260
       plot([NodosLining(asd,2), datosaplotear2(asd-quiebrederecho,1)], [NodosLining(asd,3)-19, datosaplotear2(asd-quiebrederecho,2)-19], 'k') 

end
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%plot([NodosLining(1,2) datosaplotear2(indices1(i+1)-quiebrederecho+1,1)],[NodosLining(1,3)-19 datosaplotear2(indices1(i+1)-quiebrederecho+1,2)],'Color',colores(rem(i,2)+1,:))
%plot([NodosLining(1,2) datosaplotear2(end,1)],[NodosLining(1,3)-19 datosaplotear2(end,2)],'Color',colores(rem(i,2)+1,:))

%plot(datosaplotear(1:2,1),datosaplotear(1:2,2),'Color',colores(rem(i,2)+1,:))
%plot([NodosLining(1,2) datosaplotear(end,1)],[NodosLining(1,3)-19 datosaplotear(1,2)],'Color',colores(rem(i,2)+1,:))

axis equal
%%
figure(123)

plot(-datosmomentos(15:155)/1000,-cargasaxiales(15:155)/1000, '*')
hold on
plot(-datosmomentos1(15:155)/1000,-cargasaxiales1(15:155)/1000, '*')
%plot(0.9*MSFP/1000000,PSFP/1000, 'g')
%plot(1*MSFP/1000000,PSFP/1000, 'k' )
%plot(-0.9*MSFN/1000000,PSFN/1000, 'g')
%plot(-1*MSFN/1000000,PSFN/1000, 'k')
PSFPComp(1)=1*PSFPComp(1);
PSFNComp(1)=1*PSFNComp(1);
MSFPComp(1)=0;
MSFNComp(1)=0;

plot(0.9*MSFPComp/1000000,PSFPComp/1000, 'g')
plot(1*MSFPComp/1000000,PSFPComp/1000, 'k' )
plot(-0.9*MSFNComp/1000000,PSFNComp/1000, 'g')
plot(-1*MSFNComp/1000000,PSFNComp/1000, 'k')

legend('No-slip (no mayorados)', 'Full-slip (no mayorados)', '\phi(M-N) total sin marco', 'M-N total sin marco', 'Location', 'Northwest')
xlabel('M (kN m)')
ylabel('P (kN)')
ylim([-200 1000])
xlim([-100 100])
%xlim([])
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

%%

%Grafico deformada

%DeformadaNOSLIP=zeros(length(NodosLining),2);
%DeformadaFULLSLIP=zeros(length(NodosLining),2);

Fescala=5;
for i=1:length(NodosLining)
   aux1=importdata(strcat('Nodo',int2str(NodosLining(i,1)),'disp.out'));
   largo=length(aux1);
   DeformadaNOSLIP(i,1)= NodosLining(i,2)+ Fescala*aux1(largo,1);
   DeformadaNOSLIP(i,2)= NodosLining(i,3)+ Fescala*aux1(largo,2);
   
   %DeformadaFullSLIP(i,1)= NodosLining(i,2)+ Fescala*aux1(largo,1);
   %DeformadaFullSLIP(i,2)= NodosLining(i,3)+ Fescala*aux1(largo,2);
end

%% DEFORMADAS DEL TUNEL
figure

DeformadaFullSLIP=(DeformadaFullSLIP-NodosLining(:,2:3))*1+NodosLining(:,2:3);
DeformadaNOSLIP=(DeformadaNOSLIP-NodosLining(:,2:3))*1.01+NodosLining(:,2:3);

plot(DeformadaNOSLIP(:,1),DeformadaNOSLIP(:,2))
hold on
plot(DeformadaFullSLIP(:,1),DeformadaFullSLIP(:,2))
legend('No-slip', 'Full-slip', 'Location', 'Northwest')
xlabel('x (m)')
ylabel('y (m)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')

