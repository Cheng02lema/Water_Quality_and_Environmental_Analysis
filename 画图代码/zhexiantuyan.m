% 时间数据
time_labels = {'19冬', '20春', '20夏', '20秋', '20冬', '21春', '21夏', '21秋', '22春', '22夏', '22秋', '22冬'};

% 盐度和磷酸盐数据
salinity = [32.41071429, 31.44, 30.25964286, 31.31, 31.06178571, 31.44392857, 30.67678571, 29.76678571, 30.74964286, 29.82357143, 29.66071429, 30.20535714];
phosphate = [7.590357143, 8.947857143, 6.277857143, 7.881785714, 5.015357143, 7.921785714, 19.92571429, 20.85892857, 13.09357143, 13.49821429, 10.63321429, 6.068214286];

% 归一化函数，将数据缩放到[0, 1]区间
normalize_to_1 = @(x) (x - min(x)) / (max(x) - min(x));

% 归一化盐度和磷酸盐数据到[0, 1]
norm_salinity = normalize_to_1(salinity);
norm_phosphate = normalize_to_1(phosphate);

% 绘制归一化后的折线图
figure;
set(gcf, 'Position', [100, 100, 800, 600]);  % 设置图形大小

% 绘制实线 - 盐度
plot(1:12, norm_salinity, '-o', 'LineWidth', 2, 'DisplayName', '盐度 (归一化)');
hold on;

% 绘制虚线 - 磷酸盐
plot(1:12, norm_phosphate, '--s', 'LineWidth', 2, 'DisplayName', '磷酸盐 (归一化)');

% 添加图例、标题和轴标签
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');
title('盐度和磷酸盐 (归一化) 折线图');
xlabel('时间');
ylabel('归一化值');

% 设置y轴范围
ylim([0 1.4]);

% 设置x轴刻度显示
xticks(1:12);
xticklabels(time_labels);
xlim([1 12]);

% 关闭右边和上边的刻度线
ax = gca;
ax.Box = 'off';  % 关闭顶部和右侧的边框线
ax.XAxis.TickDirection = 'out';  % 设置x轴刻度向外
ax.YAxis.TickDirection = 'out';  % 设置y轴刻度向外

% 显示图形
hold off;
% 时间数据
time_labels = {'19冬', '20春', '20夏', '20秋', '20冬', '21春', '21夏', '21秋', '22春', '22夏', '22秋', '22冬'};

% 盐度和磷酸盐数据
salinity = [32.41071429, 31.44, 30.25964286, 31.31, 31.06178571, 31.44392857, 30.67678571, 29.76678571, 30.74964286, 29.82357143, 29.66071429, 30.20535714];
phosphate = [7.590357143, 8.947857143, 6.277857143, 7.881785714, 5.015357143, 7.921785714, 19.92571429, 20.85892857, 13.09357143, 13.49821429, 10.63321429, 6.068214286];

% 绘制不归一化的折线图
figure;
set(gcf, 'Position', [100, 100, 800, 600]);  % 设置图形大小

% 绘制实线 - 盐度
yyaxis left;  % 使用左y轴
plot(1:12, salinity, '-o', 'LineWidth', 2, 'DisplayName', '盐度');
ylabel('盐度');

% 绘制虚线 - 磷酸盐
yyaxis right;  % 使用右y轴
plot(1:12, phosphate, '--s', 'LineWidth', 2, 'DisplayName', '磷酸盐');
ylabel('磷酸盐 (μg/L)');

% 添加图例、标题和轴标签
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');
title('盐度和磷酸盐折线图');
xlabel('时间');

% 设置x轴刻度显示
xticks(1:12);
xticklabels(time_labels);
xlim([1 12]);

% 关闭右边和上边的刻度线
ax = gca;
ax.Box = 'off';  % 关闭顶部和右侧的边框线
ax.XAxis.TickDirection = 'out';  % 设置x轴刻度向外
ax.YAxis(1).TickDirection = 'out';  % 设置左y轴刻度向外
ax.YAxis(2).TickDirection = 'out';  % 设置右y轴刻度向外

% 显示图形
hold off;
