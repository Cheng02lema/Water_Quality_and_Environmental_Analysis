% 创建站点数据
stations = 1:28; 

% 夏季磷酸盐数据
summer_phosphate = [
    12.08, 9.24, 29.62, 10.05, 5.96, 8.36, 11.28, 4.69, 5.82, 4.89, ...
    8.16, 7.34, 14.01, 13.26, 2.34, 3.07, 5.61, 3.52, 8.63, 8.25, ...
    4.68, 6.35, 2.47, 5.64, 4.82, 16.07, 18.22, 16.58
];

% 秋季磷酸盐数据
autumn_phosphate = [
    4.00, 6.70, 6.03, 4.68, 9.40, 4.00, 4.00, 8.05, 4.00, 5.35, ...
    4.68, 5.35, 5.35, 6.70, 6.03, 9.40, 11.42, 8.73, 14.80, 8.73, ...
    6.03, 9.40, 8.73, 6.70, 14.12, 11.42, 14.12, 12.77
];

% 创建柱状图的数据矩阵
phosphate_data = [summer_phosphate; autumn_phosphate]';

% 绘制柱状图
figure;
b = bar(stations, phosphate_data, 'grouped');

% 移除柱子的黑色描边
for k = 1:length(b)
    b(k).EdgeColor = 'none';
end


% 设置图例、标题和轴标签
legend({'20夏季', '20秋季'}, 'Location', 'southoutside', 'Orientation', 'horizontal');
title('2020年夏季和秋季各站点磷酸盐含量柱状图');
xlabel('站点');
ylabel('磷酸盐含量 (μg/L)');
% 只显示x轴和左侧y轴的刻度，隐藏右侧和上方的刻度
ax = gca;
ax.Box = 'off'; % 关闭右侧和顶部刻度框
ax.XAxis.TickDirection = 'out'; % 设置x轴刻度向外
ax.YAxis.TickDirection = 'out'; % 设置y轴刻度向外

% 设置坐标轴
xticks(stations);
xtickformat('%.0f');
grid off;
% 调整图形窗口大小 (单位为像素 [x y width height])
set(gcf, 'Position', [100, 100, 800, 600]);  % 宽800px，高600px

% 保存图形为SVG文件并指定高质量输出
filename = '2020年夏季和秋季各站点磷酸盐含量柱状图.svg';
saveas(gcf, filename, 'svg');  % 保存为 SVG 格式

% 显示图形
hold off;
