% 时间数据
time_labels = {'19冬', '20春', '20夏', '20秋', '20冬', '21春', '21夏', '21秋', '22春', '22夏', '22秋', '22冬'};

% 盐度和磷酸盐数据
salinity = [32.41071429, 31.44, 30.25964286, 31.31, 31.06178571, 31.44392857, 30.67678571, 29.76678571, 30.74964286, 29.82357143, 29.66071429, 30.20535714];
phosphate = [7.590357143, 8.947857143, 6.277857143, 7.881785714, 5.015357143, 7.921785714, 19.92571429, 20.85892857, 13.09357143, 13.49821429, 10.63321429, 6.068214286];

% 绘制盐度折线图
figure;
set(gcf, 'Position', [100, 100, 800, 600]);  % 设置图形大小
plot(1:12, salinity, '-o', 'LineWidth', 2, 'Color', [0 0.4470 0.7410], 'DisplayName', '盐度');  % 使用蓝色
title('盐度折线图');
xlabel('时间');
ylabel('盐度');
xticks(1:12);
xticklabels(time_labels);
xlim([1 12]);
grid on;
legend('show', 'Location', 'best');
ax = gca;
ax.Box = 'off';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';

% 绘制磷酸盐折线图
figure;
set(gcf, 'Position', [100, 100, 800, 600]);  % 设置图形大小
plot(1:12, phosphate, '-s', 'LineWidth', 2, 'Color', [0 0.4470 0.7410], 'DisplayName', '磷酸盐');  % 使用蓝色
title('磷酸盐折线图');
xlabel('时间');
ylabel('磷酸盐 (μg/L)');
xticks(1:12);
xticklabels(time_labels);
xlim([1 12]);
grid on;
legend('show', 'Location', 'best');
ax = gca;
ax.Box = 'off';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';
