[y,Fs] = audioread('homework.wav');
person{1,1} = 'Runze.Wang';
person{1,2} = 'PB20020480';
person{1,3} = 'Physics';
person{2,1} = y;
person{2,2} = Fs;
person{2,3} = 20220711;

student.name = person{1,1};
student.id = person{1,2};
student.major = person{1,3};
student.wav = y;
student.fs = Fs;
student.time = 20220711; 