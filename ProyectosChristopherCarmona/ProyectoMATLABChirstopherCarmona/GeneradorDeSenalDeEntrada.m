
%Este scrip genera una señal aleatoria la cual será la señal de entrada que
%recibirá la planta del sistema.
global Ts pasos;
relieve = rand([1,Ts*pasos+1]);
for i= 1:length(relieve)
    if relieve(i)>0.025
        relieve(i)=relieve(i)*0.05; 
    elseif relieve(i)<0.01
        relieve(i)=relieve(i)*5; 
    end
%De esta manera conseguimos que los valores no sean muy picudos
end
tiempos=0:1/pasos:Ts;

save Datos.dat relieve tiempos -ascii

%los quitamos del spacio de trabajo para acceder a ellos mediante la
%lectura del .dat
clear relieve;
clear tiempos;