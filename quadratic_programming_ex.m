%无约束的二次规划问题求解析解
syms u1 u2 lamada1

u = [u1;u2];
H = [1 0;0 1];
f = [1;1];

% J = 0.5*(u'*H*u+u'*f);

% u_star = -inv(H)*f;%对目标函数求极值算得解析解，当H可逆

%% 包含等式约束

lamada = [lamada1];
M_eq = [1 -1];
b_eq = 1;

% J = 0.5*(u'*H*u+u'*f) + M_eq'*lamada;%有边界的多元函数求极值
% 当 [H M_eq';M_eq 0] 可逆
% star = inv([H M_eq';M_eq 0])*[-f;b_eq]
% u_star = [star(1,1);star(2.1)]
% lamda_star = star(3,1)

%% 包含不等式约束
LB = [0;0];%LB <= u <= UB
UB = [1;2];

M = [1 1;-1 1];%M*u <= b
b = [2;1];

% 用matlab软件求解
options = optimset('Display','off');
[u,J] = quadprog(H,f,M,b,[],[],LB,UB,[],options);