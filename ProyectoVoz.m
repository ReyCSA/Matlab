filename = 'bienvenida.wav';

[y, fs, nbits] = wavread(filename)

sound(y, fs, nbits)

%fs = 6000

%y=wavrecord(2*fs,fs)

%wavplay(y,fs)