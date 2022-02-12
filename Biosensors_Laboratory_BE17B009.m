% Absorbance vs Suucrose concentration

absorbance = [0, 0.0209, 0.0496, 0.0782, 0.1155, 0.1510];
sucrose = [0, 5.2, 10.3, 15.11, 20.0, 25.6];
figure(1);hold on
scatter(sucrose,absorbance, 'b*');
fit = polyfit(sucrose,absorbance,1);

disp(['Equation is y = ' num2str(fit(1)) '*x + ' num2str(fit(2))])
% Evaluate fit equation using polyval
y_est = polyval(fit,sucrose);
plot(sucrose,y_est,'r--','LineWidth',1.2)
xlabel('Sucrose (mg per 100 ul DI water)')
ylabel('Absorbance at 530 nm')
title('Absorbance (530nm) vs sucrose concentration');

%% 

NUM = xlsread('Sucrose_RI.xlsx'); 
weight_percentage = NUM(:,1);
RI = NUM(:,2);

xq = 0:0.01:85; 
figure(2)
vq = interp1(weight_percentage,RI,xq,'spline');
plot(weight_percentage, RI,'*',xq,vq,'-', LineWidth=1);
xlabel('Brix %'); ylabel('Refractive index at 20C')
title('Refractive Index (ICUMSA 1974)');

%%
ind1 = find(xq == 5.2);
v1 = vq(ind1);

ind2 = find(xq == 10.3);
v2 = vq(ind2);

ind3 = find(xq == 15.11);
v3 = vq(ind3);

ind4 = find(xq == 20.0);
v4 = vq(ind4);

ind5 = find(xq == 25.6);
v5 = vq(ind5);
%%

RI_data = [vq(1), v1, v2, v3, v4, v5];
figure(3); hold on
scatter(absorbance, RI_data, 'b*')
fit2 = polyfit(absorbance,RI_data,1);

disp(['Equation is y = ' num2str(fit2(1)) '*x + ' num2str(fit2(2))])
% Evaluate fit equation using polyval
y_est2 = polyval(fit2,absorbance);
plot(absorbance, y_est2,'r--','LineWidth',1.2)
ylabel('Refractive Index of Sucrose')
xlabel('Absorbance at 530 nm')
title('Refractive Index vs Absorbance (530nm)');

%%







