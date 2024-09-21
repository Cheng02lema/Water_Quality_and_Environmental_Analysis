% 创建站点数据
stations = 1:28; 

% 2020冬季磷酸盐数据
winter_phosphate = [
    4.92, 5.68, 3.34, 10.29, 18.01, 11.57, 12.84, 16.34, 5.68, 5.87, ...
    5.88, 4.67, 5.26, 9.85, 5.68, 5.62, 8.04, 10.39, 8.72, 3.55, ...
    6.77, 7.45, 2.86, 5.38, 9.18, 15.22, 18.35, 16.93
];

% 2021春季磷酸盐数据
spring_phosphate = [
    7.04, 4.48, 2.88, 12.72, 32.38, 9.12, 13.02, 19.02, 1.46, 11.32, ...
    4.78, 7.7, 12.04, 10.28, 9.72, 4.18, 2.24, 13.12, 10.76, 3.34, ...
    2.88, 8.26, 1.78, 5.92, 3.54, 8.36, 22.74, 17.26
];

% 创建柱状图的数据矩阵
phosphate_data = [winter_phosphate; spring_phosphate]';

% 绘制柱状图
figure;
b = bar(stations, phosphate_data, 'grouped');


% 设置图例、标题和轴标签
legend({'20冬季', '21春季'}, 'Location', 'southoutside', 'Orientation', 'horizontal');
title('2020冬季和2021春季各站点磷酸盐含量柱状图');
xlabel('站点');
ylabel('磷酸盐含量 (μg/L)');

% 移除柱子的黑色描边
for k = 1:length(b)
    b(k).EdgeColor = 'none';
end

ax = gca;
ax.Box = 'off'; % 关闭右侧和顶部刻度框
ax.XAxis.TickDirection = 'out'; % 设置x轴刻度向外
ax.YAxis.TickDirection = 'out'; % 设置y轴刻度向外
% 设置坐标轴
xticks(stations);
xtickformat('%.0f');
% 删掉网格
grid off;
% 调整图形窗口大小 (单位为像素 [x y width height])
set(gcf, 'Position', [100, 100, 800, 600]);  % 宽800px，高600px

% 保存图形为SVG文件并指定高质量输出
filename = '2020冬季和2021春季各站点磷酸盐含量柱状图.svg';
saveas(gcf, filename, 'svg');  % 保存为 SVG 格式
% 显示图形
hold off;
