function processMotion(stringe, DTusado,jas)
% reshapes ground motion and creates velocity time history for analysis

% load NGA database file
rawMotion = load(stringe);
rawMotion = rawMotion(:,jas+1); 
%[m,n] = size(rawMotion);
%nStep = m*n;

% reshape into a column vector
%a = zeros(nStep,1);
%k = 1;
%for i = 1:m
%    for j = 1:n
%        a(k,1) = rawMotion(i,j);
%        k = k + 1;
%    end
%end

% time step specified for ground motion
dT = DTusado;

% change units to m/s^2
aMod = rawMotion*9.81;

% integrate to obtain velocity time history
v = cumtrapz(aMod);
v = dT*v;

asdasd=strcat('velocityHistory',stringe, int2str(jas),'.out');
save -ascii velocityHistory.out v
save(asdasd,'v','-ascii')

return
