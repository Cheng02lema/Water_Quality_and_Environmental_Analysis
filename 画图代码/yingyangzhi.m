% 创建站点数据
stations = 1:28; 

% 营养指数数据
nutrient_index = [
    0.73, 0.46, 0.89, 0.66, 0.74, 0.89, 0.95, 0.66, 0.67, 0.59, ...
    0.52, 0.55, 0.33, 0.25, 0.34, 0.10, 0.09, 0.14, 0.45, 0.31, ...
    0.91, 1.01, 0.91, 1.01, 0.91, 1.00, 0.81, 1.17
];

% 绘制柱状图
figure;
b = bar(stations, nutrient_index);

% 显示柱状图上的数值
xtips = b.XEndPoints;
ytips = b.YEndPoints;
labels = string(nutrient_index);
text(xtips, ytips, labels, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');

% 设置图例、标题和轴标签
title('2022年春季各站点营养指数柱状图');
xlabel('站点');
ylabel('营养指数 (EI)');
% 移除柱子的黑色描边
for k = 1:length(b)
    b(k).EdgeColor = 'none';
end

% 设置坐标轴
xticks(stations);
xtickformat('%.0f');
grid on;
ax = gca;
ax.Box = 'off'; % 关闭右侧和顶部刻度框
ax.XAxis.TickDirection = 'out'; % 设置x轴刻度向外
ax.YAxis.TickDirection = 'out'; % 设置y轴刻度向外

% 删掉网格
grid off;
% 调整图形窗口大小 (单位为像素 [x y width height])
set(gcf, 'Position', [100, 100, 800, 600]);  % 宽800px，高600px


% 显示图形
hold off;
filename = '2022年春季各站点营养指数柱状图.svg';
saveas(gcf, filename, 'svg');  % 保存为 SVG 格式
