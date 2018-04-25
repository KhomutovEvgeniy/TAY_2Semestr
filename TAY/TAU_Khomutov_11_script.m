%Point 1
a = [1 21.2 26.247 7.217 1.601 0.376];
b = [1.25 1.626 0.376];
%Point 2
W = tf(b, a);
%Point 3
[A,B,C,D] = tf2ss(b, a);
H = ctrb(A,B);
G = obsv(A,C);
rA = rank (A);
E = eye(rA);
rH = rank(H);
rG = rank(G);
%Point 4
palls = roots (a)
figure(1);
nyquist(W); %The system is unstable, because Nyquist hodograph does not cover the point (-1,0j) l/2 times
Wm = tf(a, [1]);
figure(2);
nyquist(Wm);%The system is unstable, because Mikhailov hodograph does not consistently cover 5 quadrants
%Point 5
figure(3);
step(W); % This function receive a system response when the Heaviside function is acting on the input
figure(4); % My system is unstable, so I can't define Time characteristics
bode(W);
% AmplitudeMAX = 44
% Resonance peak = 0.249 rad/s
% Degree of stability = 0.0028
% Degree of oscillation = min(Re/Im) = 0.0028 / 0.2493 = 0.0112 rad/s
% Frequency of transmission = 0...0.388 rad/s
% cut off frequency = 0.353 rad/s

%Point 6
Pc = [-10 -11 -12 -13 -14];
K = acker (A,B,Pc);
Amplitude = 1.57 * 10 ^ (-6);
% Point 8
P0 = [-20 -21 -22 -23 -24];
L = acker(A',C',P0)';
