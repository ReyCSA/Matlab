fs = 44100 %Frecuencia de muestreo
grabar = wavrecord(1.5*fs,fs) %Graba
wavwrite (grabar,fs,16,'Voz/nuevo.wav') %Guarda