% 创建站点数据
stations = 1:28;

% 2022春季磷酸盐数据
spring_2022_phosphate = [
    14.69, 10.63, 14.69, 11.98, 11.98, 17.4, 16.04, 16.04, 13.34, 13.34, ...
    14.69, 18.75, 9.27, 9.27, 3.85, 2.5, 5.21, 7.92, 7.92, 17.4, ...
    21.46, 17.4, 20.11, 18.75, 18.75, 13.34, 10.63, 9.27
];

% 2022春季营养指数数据
spring_2022_ei = [
    0.73, 0.46, 0.89, 0.66, 0.74, 0.89, 0.95, 0.66, 0.67, 0.59, ...
    0.52, 0.55, 0.33, 0.25, 0.34, 0.1, 0.09, 0.14, 0.45, 0.31, ...
    0.91, 1.01, 0.91, 1.01, 0.91, 1.0, 0.81, 1.17
];

% 归一化函数，将数据缩放到[0, 1]区间
normalize_to_1 = @(x) (x - min(x)) / (max(x) - min(x));

% 归一化磷酸盐数据和营养指数数据到[0, 1]
norm_phosphate = normalize_to_1(spring_2022_phosphate);
norm_ei = normalize_to_1(spring_2022_ei);

% 绘制归一化后的折线图
figure;
set(gcf, 'Position', [100, 100, 800, 600]);  % 设置图形大小

% 绘制实线 - 磷酸盐含量
plot(stations, norm_phosphate, '-o', 'LineWidth', 2, 'DisplayName', '磷酸盐含量 (归一化)');
hold on;

% 绘制虚线 - 营养指数
plot(stations, norm_ei, '--s', 'LineWidth', 2, 'DisplayName', '营养指数 (归一化)');

% 添加图例、标题和轴标签
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');
title('2022春季各站点磷酸盐含量与营养指数 (归一化) 折线图');
xlabel('站点');
ylabel('归一化值');

% 关闭网格线
grid off;

% 设置y轴范围为0-1.4
ylim([0 1.4]);

% 设置x轴刻度显示每个站点，并调整刻度样式
xticks(stations);
xlim([1 28]);

% 关闭右边和上边的刻度线
ax = gca;
ax.Box = 'off';  % 关闭顶部和右侧的边框线
ax.XAxis.TickDirection = 'out';  % 设置x轴刻度向外
ax.YAxis.TickDirection = 'out';  % 设置y轴刻度向外

% 保存图形为SVG文件
filename = '2022春季磷酸盐与营养指数归一化_0到1_4.svg';
saveas(gcf, filename, 'svg');

% 显示图形
hold off;
