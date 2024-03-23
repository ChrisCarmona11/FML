%Este Documento es el programa principal del proyecto de MATLAB de
%Christopher Carmona

%El objetivo de este proyecto es hacer una simulación aproximada a lo que 
%HAce un sistema de suspension de un vehiculo. Para ello se generará un
%modelo simplificado de un amortiguador y se intentará mantener a una
%elongación constante de 5 cm. Seria equivalente a la altura del vehiculo 
% respecto a la calzada. Para comprobar la robustez del sistema se
%añadira una señal de ruido que represente la rugosidad de la calzada

clear all;

global Ts pasos; 
pasos=100; % Pasos por segundo
Ts=20;
%Llamamos a la planta 
Amortiguador;

%Generamos La informacion de la señal de entrada

GeneradorDeSenalDeEntrada;

%Leemos el fichero de datos de la señal de entrada

load Datos.dat;

relieve= Datos(1,:);
tiempos= Datos(2,:);

%Esta es la señal que va a entrarle al sistema en realimentacion a modo de 
%rugosidad de la carretera
figure(1);
plot (tiempos,relieve);


% El objetivo será mantener el sistema en una elongación constante de 0.05m 
% para ello vamos a ver como reacciona el sistema a esta consigna en lazo
% cerrado:
G_discreto.InputName = 'e'; 
G_discreto.OutputName = 'y'; %Para salida y entrada
sum = sumblk('e','r','y','+-');
% sum_realimentación = sumblk('')
sistemaLazoCerrado = connect(G_discreto,sum, 'r','y');

ceros=ones(1,Ts*pasos+1)*0.05;

Yz2 = lsim(sistemaLazoCerrado,ceros,tiempos);
figure(2);
plot (tiempos,Yz2);

%La respuesta es muy oscilatoria y vemos que el coche tarda mucho en
%estabilizarse. Ahora pasaremos a la herramineta simulink e intentaremos
%controlarlo.


