dtstgocentro=0.005;
dtstgomaipu=0.01;
dtstgolaflorida=0.005;
dtstgopenalolen=0.01;
dtstgopuentealto=0.01;
dtSantalucia=0.01;

processMotion('StgocentroSuelo.txt',0.005,1);
processMotion('StgocentroSuelo.txt',0.005,2);
processMotion('StgocentroSuelo.txt',0.005,3);

processMotion('StgolafloridaSuelo.txt',0.005,1);
processMotion('StgolafloridaSuelo.txt',0.005,2);
processMotion('StgolafloridaSuelo.txt',0.005,3);

processMotion('StgomaipuSuelo.txt',0.01,1);
processMotion('StgomaipuSuelo.txt',0.01,2);
processMotion('StgomaipuSuelo.txt',0.01,3);

processMotion('StgopenalolenSuelo.txt',0.01,1);
processMotion('StgopenalolenSuelo.txt',0.01,2);
processMotion('StgopenalolenSuelo.txt',0.01,3);

processMotion('StgopuentealtoSuelo.txt',0.01,1);
processMotion('StgopuentealtoSuelo.txt',0.01,2);
processMotion('StgopuentealtoSuelo.txt',0.01,3);

%%
figure

for i=1:3
   archivo=strcat('velocityHistory','StgocentroSuelo.txt',int2str(i),'.out');
   datitos=load(archivo);
   plot(datitos,'r')
   hold on
   %archivo=strcat('velocityHistory','StgomaipuSuelo.txt',int2str(i),'.out');
   %datitos=load(archivo);
   %plot(datitos,'g')
   archivo=strcat('velocityHistory','StgolafloridaSuelo.txt',int2str(i),'.out');
   datitos=load(archivo);
   plot(datitos, 'b')
   %archivo=strcat('velocityHistory','StgopuentealtoSuelo.txt',int2str(i),'.out');
   %datitos=load(archivo);
   %plot(datitos, 'c')
   %archivo=strcat('velocityHistory','StgopenalolenSuelo.txt',int2str(i),'.out');
   %datitos=load(archivo);
   %plot(datitos, 'm')
end
%%

Santalucia=importdata('SantaluciaRoca.txt'); % en g
%%
stgocentrolat=importdata('stgocentrolat.txt');
stgocentrolat=reshape(stgocentrolat',1,length(stgocentrolat)*8)/982;

stgocentrover=importdata('stgocentrover.txt');
stgocentrover=reshape(stgocentrover',1,length(stgocentrover)*8)/982;

stgocentrotra=importdata('stgocentrotra.txt');
stgocentrotra=reshape(stgocentrotra',1,length(stgocentrotra)*8)/982;

Stgocentro=zeros(length(stgocentrolat),4);

for i=1:length(Stgocentro)
   Stgocentro(i,1)=(i-1)*dtstgocentro;
   Stgocentro(i,2)=stgocentrolat(i);
   Stgocentro(i,4)=stgocentrover(i);
   Stgocentro(i,3)=stgocentrotra(i);
end

dlmwrite('StgocentroSuelo.txt',Stgocentro, '\t')

%%
stgolafloridalat=importdata('stgolafloridalat.txt');
stgolafloridalat=reshape(stgolafloridalat',1,length(stgolafloridalat)*8)/982;

stgolafloridaver=importdata('stgolafloridaver.txt');
stgolafloridaver=reshape(stgolafloridaver',1,length(stgolafloridaver)*8)/982;

stgolafloridatra=importdata('stgolafloridatra.txt');
stgolafloridatra=reshape(stgolafloridatra',1,length(stgolafloridatra)*8)/982;

Stgolaflorida=zeros(length(stgolafloridalat),4);

for i=1:length(Stgolaflorida)
   Stgolaflorida(i,1)=(i-1)*dtstgolaflorida;
   Stgolaflorida(i,3)=stgolafloridalat(i);
   Stgolaflorida(i,4)=stgolafloridaver(i);
   Stgolaflorida(i,2)=stgolafloridatra(i);
end

dlmwrite('StgolafloridaSuelo.txt',Stgolaflorida, '\t')

%% 

stgomaipulat=importdata('stgomaipulat.txt');
stgomaipulat=reshape(stgomaipulat',1,length(stgomaipulat)*8)/982;

stgomaipuver=importdata('stgomaipuver.txt');
stgomaipuver=reshape(stgomaipuver',1,length(stgomaipuver)*8)/982;

stgomaiputra=importdata('stgomaiputra.txt');
stgomaiputra=reshape(stgomaiputra',1,length(stgomaiputra)*8)/982;

Stgomaipu=zeros(length(stgomaipulat),4);

for i=1:length(Stgomaipu)
   Stgomaipu(i,1)=(i-1)*dtstgomaipu;
   Stgomaipu(i,3)=stgomaipulat(i);
   Stgomaipu(i,4)=stgomaipuver(i);
   Stgomaipu(i,2)=stgomaiputra(i);
end

dlmwrite('StgomaipuSuelo.txt',Stgomaipu, '\t')


%% 

stgopenalolenlat=importdata('stgopenalolenlat.txt');
stgopenalolenlat=reshape(stgopenalolenlat',1,length(stgopenalolenlat)*8)/982;

stgopenalolenver=importdata('stgopenalolenver.txt');
stgopenalolenver=reshape(stgopenalolenver',1,length(stgopenalolenver)*8)/982;

stgopenalolentra=importdata('stgopenalolentra.txt');
stgopenalolentra=reshape(stgopenalolentra',1,length(stgopenalolentra)*8)/982;

Stgopenalolen=zeros(length(stgopenalolenlat),4);

for i=1:length(Stgopenalolen)
   Stgopenalolen(i,1)=(i-1)*dtstgopenalolen;
   Stgopenalolen(i,3)=stgopenalolenlat(i);
   Stgopenalolen(i,4)=stgopenalolenver(i);
   Stgopenalolen(i,2)=stgopenalolentra(i);
end

dlmwrite('StgopenalolenSuelo.txt',Stgopenalolen, '\t')

dlmwrite('asd.txt',Stgopenalolen(:,2))

figure(1)

plot(stgopenalolentra,'r')
hold on
plot(stgopenalolenver,'g')
plot(stgopenalolenlat,'b')

%%


stgopuentealtolat=importdata('stgopuentealtolat.txt');
stgopuentealtolat=reshape(stgopuentealtolat',1,length(stgopuentealtolat)*8)/982;

stgopuentealtover=importdata('stgopuentealtover.txt');
stgopuentealtover=reshape(stgopuentealtover',1,length(stgopuentealtover)*8)/982;

stgopuentealtotra=importdata('stgopuentealtotra.txt');
stgopuentealtotra=reshape(stgopuentealtotra',1,length(stgopuentealtotra)*8)/982;

Stgopuentealto=zeros(length(stgopuentealtolat),4);

for i=1:length(Stgopuentealto)
   Stgopuentealto(i,1)=(i-1)*dtstgopuentealto;
   Stgopuentealto(i,3)=stgopuentealtolat(i);
   Stgopuentealto(i,4)=stgopuentealtover(i);
   Stgopuentealto(i,2)=stgopuentealtotra(i);
end

dlmwrite('StgopuentealtoSuelo.txt',Stgopuentealto, '\t')

figure(1)

plot(stgopuentealtotra,'r')
hold on
plot(stgopuentealtover,'g')
plot(stgopuentealtolat,'b')

%%

figure

plot(Stgopuentealto(:,1), Stgopuentealto(:,2), 'r')
hold on
plot(Stgopenalolen(:,1), Stgopenalolen(:,2), 'g')
plot(Stgomaipu(:,1), Stgomaipu(:,2), 'b')
plot(Stgolaflorida(:,1), Stgolaflorida(:,2), 'c')
plot(Stgocentro(:,1), Stgocentro(:,2), 'm')
%plot(Santalucia(:,1), Santalucia(:,2), 'k')
%legend('Santa Luc?a')

legend('Puente alto', 'Pe?alol?n','Maip?','La Florida','Santiago Centro', 'Location', 'northeast')
%xlim([0 150])
xlabel('Tiempo (s)')
ylabel('Aceleraci?n (g)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')
ylim([-0.405 0.405])

%figure(3)

plot(Stgopuentealto(:,1), Stgopuentealto(:,3), 'r')
%hold on
plot(Stgopenalolen(:,1), Stgopenalolen(:,3), 'g')
plot(Stgomaipu(:,1), Stgomaipu(:,3), 'b')
plot(Stgolaflorida(:,1), Stgolaflorida(:,3), 'c')
plot(Stgocentro(:,1), Stgocentro(:,3), 'm')
%plot(Santalucia(:,1), Santalucia(:,3), 'k')

%legend('Puente alto', 'Pe?alolen','Maip?','La Florida','Santiago Centro', 'Santa Luc?a', 'Location', 'northeast')
%legend('Santa Luc?a')
xlim([0 150])
ylim([-0.405 0.405])
xlabel('Tiempo (s)')
%ylabel('Aceleraci?n Sur - Norte (g)')
print('BarPlot','-epsc')
