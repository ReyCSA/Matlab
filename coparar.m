%Reconocer correctos
voz1 = wavread('Voz/rey1');
voz2 = wavread('Voz/rey2');
voz3 = wavread('Voz/rey3');
voz4 = wavread('Voz/rey4');
voz5 = wavread('Voz/rey5');
voz6 = wavread('Voz/rey6');
voz7 = wavread('Voz/rey7');
voz8 = wavread('Voz/rey8');

%Reconocer incorrectos
mal1 = wavread('Voz/mal1');
mal2 = wavread('Voz/mal2');
mal3 = wavread('Voz/mal3');
mal4 = wavread('Voz/mal4');
mal5 = wavread('Voz/mal5');
mal6 = wavread('Voz/mal6');
mal7 = wavread('Voz/mal7');
mal8 = wavread('Voz/mal8');

%Mandamos a llamar la clase Normalizar
si1 = normalizar(voz1);
si2 = normalizar(voz2);
si3 = normalizar(voz3);
si4 = normalizar(voz4);
si5 = normalizar(voz5);
si6 = normalizar(voz6);
si7 = normalizar(voz7);
si8 = normalizar(voz8);

no1 = normalizar(mal1);
no2 = normalizar(mal2);
no3 = normalizar(mal3);
no4 = normalizar(mal4);
no5 = normalizar(mal5);
no6 = normalizar(mal6);
no7 = normalizar(mal7);
no8 = normalizar(mal8);

%Transformada de Fourier
transSi1 = abs(fft(si1));
transSi2 = abs(fft(si2));
transSi3 = abs(fft(si3));
transSi4 = abs(fft(si4));
transSi5 = abs(fft(si5));
transSi6 = abs(fft(si6));
transSi7 = abs(fft(si7));
transSi8 = abs(fft(si8));

transNo1 = abs(fft(no1));
transNo2 = abs(fft(no2));
transNo3 = abs(fft(no3));
transNo4 = abs(fft(no4));
transNo5 = abs(fft(no5));
transNo6 = abs(fft(no6));
transNo7 = abs(fft(no7));
transNo8 = abs(fft(no8));

% se obtiene el conjugado
transSi1 = transSi1.*conj (transSi1); 
vozp1f = transSi1 (1:100);
transSi2 = transSi2.*conj (transSi2); 
vozp2f = transSi2 (1:100);
transSi3 = transSi3.*conj (transSi3); 
vozp3f = transSi3 (1:100);
transSi4 = transSi4.*conj (transSi4); 
vozp4f = transSi4 (1:100);
transSi5 = transSi5.*conj (transSi5); 
vozp5f = transSi5 (1:100);
transSi6 = transSi6.*conj (transSi6); 
vozp6f = transSi6 (1:100);
transSi7 = transSi7.*conj (transSi7); 
vozp7f = transSi7 (1:100);
transSi8 = transSi8.*conj (transSi8); 
vozp8f = transSi8 (1:100);
transNo1 = transNo1.*conj (transNo1); 
vozpn1f = transNo1 (1:100);
transNo2 = transNo2.*conj (transNo2); 
vozpn2f = transNo2 (1:100);
transNo3 = transNo3.*conj (transNo3); 
vozpn3f = transNo3 (1:100);
transNo4 = transNo4.*conj (transNo4); 
vozpn4f = transNo4 (1:100);
transNo5 = transNo5.*conj (transNo5); 
vozpn5f = transNo5 (1:100);
transNo6 = transNo6.*conj (transNo6); 
vozpn6f = transNo6 (1:100);
transNo7 = transNo7.*conj (transNo7); 
vozpn7f = transNo7 (1:100);
transNo8 = transNo8.*conj (transNo8); 
vozpn8f = transNo8 (1:100);

% se normaliza el vector
vozp1fn  = vozp1f/sqrt  (sum (abs (vozp1f).^2)); 
vozp2fn  = vozp2f/sqrt  (sum (abs (vozp2f).^2)); 
vozp3fn  = vozp3f/sqrt  (sum (abs (vozp3f).^2)); 
vozp4fn  = vozp4f/sqrt  (sum (abs (vozp4f).^2)); 
vozp5fn  = vozp5f/sqrt  (sum (abs (vozp5f).^2)); 
vozp6fn  = vozp6f/sqrt  (sum (abs (vozp6f).^2)); 
vozp7fn  = vozp7f/sqrt  (sum (abs (vozp7f).^2)); 
vozp8fn  = vozp8f/sqrt  (sum (abs (vozp8f).^2)); 
vozpn1fn = vozpn1f/sqrt (sum (abs (vozpn1f).^2)); 
vozpn2fn = vozpn2f/sqrt (sum (abs (vozpn2f).^2)); 
vozpn3fn = vozpn3f/sqrt (sum (abs (vozpn3f).^2)); 
vozpn4fn = vozpn4f/sqrt (sum (abs (vozpn4f).^2)); 
vozpn5fn = vozpn5f/sqrt (sum (abs (vozpn5f).^2)); 
vozpn6fn = vozpn6f/sqrt (sum (abs (vozpn6f).^2)); 
vozpn7fn = vozpn7f/sqrt (sum (abs (vozpn7f).^2)); 
vozpn8fn = vozpn8f/sqrt (sum (abs (vozpn8f).^2)); 

%Creamos el Entrenamiento
p = [vozp1fn,vozp2fn,vozp3fn,vozp4fn,vozp5fn,vozp6fn,vozp7fn,vozp8fn,vozpn1fn,vozpn2fn,vozpn3fn,vozpn4fn,vozpn5fn,vozpn6fn,vozpn7fn,vozpn8fn]
t = [1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0]
netback = newff(p,t,4)

netback = train(netback,p,t)
netback = sim(netback,voz1fn)
if netback>0.8    
    %Comparar
    msbien = 'Mensaje/correcto.wav'; %Abre el archivo
    [correcto, fs, nbits] = wavread(msbien); %Lee el archivo de audio
    sound(correcto, fs, nbits);
end 
if netback<0.8
    %Comparar
    msmal = 'Mensaje/denegado.wav'; %Abre el archivo
    [malo, fs, nbits] = wavread(msmal); %Lee el archivo de audio
    sound(malo, fs, nbits);
end

