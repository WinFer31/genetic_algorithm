function J = pid_test(G,dt,parms)

s = tf('s');
K = parms(1)*(1 + parms(2)*(1/s)+parms(3)*((100)/(1+100*(1/s))));
Loop = series(K,G);
ClosedLoop = feedback(Loop,1);
t = 0:dt:300;
[y,t] = step(ClosedLoop,t);
CTRLtf = K/(1+K*G);
u = lsim(K,1-y,t);

% Calculate overshoot and rising time
y_target = 1.0; % target output value
y_max = max(y);
y_final = y(end);
t_rise = 0; % initialize rising time
for i = 1:length(y)
    if y(i) >= y_target
        t_rise = t(i);
        break
    end
end

% Define penalty functions for overshoot and rising time
k_overshoot = 100; % penalty strength for overshoot
k_rise = 10; % penalty strength for rising time
t_rise_max = 100; % maximum allowable rising time (seconds)
if y_max <= y_target
    J_overshoot = 0;
else
    J_overshoot = k_overshoot * (y_max - y_target)^2;
end
if t_rise <= t_rise_max
    J_rise = 0;
else
    J_rise = k_rise * (t_rise - t_rise_max)^2;
end

% Calculate ITAE
e = 1 - y; % setpoint - output
ITAE = dt * sum(abs(e) .* t);

% Combine overshoot, rising time, and ITAE penalties
J = ITAE + J_overshoot + J_rise;

step(ClosedLoop,t)
h = findobj(gcf,'type','line');
set(h,'linewidth',2, 'color', 'blue');
drawnow