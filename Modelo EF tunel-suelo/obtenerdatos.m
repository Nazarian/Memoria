function datos = obtenerdatos(NodosLining,ene)
largo=length(NodosLining);
datos=zeros(largo,4); % eps kappa P M

for i=1:largo
   aux1=importdata(strcat('Elemento',int2str(NodosLining(i,1)+2000000),'deformations.out'));
   aux2=importdata(strcat('Elemento',int2str(NodosLining(i,1)+2000000),'force.out'));
   largo2=length(aux1)-ene;
   datos(i,1)=aux1(largo2,1);
   datos(i,2)=aux1(largo2,2);
   datos(i,3)=aux2(largo2,1);
   datos(i,4)=aux2(largo2,2);
   
end

%datos=1;

end