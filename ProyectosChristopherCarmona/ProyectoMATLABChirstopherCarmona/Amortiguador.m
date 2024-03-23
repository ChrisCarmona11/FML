%El sistema que se intenta modelar es el de un amortiguador de vehiculo,
%este se puede lianealizar a un modelo equivalente de masa resorte.
% 
% La ecución diferencial que cumple que cumple este controlador es:
%         m * x''(t) + b * x'(t) + k * x(t) = f(t) donde 
% m es la masa del vehículo (kg)
% b es la constante de amortiguamiento del amortiguador (N * s / m)
% k es la constante de rigidez del resorte (N / m)
% x(t) es la posición del vehículo en el tiempo (m)
% f(t) es la fuerza externa aplicada al vehículo en el tiempo (N)

% aplicando la transformada de laplace obtenemos la siguiente función 
% de transferencia :

% G(s) = X(s) / F(s) = (ms^2 + bs + k) / ms^2

% Tomamos los siguientes valores para los parametros

m=1500;
b=150;
k=15000;

%Asi que la función de transferencia será:

G = tf([m,b,k],[m 0 0]);

%Como la señal de entrada que vamos a usar es discreta tambien
%discretizaremos la planta.
global pasos;

G_discreto = c2d(G,1/pasos,'zoh');
