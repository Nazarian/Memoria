%clear all
phi=importdata('sectiondisp10.pos.out');
phisp1=[];
Msp1=[];
phisp1=[phisp1 ,phi(:,2)];
M=importdata('sectionreac10.pos.out');
Msp1=[Msp1, M(:,2)];

phi=importdata('sectiondisp1-350000.pos.out');
M=importdata('sectionreac1-350000.pos.out');
phisp1=[phisp1 ,phi(:,2)];
Msp1=[Msp1, M(:,2)];

phi=importdata('sectiondisp1-1000000.pos.out');
M=importdata('sectionreac1-1000000.pos.out');
phisp1=[phisp1 ,phi(:,2)];
Msp1=[Msp1, M(:,2)];


phi=importdata('sectiondisp1-1800000.pos.out');
M=importdata('sectionreac1-1800000.pos.out');
phisp1=[phisp1 ,phi(:,2)];
Msp1=[Msp1, M(:,2)];

phi=importdata('sectiondisp10.neg.out');
phisn1=[];
Msn1=[];
phisn1=[phisn1 ,phi(:,2)];
M=importdata('sectionreac10.neg.out');
Msn1=[Msn1, M(:,2)];

phi=importdata('sectiondisp1-350000.neg.out');
M=importdata('sectionreac1-350000.neg.out');
phisn1=[phisn1 ,phi(:,2)];
Msn1=[Msn1, M(:,2)];

phi=importdata('sectiondisp1-1000000.neg.out');
M=importdata('sectionreac1-1000000.neg.out');
phisn1=[phisn1 ,phi(:,2)];
Msn1=[Msn1, M(:,2)];


phi=importdata('sectiondisp1-1800000.neg.out');
M=importdata('sectionreac1-1800000.neg.out');
phisn1=[phisn1 ,phi(:,2)];
Msn1=[Msn1, M(:,2)];


phi=importdata('sectiondisp20.pos.out');
phisp2=[];
Msp2=[];
phisp2=[phisp2 ,phi(:,2)];
M=importdata('sectionreac20.pos.out');
Msp2=[Msp2, M(:,2)];

phi=importdata('sectiondisp2-350000.pos.out');
M=importdata('sectionreac2-350000.pos.out');
phisp2=[phisp2 ,phi(:,2)];
Msp2=[Msp2, M(:,2)];

phi=importdata('sectiondisp2-1000000.pos.out');
M=importdata('sectionreac2-1000000.pos.out');
phisp2=[phisp2 ,[phi(:,2); phi(end,2)*ones(length(phisp2)-length(phi),1)]];
Msp2=[Msp2, [M(:,2); M(end,2)*ones(length(phisp2)-length(phi),1)]];


phi=importdata('sectiondisp2-1800000.pos.out');
M=importdata('sectionreac2-1800000.pos.out');
phisp2=[phisp2 ,[phi(:,2); phi(end,2)*ones(length(phisp2)-length(phi),1)]];
Msp2=[Msp2, [M(:,2); M(end,2)*ones(length(phisp2)-length(phi),1)]];

phi=importdata('sectiondisp20.neg.out');
phisn2=[];
Msn2=[];
phisn2=[phisn2 ,phi(:,2)];
M=importdata('sectionreac20.neg.out');
Msn2=[Msn2, M(:,2)];

phi=importdata('sectiondisp2-350000.neg.out');
M=importdata('sectionreac2-350000.neg.out');
phisn2=[phisn2 ,phi(:,2)];
Msn2=[Msn2, M(:,2)];

phi=importdata('sectiondisp2-1000000.neg.out');
M=importdata('sectionreac2-1000000.neg.out');
phisn2=[phisn2 ,[phi(:,2); phi(end,2)*ones(length(phisn2)-length(phi),1)]];
Msn2=[Msn2, [M(:,2); M(end,2)*ones(length(phisn2)-length(phi),1)]];

phi=importdata('sectiondisp2-1800000.neg.out');
M=importdata('sectionreac2-1800000.neg.out');
phisn2=[phisn2 ,[phi(:,2); phi(end,2)*ones(length(phisn2)-length(phi),1)]];
Msn2=[Msn2, [M(:,2); M(end,2)*ones(length(phisn2)-length(phi),1)]];

phi=importdata('sectiondisp30.pos.out');
phisp3=[];
Msp3=[];
phisp3=[phisp3 ,phi(:,2)];
M=importdata('sectionreac30.pos.out');
Msp3=[Msp3, M(:,2)];

phi=importdata('sectiondisp3-350000.pos.out');
M=importdata('sectionreac3-350000.pos.out');
phisp3=[phisp3 ,phi(:,2)];
Msp3=[Msp3, M(:,2)];

phi=importdata('sectiondisp3-1000000.pos.out');
M=importdata('sectionreac3-1000000.pos.out');
phisp3=[phisp3 ,[phi(:,2); phi(end,2)*ones(length(phisp3)-length(phi),1)]];
Msp3=[Msp3, [M(:,2); M(end,2)*ones(length(phisp3)-length(phi),1)]];


phi=importdata('sectiondisp3-1800000.pos.out');
M=importdata('sectionreac3-1800000.pos.out');
phisp3=[phisp3 ,[phi(:,2); phi(end,2)*ones(length(phisp3)-length(phi),1)]];
Msp3=[Msp3, [M(:,2); M(end,2)*ones(length(phisp3)-length(phi),1)]];


phi=importdata('sectiondisp30.neg.out');
phisn3=[];
Msn3=[];
phisn3=[phisn3 ,phi(:,2)];
M=importdata('sectionreac30.neg.out');
Msn3=[Msn3, M(:,2)];

phi=importdata('sectiondisp3-350000.neg.out');
M=importdata('sectionreac3-350000.neg.out');
phisn3=[phisn3 ,phi(:,2)];
Msn3=[Msn3, M(:,2)];

phi=importdata('sectiondisp3-1000000.neg.out');
M=importdata('sectionreac3-1000000.neg.out');
phisn3=[phisn3 ,phi(:,2)];
Msn3=[Msn3, M(:,2)];


phi=importdata('sectiondisp3-1800000.neg.out');
M=importdata('sectionreac3-1800000.neg.out');
phisn3=[phisn3 ,phi(:,2)];
Msn3=[Msn3, M(:,2)];


%%
figure(1)
plot(phisn1(1:end-39,1),Msn1(1:end-39,1)/1000000, 'r')
hold on
plot(phisn1(:,2)-phisn1(1,2),Msn1(:,2)/1000000, 'g')
plot(phisn1(:,3)-phisn1(1,3),Msn1(:,3)/1000000, 'b')
plot(phisn1(:,4)-phisn1(1,4),Msn1(:,4)/1000000, 'c')

%plot(phisn2(1:end-46,1),Msn2(1:end-46,1)/1000000, '--r')
%plot(-phisp2(:,2),-Msp2(:,2)/1000000, '--g')
%plot(-phisp2(:,3),-Msp2(:,3)/1000000, '--b')
%plot(-phisp2(:,4),-Msp2(:,4)/1000000, '--c')

%plot(phisn3(1:end-47,1),Msn3(1:end-47,1)/1000000, '-.r')
%plot(-phisp3(:,2),-Msp3(:,2)/1000000, '-.g')
%plot(-phisp3(:,3),-Msp3(:,3)/1000000, '-.b')
%plot(-phisp3(:,4),-Msp3(:,4)/1000000, '-.c')

plot(phisp1(:,1),-Msp1(:,1)/1000000, 'r')
plot(phisp1(:,2)-phisp1(1,2),-Msp1(:,2)/1000000, 'g')
plot(phisp1(:,3)-phisp1(1,3),-Msp1(:,3)/1000000, 'b')
plot(phisp1(:,4)-phisp1(1,4),-Msp1(:,4)/1000000, 'c')

%plot(phisp2(1:end-3,1),-Msp2(1:end-3,1)/1000000, '--r')
%plot(phisp2(:,2),-Msp2(:,2)/1000000, '--g')
%plot(phisp2(:,3),-Msp2(:,3)/1000000, '--b')
%plot(phisp2(1:end-37,4),-Msp2(1:end-37,4)/1000000, '--c')

%plot(phisp3(1:end-3,1),-Msp3(1:end-3,1)/1000000, '-.r')
%plot(phisp3(:,2),-Msp3(:,2)/1000000, '-.g')
%plot(phisp3(:,3),-Msp3(:,3)/1000000, '-.b')
%plot(phisp3(:,4),-Msp3(:,4)/1000000, '-.c')


xlim([-0.0006, 0.000601])
legend('SF - 0 kN', 'SF - 350 kN (2.34 MPa)', 'SF - 1000 kN (6.7 MPa)', 'SF - 1800 kN (12 MPa)', 'FA - 0 kN', 'FA - 350 kN (2.34 MPa)', 'FA - 1000 kN (6.7 MPa)', 'FA - 1800 kN (12 MPa)', 'FP - 0 kN', 'FP - 350 kN (2.34 MPa)', 'FP - 1000 kN (6.7 MPa)', 'FP - 1800 kN (12 MPa)', 'Location', 'northeastoutside')
%ylim([0 220])
xlim([-0.1 0.1]/1000)
set(gca, 'FontSize', 20, 'FontName','Times New Roman')
xlabel('Curvatura \phi (1/mm)')
ylabel('Momento M (kN m)')

%%
PesSF=[3*150*1000, linspace(0,-55*150*1000,16),-9000000];
PesFA=[3.2*150*1000, linspace(0,-60*150*1000,16),-9800000];
PesFP=[2.8*150*1000, linspace(0,-62*150*1000,16),-10000000];

ArregloSFOS=zeros(1,2*length(PesSF));
ArregloSFOS(1:2:end)=1:1:length(PesSF);
ArregloSFOS(2:2:end)=PesSF;

ArregloFAOS=zeros(1,2*length(PesFA));
ArregloFAOS(1:2:end)=1:1:length(PesFA);
ArregloFAOS(2:2:end)=PesFA;

ArregloFPOS=zeros(1,2*length(PesFP));
ArregloFPOS(1:2:end)=1:1:length(PesFP);
ArregloFPOS(2:2:end)=PesFP;


%PesSF=[450000 0 -550000 -1100000 -1650000 -2200000 -2750000 -3300000 -3850000 -4400000 -4950000 -5500000 -6050000 -6600000 -7150000 -7700000 -8250000];
%PesFA=[480000 0 -600000 -1200000 -1800000 -2400000 -3000000 -3600000 -4200000 -4800000 -5400000 -6000000 -6600000 -7200000 -7800000 -8400000 -9000000];
%PesFP=[420000 0 -620000 -1240000 -1860000 -2480000 -3100000 -3720000 -4340000 -4960000 -5580000 -6200000 -6820000 -7440000 -8060000 -8680000 -9300000];

As22=22*22*pi/4;
As28=28*28*pi/4;
Asmalla=7.5*7.5*pi/4;

Fu1=680;
Fu2=720;

PesSF(1)=0.5*PesSF(1)+2*As22*Fu1+As28*Fu1+6*Asmalla*Fu2;
PesFA(1)=1*PesFA(1)+2*As22*Fu1+As28*Fu1;
PesFP(1)=1*PesFP(1)+2*As22*Fu1+As28*Fu1;

%PesSF(end)=PesSF(end)-2*As22*Fu1-As28*Fu1-6*Asmalla*Fu2;
%PesFA(end)=PesFA(end)-2*As22*Fu1-As28*Fu1;
%PesFP(end)=PesFP(end)-2*As22*Fu1-As28*Fu1;

MSFP=[-0];
MSFN=[0];
PSFP=[-300000];
PSFN=[-300000];

MFAP=[-0];
MFAN=[0];
PFAP=[-300000];
PFAN=[-300000];

MFPP=[-0];
MFPN=[0];
PFPP=[-300000];
PFPN=[-300000];

for i=2:(length(PesSF)-1)
    archivo1=strcat('sectiondisp1', int2str(PesSF(i)),'.pos.out');
    archivo2=strcat('sectionreac1', int2str(PesSF(i)),'.pos.out');
    archivo3=strcat('sectiondisp1', int2str(PesSF(i)),'.neg.out');
    archivo4=strcat('sectionreac1', int2str(PesSF(i)),'.neg.out');
    Mpos=importdata(archivo2);
    Mneg=importdata(archivo4);
    Mpos=Mpos(:,2);
    Mneg=Mneg(:,2);
    MSFP=[MSFP, max(-Mpos)];
    MSFN=[MSFN, max(Mneg)];
    PSFP=[PSFP, -PesSF(i)];
    PSFN=[PSFN, -PesSF(i)];
end

for i=2:(length(PesFA)-1)
    archivo1=strcat('sectiondisp2', int2str(PesFA(i)),'.pos.out');
    archivo2=strcat('sectionreac2', int2str(PesFA(i)),'.pos.out');
    archivo3=strcat('sectiondisp2', int2str(PesFA(i)),'.neg.out');
    archivo4=strcat('sectionreac2', int2str(PesFA(i)),'.neg.out');
    Mpos=importdata(archivo2);
    Mneg=importdata(archivo4);
    Mpos=Mpos(:,2);
    Mneg=Mneg(:,2);
    MFAP=[MFAP, max(-Mpos)];
    MFAN=[MFAN, max(Mneg)];
    PFAP=[PFAP, -PesFA(i)];
    PFAN=[PFAN, -PesFA(i)];
end


for i=2:(length(PesFP)-2)
    archivo1=strcat('sectiondisp3', int2str(PesFP(i)),'.pos.out');
    archivo2=strcat('sectionreac3', int2str(PesFP(i)),'.pos.out');
    archivo3=strcat('sectiondisp3', int2str(PesFP(i)),'.neg.out');
    archivo4=strcat('sectionreac3', int2str(PesFP(i)),'.neg.out');
    Mpos=importdata(archivo2);
    Mneg=importdata(archivo4);
    Mpos=Mpos(:,2);
    Mneg=Mneg(:,2);
    MFPP=[MFPP, max(-Mpos)];
    MFPN=[MFPN, max(Mneg)];
    PFPP=[PFPP, -PesFP(i)];
    PFPN=[PFPN, -PesFP(i)];
end

%PSFP=[PSFP, -PesSF(end)];
%PSFN=[PSFN, -PesSF(end)];
%MSFP=[MSFP,0];
%MSFN=[-MSFN,0];


%PFAP=[PFAP, -PesFA(end)];
%PFAN=[PFAN, -PesFA(end)];
%MFAP=[MFAP,0];
%MFAN=[-MFAN,0];

%PFPP=[PFPP, -PesFP(end)];
%PFPN=[PFPN, -PesFP(end)];
%MFPP=[MFPP,0];
%MFPN=[-MFPN,0];



PSFmax=-8350000;
MSFatmax=-5000000;

PFAmax=-9000000;
MFAatmax=0;

PFPmax=-9300000;
MFPatmax=0;

MSFP=[MSFP, MSFatmax];
PSFP=[PSFP, -PSFmax];
PSFN=[PSFN, -PSFmax];
MSFN=[MSFN, -MSFatmax];

MFAP=[MFAP, MFAatmax];
PFAP=[PFAP, -PFAmax];
PFAN=[PFAN, -PFAmax];
MFAN=[MFAN, -MFAatmax];

MFPP=[MFPP, MFPatmax];
PFPP=[PFPP, -PFPmax];
PFPN=[PFPN, -PFPmax];
MFPN=[MFPN, -MFPatmax];

figure(2)
plot(MSFP/1000000,PSFP/1000, 'r')
hold on
plot([MFAP(1:end-3)/1000000 MFAP(end)/1000000 ],[PFAP(1:end-3)/1000 PFAP(end)/1000], 'g')
plot(MFPP/1000000,PFPP/1000, 'b')
plot(-MSFN/1000000,PSFN/1000, 'r')
plot(-[MFAN(1:end-3)/1000000 MFAN(end)/1000000 ],[PFAN(1:end-3)/1000 PFAN(end)/1000], 'g')
plot(-MFPN/1000000,PFPN/1000, 'b')
legend('SF+Malla', 'FA', 'FP', 'Location', 'northeast')
xlabel('Momento M (kN m)')
ylabel('Carga axial P (kN)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')
%grid minor
ylim([-40 140])

%%

PesSFComp=[3*150*1000*2, linspace(0,-2*55*150*1000,16)];
PesFAComp=[3.2*150*1000+3*150*1000, linspace(0,-60*150*1000-55*150*1000,16)];
PesFPComp=[2.8*150*1000+3*150*1000, linspace(0,-62*150*1000-55*150*1000,16)];

ArregloSFOS=zeros(1,2*length(PesSFComp));
ArregloSFOS(1:2:end)=1:1:length(PesSFComp);
ArregloSFOS(2:2:end)=PesSFComp;

ArregloFAOS=zeros(1,2*length(PesFAComp));
ArregloFAOS(1:2:end)=1:1:length(PesFAComp);
ArregloFAOS(2:2:end)=PesFAComp;

ArregloFPOS=zeros(1,2*length(PesFPComp));
ArregloFPOS(1:2:end)=1:1:length(PesFPComp);
ArregloFPOS(2:2:end)=PesFPComp;

phi=importdata('sectiondisp10.tot.pos.out');
phisp1=[];
Msp1=[];
phisp1=[phisp1 ,phi(:,2)];
M=importdata('sectionreac10.tot.pos.out');
Msp1=[Msp1, M(:,2)];

phi=importdata('sectiondisp1-700000.tot.pos.out');
M=importdata('sectionreac1-700000.tot.pos.out');
phisp1=[phisp1 ,phi(:,2)];
Msp1=[Msp1, M(:,2)];

phi=importdata('DiagphiMTotalSM/sectiondisp1-2000000.tot.pos.out');
M=importdata('DiagphiMTotalSM/sectionreac1-2000000.tot.pos.out');
phisp1=[phisp1 ,phi(:,2)];
Msp1=[Msp1, M(:,2)];

phi=importdata('sectiondisp1-3600000.tot.pos.out');
M=importdata('sectionreac1-3600000.tot.pos.out');
phisp1=[phisp1 ,phi(:,2)];
Msp1=[Msp1, M(:,2)];

phi=importdata('sectiondisp10.tot.neg.out');
phisn1=[];
Msn1=[];
phisn1=[phisn1 ,phi(:,2)];
M=importdata('sectionreac10.tot.neg.out');
Msn1=[Msn1, M(:,2)];

phi=importdata('sectiondisp1-700000.tot.neg.out');
M=importdata('sectionreac1-700000.tot.neg.out');
phisn1=[phisn1 ,phi(:,2)];
Msn1=[Msn1, M(:,2)];

phi=importdata('sectiondisp1-2000000.tot.neg.out');
M=importdata('sectionreac1-2000000.tot.neg.out');
phisn1=[phisn1 ,phi(:,2)];
Msn1=[Msn1, M(:,2)];


phi=importdata('sectiondisp1-3600000.tot.neg.out');
M=importdata('sectionreac1-3600000.tot.neg.out');
phisn1=[phisn1 ,phi(:,2)];
Msn1=[Msn1, M(:,2)];


phi=importdata('sectiondisp20.tot.pos.out');
phisp2=[];
Msp2=[];
phisp2=[phisp2 ,phi(:,2)];
M=importdata('sectionreac20.tot.pos.out');
Msp2=[Msp2, M(:,2)];

phi=importdata('sectiondisp2-700000.tot.pos.out');
M=importdata('sectionreac2-700000.tot.pos.out');
phisp2=[phisp2 ,phi(:,2)];
Msp2=[Msp2, M(:,2)];

phi=importdata('sectiondisp2-2000000.tot.pos.out');
M=importdata('sectionreac2-2000000.tot.pos.out');
phisp2=[phisp2 ,phi(:,2)];
Msp2=[Msp2, M(:,2)];


phi=importdata('sectiondisp2-3600000.tot.pos.out');
M=importdata('sectionreac2-3600000.tot.pos.out');
phisp2=[phisp2 ,phi(:,2)];
Msp2=[Msp2, M(:,2)];

phi=importdata('sectiondisp20.tot.neg.out');
phisn2=[];
Msn2=[];
phisn2=[phisn2 ,phi(:,2)];
M=importdata('sectionreac20.tot.neg.out');
Msn2=[Msn2, M(:,2)];

phi=importdata('sectiondisp2-700000.tot.neg.out');
M=importdata('sectionreac2-700000.tot.neg.out');
phisn2=[phisn2 ,phi(:,2)];
Msn2=[Msn2, M(:,2)];

phi=importdata('sectiondisp2-2000000.tot.neg.out');
M=importdata('sectionreac2-2000000.tot.neg.out');
phisn2=[phisn2 ,phi(:,2)];
Msn2=[Msn2, M(:,2)];


phi=importdata('sectiondisp2-3600000.tot.neg.out');
M=importdata('sectionreac2-3600000.tot.neg.out');
phisn2=[phisn2 ,phi(:,2)];
Msn2=[Msn2, M(:,2)];

phi=importdata('sectiondisp30.tot.pos.out');
phisp3=[];
Msp3=[];
phisp3=[phisp3 ,phi(:,2)];
M=importdata('sectionreac30.tot.pos.out');
Msp3=[Msp3, M(:,2)];

phi=importdata('sectiondisp3-700000.tot.pos.out');
M=importdata('sectionreac3-700000.tot.pos.out');
phisp3=[phisp3 ,phi(:,2)];
Msp3=[Msp3, M(:,2)];

phi=importdata('sectiondisp3-2000000.tot.pos.out');
M=importdata('sectionreac3-2000000.tot.pos.out');
phisp3=[phisp3 ,phi(:,2)];
Msp3=[Msp3, M(:,2)];


phi=importdata('sectiondisp3-3600000.tot.pos.out');
M=importdata('sectionreac3-3600000.tot.pos.out');
phisp3=[phisp3 ,phi(:,2)];
Msp3=[Msp3, M(:,2)];

phi=importdata('sectiondisp30.tot.neg.out');
phisn3=[];
Msn3=[];
phisn3=[phisn3 ,phi(:,2)];
M=importdata('sectionreac30.tot.neg.out');
Msn3=[Msn3, M(:,2)];

phi=importdata('sectiondisp3-700000.tot.neg.out');
M=importdata('sectionreac3-700000.tot.neg.out');
phisn3=[phisn3 ,phi(:,2)];
Msn3=[Msn3, M(:,2)];

phi=importdata('sectiondisp3-2000000.tot.neg.out');
M=importdata('sectionreac3-2000000.tot.neg.out');
phisn3=[phisn3 ,phi(:,2)];
Msn3=[Msn3, M(:,2)];


phi=importdata('sectiondisp3-3600000.tot.neg.out');
M=importdata('sectionreac3-3600000.tot.neg.out');
phisn3=[phisn3 ,phi(:,2)];
Msn3=[Msn3, M(:,2)];



figure(3)
plot(phisn1(:,1),Msn1(:,1)/1000000, 'r')
hold on
plot(phisn1(:,2),Msn1(:,2)/1000000, 'g')
plot(phisn1(:,3),Msn1(:,3)/1000000, 'b')
plot(phisn1(:,4),Msn1(:,4)/1000000, 'c')

plot(phisn2(:,1),Msn2(:,1)/1000000, '--r')
plot(phisn2(:,2),Msn2(:,2)/1000000, '--g')
plot(phisn2(:,3),Msn2(:,3)/1000000, '--b')
plot(phisn2(:,4),Msn2(:,4)/1000000, '--c')

plot(phisn3(:,1),Msn3(:,1)/1000000, '-.r')
plot(phisn3(:,2),Msn3(:,2)/1000000, '-.g')
plot(phisn3(:,3),Msn3(:,3)/1000000, '-.b')
plot(phisn3(:,4),Msn3(:,4)/1000000, '-.c')

plot(phisp1(:,1),-Msp1(:,1)/1000000, 'r')
plot(phisp1(:,2),-Msp1(:,2)/1000000, 'g')
plot(phisp1(:,3),-Msp1(:,3)/1000000, 'b')
plot(phisp1(:,4),-Msp1(:,4)/1000000, 'c')

plot(phisp2(:,1),-Msp2(:,1)/1000000, '--r')
plot(phisp2(:,2),-Msp2(:,2)/1000000, '--g')
plot(phisp2(:,3),-Msp2(:,3)/1000000, '--b')
plot(phisp2(:,4),-Msp2(:,4)/1000000, '--c')

plot(phisp3(:,1),-Msp3(:,1)/1000000, '-.r')
plot(phisp3(:,2),-Msp3(:,2)/1000000, '-.g')
plot(phisp3(:,3),-Msp3(:,3)/1000000, '-.b')
plot(phisp3(:,4),-Msp3(:,4)/1000000, '-.c')


xlim([-0.0006, 0.001])
legend('SF - 0 kN', 'SF - 700 kN (2.34 MPa)', 'SF - 2000 kN (6.7 MPa)', 'SF - 3600 kN (12 MPa)', 'FA - 0 kN', 'FA - 700 kN (2.34 MPa)', 'FA - 2000 kN (6.7 MPa)', 'FA - 3600 kN (12 MPa)', 'FP - 0 kN', 'FP - 700 kN (2.34 MPa)', 'FP - 2000 kN (6.7 MPa)', 'FP - 3600 kN (12 MPa)', 'Location', 'northeastoutside')
ylim([0 400])
set(gca, 'FontSize', 20, 'FontName','Times New Roman')
xlabel('Curvatura \phi (1/mm)')
ylabel('Momento M (kN m)')


    
As22=22*22*pi/4;
As28=28*28*pi/4;
Asmalla=7.5*7.5*pi/4;

Fu1=680;
Fu2=720;

PesSFComp(1)=0.8*PesSFComp(1)+2*As22*Fu1+As28*Fu1+6*Asmalla*Fu2+6*Asmalla*Fu2;
PesFAComp(1)=1*PesFAComp(1)+2*As22*Fu1+As28*Fu1+6*Asmalla*Fu2;
PesFPComp(1)=1*PesFPComp(1)+2*As22*Fu1+As28*Fu1+6*Asmalla*Fu2;

%PesSF(end)=PesSF(end)-2*As22*Fu1-As28*Fu1-6*Asmalla*Fu2-6*Asmalla*Fu2;
%PesFA(end)=PesFA(end)-2*As22*Fu1-As28*Fu1-6*Asmalla*Fu2;
%PesFP(end)=PesFP(end)-2*As22*Fu1-As28*Fu1-6*Asmalla*Fu2;

MSFPComp=[-50000000];
MSFNComp=[50000000];
PSFPComp=[-PesSFComp(1)];
PSFNComp=[-PesSFComp(1)];

MFAPComp=[-50000000];
MFANComp=[50000000];
PFAPComp=[-PesFAComp(1)];
PFANComp=[-PesFAComp(1)];

MFPPComp=[-50000000];
MFPNComp=[50000000];
PFPPComp=[-PesFPComp(1)];
PFPNComp=[-PesFPComp(1)];

for i=2:(length(PesSF)-1)
    archivo1=strcat('sectiondisp1', int2str(PesSFComp(i)),'.tot.pos.out');
    archivo2=strcat('sectionreac1', int2str(PesSFComp(i)),'.tot.pos.out');
    archivo3=strcat('sectiondisp1', int2str(PesSFComp(i)),'.tot.neg.out');
    archivo4=strcat('sectionreac1', int2str(PesSFComp(i)),'.tot.neg.out');
    Mpos=importdata(archivo2);
    Mneg=importdata(archivo4);
    Mpos=Mpos(:,2);
    Mneg=Mneg(:,2);
    MSFPComp=[MSFPComp, max(-Mpos)];
    MSFNComp=[MSFNComp, max(Mneg)];
    PSFPComp=[PSFPComp, -PesSFComp(i)];
    PSFNComp=[PSFNComp, -PesSFComp(i)];
end

for i=2:(length(PesFA)-1)
    archivo1=strcat('sectiondisp2', int2str(PesFAComp(i)),'.tot.pos.out');
    archivo2=strcat('sectionreac2', int2str(PesFAComp(i)),'.tot.pos.out');
    archivo3=strcat('sectiondisp2', int2str(PesFAComp(i)),'.tot.neg.out');
    archivo4=strcat('sectionreac2', int2str(PesFAComp(i)),'.tot.neg.out');
    Mpos=importdata(archivo2);
    Mneg=importdata(archivo4);
    Mpos=Mpos(:,2);
    Mneg=Mneg(:,2);
    MFAPComp=[MFAPComp, max(-Mpos)];
    MFANComp=[MFANComp, max(Mneg)];
    PFAPComp=[PFAPComp, -PesFAComp(i)];
    PFANComp=[PFANComp, -PesFAComp(i)];
end


for i=2:(length(PesFP)-1)
    archivo1=strcat('sectiondisp3', int2str(PesFPComp(i)),'.tot.pos.out');
    archivo2=strcat('sectionreac3', int2str(PesFPComp(i)),'.tot.pos.out');
    archivo3=strcat('sectiondisp3', int2str(PesFPComp(i)),'.tot.neg.out');
    archivo4=strcat('sectionreac3', int2str(PesFPComp(i)),'.tot.neg.out');
    Mpos=importdata(archivo2);
    Mneg=importdata(archivo4);
    Mpos=Mpos(:,2);
    Mneg=Mneg(:,2);
    MFPPComp=[MFPPComp, max(-Mpos)];
    MFPNComp=[MFPNComp, max(Mneg)];
    PFPPComp=[PFPPComp, -PesFPComp(i)];
    PFPNComp=[PFPNComp, -PesFPComp(i)];
end

PSFmaxComp=-17400000;
MSFatmaxComp=46000000;

PFAmaxComp=-17700000;
MFAatmaxComp=52000000;

PFPmaxComp=-18000000;
MFPatmaxComp=52000000;

MSFPComp=[MSFPComp, MSFatmaxComp];
PSFPComp=[PSFPComp, -PSFmaxComp];
PSFNComp=[PSFNComp, -PSFmaxComp];
MSFNComp=[MSFNComp, -MSFatmaxComp];

MFAPComp=[MFAPComp, MFAatmaxComp];
PFAPComp=[PFAPComp, -PFAmaxComp];
PFANComp=[PFANComp, -PFAmaxComp];
MFANComp=[MFANComp, -MFAatmaxComp];

MFPPComp=[MFPPComp, MFPatmaxComp];
PFPPComp=[PFPPComp, -PFPmaxComp];
PFPNComp=[PFPNComp, -PFPmaxComp];
MFPNComp=[MFPNComp, -MFPatmaxComp];

figure(4)
%plot(MSFPComp/1000000,PSFPComp/1000, 'r')
plot([MSFPComp(1:end-3)/1000000 MSFPComp(end)/1000000 ],[PSFPComp(1:end-3)/1000 PSFPComp(end)/1000], 'r')
hold on
plot([MFAPComp(1:end-3)/1000000 MFAPComp(end)/1000000 ],[PFAPComp(1:end-3)/1000 PFAPComp(end)/1000], 'g')
plot(MFPPComp/1000000,PFPPComp/1000, 'b')
%plot(-MSFNComp/1000000,PSFNComp/1000, 'r')
plot(-[MSFNComp(1:end-3)/1000000 MSFNComp(end)/1000000 ],[PSFNComp(1:end-3)/1000 PSFNComp(end)/1000], 'r')
plot(-[MFANComp(1:end-3)/1000000 MFANComp(end)/1000000 ],[PFANComp(1:end-3)/1000 PFANComp(end)/1000], 'g')
plot(-[MFPNComp(1:end-3)/1000000 MFPNComp(end)/1000000 ],[PFPNComp(1:end-3)/1000 PFPNComp(end)/1000], 'b')
%plot(-MFPNComp/1000000,PFPNComp/1000, 'b')
legend('SF+Malla', 'FA', 'FP', 'Location', 'northeast')

xlabel('Momento M (kN m)')
ylabel('Carga axial P (kN)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')
grid minor




figure(5)
%plot(MSFPComp/1000000,PSFPComp/1000, 'r')
plot([MSFPComp(1:end-3)/1000000 MSFPComp(end)/1000000 ],[PSFPComp(1:end-3)/1000 PSFPComp(end)/1000], 'r')
hold on
plot([MFAPComp(1:end-3)/1000000 MFAPComp(end)/1000000 ],[PFAPComp(1:end-3)/1000 PFAPComp(end)/1000], 'g')
plot(MFPPComp/1000000,PFPPComp/1000, 'b')
plot(MSFP/1000000,PSFP/1000, '--r')
plot([MFAP(1:end-3)/1000000 MFAP(end)/1000000 ],[PFAP(1:end-3)/1000 PFAP(end)/1000], '--g')
plot(MFPP/1000000,PFPP/1000, '--b')
%plot(-MSFNComp/1000000,PSFNComp/1000, 'r')
plot(-[MSFNComp(1:end-3)/1000000 MSFNComp(end)/1000000 ],[PSFNComp(1:end-3)/1000 PSFNComp(end)/1000], 'r')
plot(-[MFANComp(1:end-3)/1000000 MFANComp(end)/1000000 ],[PFANComp(1:end-3)/1000 PFANComp(end)/1000], 'g')
plot(-[MFPNComp(1:end-3)/1000000 MFPNComp(end)/1000000 ],[PFPNComp(1:end-3)/1000 PFPNComp(end)/1000], 'b')
%plot(-MFPNComp/1000000,PFPNComp/1000, 'b')

plot(-MSFN/1000000,PSFN/1000, '--r')
plot(-[MFAN(1:end-3)/1000000 MFAN(end)/1000000 ],[PFAN(1:end-3)/1000 PFAN(end)/1000], '--g')
plot(-MFPN/1000000,PFPN/1000, '--b')
%legend('SF+Malla', 'FA', 'FP', 'Location', 'northeast')
legend(sprintf( '%s\n%s', 'Sostenimiento SF con ', 'Malla + revestimiento' ), sprintf( '%s\n%s', 'Sostenimiento FA ', '+ revestimiento' ) , sprintf( '%s\n%s', 'Sostenimiento FP', '+ revestimiento' ), sprintf( '%s\n%s', 'Sostenimiento SF ', 'con Malla' ),'Sostenimiento FA', 'Sostenimiento FP',  'Location', 'northeastoutside')
xlabel('Momento M (kN m)')
ylabel('Carga axial P (kN)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')
ylim([-3000 20000])


%%

PesSF=[3*150*1000, linspace(0,-55*150*1000,16)];
PesFA=[3.2*150*1000, linspace(0,-60*150*1000,16)];
PesFP=[2.8*150*1000, linspace(0,-62*150*1000,16)];

MSFP(6)=175948000;
MSFP(7)=188104000;
MSFN=[1 -50000000 2 -145616000 3 -165571000 4 -181207000 5 -193059000 6 -199419000 7 -200478000 8 -199601000 9 -195696000 10 -187717000 11 -174841000 12 -156500000 13 -132181000 14 -102730000 15 -94028800 16 -37859300 17 0];
MSFN=[-MSFN(2:2:end), -45000000];

ArregloSFOS2=zeros(1,2*length(MSFP));
ArregloSFOS2(1:2:end)=1:1:length(MSFP);
ArregloSFOS2(2:2:end)=MSFP;

ArregloSFOS3=zeros(1,2*length(MSFN));
ArregloSFOS3(1:2:end)=1:1:length(MSFN);
ArregloSFOS3(2:2:end)=MSFN;

ArregloFAOS2=zeros(1,2*length(MFAP));
ArregloFAOS2(1:2:end)=1:1:length(MFAP);
ArregloFAOS2(2:2:end)=MFAP;

ArregloFAOS3=zeros(1,2*length(MFAN));
ArregloFAOS3(1:2:end)=1:1:length(MFAN);
ArregloFAOS3(2:2:end)=MFAN;

ArregloFPOS2=zeros(1,2*length(MFPP));
ArregloFPOS2(1:2:end)=1:1:length(MFPP);
ArregloFPOS2(2:2:end)=MFPP;

ArregloFPOS3=zeros(1,2*length(MFPN));
ArregloFPOS3(1:2:end)=1:1:length(MFPN);
ArregloFPOS3(2:2:end)=MFPN;

Porcentajes = [0.25 0.5 0.75 0.85 0.87 0.90 0.92 0.95 0.98];

%MSFPComp=zeros(5,0);
%MSFNComp=zeros(5,0);
%PSFPComp=zeros(5,0);
%PSFNComp=zeros(5,0);

i=1;    
    MSFPComp2(1,1)=[0];
    MSFNComp2(1,1)=[0];
    PSFPComp2(1,1)=[-PesSF(1)*2];
    PSFNComp2(1,1)=[-PesSF(1)*2];

    for j=2:(length(PesSF)-1)
        for l=2:(length(PesSF)-1)
            archivo1=strcat('sectiondisp.1.', int2str(Porcentajes(i)*PesSF(j)),'.',int2str(2*PesSF(l)),'.',int2str(Porcentajes(i)*ArregloSFOS2(2*j)),'.tot.pos.out');
            archivo2=strcat('sectionreac.1.', int2str(Porcentajes(i)*PesSF(j)),'.',int2str(2*PesSF(l)),'.',int2str(Porcentajes(i)*ArregloSFOS2(2*j)),'.tot.pos.out');
            archivo3=strcat('sectiondisp.1.', int2str(Porcentajes(i)*PesSF(j)),'.',int2str(2*PesSF(l)),'.',int2str(Porcentajes(i)*ArregloSFOS3(2*j)),'.tot.neg.out');
            archivo4=strcat('sectionreac.1.', int2str(Porcentajes(i)*PesSF(j)),'.',int2str(2*PesSF(l)),'.',int2str(-Porcentajes(i)*ArregloSFOS3(2*j)),'.tot.neg.out');
            Mpos=importdata(archivo2);
            Mneg=importdata(archivo4);
            Mpos=Mpos(:,2);
            Mneg=Mneg(:,2);
            MSFPComp2(j,l)= max(-Mpos);
            MSFNComp2(j,l)= max(Mneg);
            PSFPComp2(j,l)= -PesSF(l)*2;
            PSFNComp2(j,l)= -PesSF(l)*2;
        end
    end


%%
figure(9)

j=12;
Pinicial=-Porcentajes(i)*PesSF(j);
Minicial=Porcentajes(i)*ArregloSFOS2(2*j);
Minicial=-Porcentajes(i)*ArregloSFOS3(2*j);

figure(9)
plot([MSFPComp(1:end-3)/1000000 MSFPComp(end)/1000000 ],[PSFPComp(1:end-3)/1000 PSFPComp(end)/1000], 'r')
hold on
plot([MFAPComp(1:end-3)/1000000 MFAPComp(end)/1000000 ],[PFAPComp(1:end-3)/1000 PFAPComp(end)/1000], 'g')
plot(MFPPComp/1000000,PFPPComp/1000, 'b')
plot([MSFP(1:end-3)/1000000, MSFP(end)/1000000],[PSFP(1:end-3)/1000, PSFP(end)/1000], '--r')
plot([MFAP(1:end-3)/1000000 MFAP(end)/1000000 ],[PFAP(1:end-3)/1000 PFAP(end)/1000], '--g')
plot(MFPP/1000000,PFPP/1000, '--b')
%plot(-MSFNComp/1000000,PSFNComp/1000, 'r')
plot(-[MSFNComp(1:end-3)/1000000 MSFNComp(end)/1000000 ],[PSFNComp(1:end-3)/1000 PSFNComp(end)/1000], 'r')
plot(-[MFANComp(1:end-3)/1000000 MFANComp(end)/1000000 ],[PFANComp(1:end-3)/1000 PFANComp(end)/1000], 'g')
plot(-[MFPNComp(1:end-3)/1000000 MFPNComp(end)/1000000 ],[PFPNComp(1:end-3)/1000 PFPNComp(end)/1000], 'b')
%plot(-MFPNComp/1000000,PFPNComp/1000, 'b')

plot([-MSFN(1:end-4)/1000000, -MSFN(end)/1000000],[PSFN(1:end-4)/1000, PSFN(end)/1000], '--r')
%plot(-MSFN(1:end-3)/1000000,PSFN(1:end-3)/1000, '--r')
plot(-[MFAN(1:end-4)/1000000 MFAN(end)/1000000 ],[PFAN(1:end-4)/1000 PFAN(end)/1000], '--g')
plot(-MFPN/1000000,PFPN/1000, '--b')

plot([Minicial, 45000000]/1000000,[Pinicial, 17400000]/1000, 'Color',[ 0.662745 0.662745 0.662745]) 
plot([Minicial, -50000000]/1000000,[Pinicial, -1995000]/1000, 'Color',[ 0.662745 0.662745 0.662745]) 

for enes=2:length(MSFPComp2(j,:))
   plot([Minicial, MSFPComp2(j,enes)]/1000000,[Pinicial, PSFPComp2(j,enes)]/1000, 'Color',[ 0.762745 0.762745 0.762745]) 
   plot([Minicial, -MSFNComp2(j,enes)]/1000000,[Pinicial, PSFPComp2(j,enes)]/1000, 'Color',[ 0.762745 0.762745 0.762745]) 
end
%plot(MSFPComp2(asd,:)/1000000,PSFPComp2(asd,:)/1000, 'g*')
%plot(-MSFNComp2(asd,:)/1000000,PSFPComp2(asd,:)/1000, 'b*')
%legend(sprintf( '%s\n%s', 'Sostenimiento SF con ', 'Malla + revestimiento' ), sprintf( '%s\n%s', 'Sostenimiento FA ', '+ revestimiento' ) , sprintf( '%s\n%s', 'Sostenimiento FP', '+ revestimiento' ), sprintf( '%s\n%s', 'Sostenimiento SF ', 'con Malla' ),'Sostenimiento FA', 'Sostenimiento FP',  'Location', 'northeastoutside')
xlabel('Momento M (kN m)')
ylabel('Carga axial P (kN)')
set(gca, 'FontSize', 16, 'FontName','Times New Roman')
%ylim([-2000 1000])
%xlim([-250 200])
