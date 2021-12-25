%fs = 512;                    % Sampling frequency (samples per second)
%dt = 1/fs;                   % seconds per sample
%StopTime = 0.25;             % seconds
%t = (0:dt:StopTime-dt)';     % seconds
%F = 100;                      % Sine wave frequency (hertz)
%data =5.0*sin(2*pi*F*t);
%plot(t,data);
t=linspace(0,3*pi);
data=square(t);
t1=t';
data1=data';
plot(t1,data1);
A=[t1 data1];
csvwrite('myfile.txt',A);
status= system('"C:\Program Files\LTC\LTspiceXVII\XVIIx64.exe" -Run -b C:\Users\Anirban\Desktop\RCtest.asc');
readfile=LTspice2Matlab('RCtest.raw');
CV1=1;
CV2=2;
x1=readfile.variable_mat(CV1,:);
x2=readfile.variable_mat(CV2,:);
y=readfile.time_vect;
%CV2=readfile.variable_mat(find(readfile.variable_name_list,'V(two)'));
subplot(2,1,1);
plot(y,x1,'k');
hold on
subplot(2,1,2);
plot(y,x2);