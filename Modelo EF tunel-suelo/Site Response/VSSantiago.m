z=0:1:30; 

nu=0.25;
rho=2250; 

E=46000*z.^(0.55);
E2=65000*z.^(0.53);
Efinal=[E(1:6), E2(7:end)];

for i=1:length(Efinal)
    if (Efinal(i)<100000)
       Efinal(i)=100000; 
    end
end

Ges=Efinal/(2*(1+nu));

Vs=sqrt(Ges*1000*9.8/rho);

zpenca=[0:1:6, 6:1:18, 18:1:50];
Vspenca=[ones(1,7)*300, ones(1,13)*650, ones(1,33)*850];

plot([Vs Vs(end)],-[z 50], 'r');
hold on
plot(Vspenca, -zpenca, 'g')
xlim([0 1000])
legend('Modelo usado Vs^2=(G/\rho)', sprintf( '%s\n%s', 'Ejemplo de modelo usado', 'en la pr?ctica (Arcadis)' ), 'Location', 'southwest')

xlabel('Velocidad de onda de corte V_s (m/s)')
ylabel('Profundidad z (m)')
set(gca, 'FontSize', 18, 'FontName','Times New Roman')