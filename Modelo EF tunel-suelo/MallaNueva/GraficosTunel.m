%NodosLining=csvread('NodosLiningMallaNueva.txt', 1,0);
%marcador=1111111; %desde derecha a izquierda por el piso
close all;

NodosLining=importdata('NodosLiningMatlab.txt');

w=0.25;
%datos=2*sin(w*(0:pi/10:(length(NodosLining)-1)*pi/10))+1;

datoscomp=obtenerdatos(NodosLining);

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
%%

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
