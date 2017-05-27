clear;
clc;

alt = -2000:1000:25000;
mn = 0:0.05:0.75;
dtamb = -72:9:72;

names = {'alt','mn','dtamb','n1c2'};

nrows = length(alt) .* length(mn) .* length(dtamb);
data = ones(nrows,4);

brkpt = 36;

row = 1;
for ii = 1:length(alt)
    for jj = 1:length(mn)
        for kk = 1:length(dtamb);
            data(row,1) = alt(ii);
            data(row,2) = mn(jj);
            data(row,3) = dtamb(kk);
            
            if dtamb(kk) <= brkpt
                scale = 0.1;
            else
                scale = 0.1.*dtamb(kk);
            end
%             data(row,4) = 10000.*(1-mn(jj)) - (100./(alt(ii)+1))-(dtamb(kk).*scale);
            data(row,4) = (10000-(alt(ii)./10)).*(1-mn(jj)) -(dtamb(kk).*scale);
            
            row = row + 1;
        end
    end
end

% small = data(1:17,:);
% s2 = data(18:34,:);
% figure(1);
% hold on;
% plot(small(:,3),small(:,4),'bo')
% plot(s2(:,3),s2(:,4),'rx')
% % axis([-100 72 9000 12000]);


ubin = array2table(data,'VariableNames',names);