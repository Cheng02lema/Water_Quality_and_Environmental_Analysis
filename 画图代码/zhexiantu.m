% 绘制柱状图
figure;
bar(stations, phosphate_data, 'grouped');
ax = gca;
ax.Box = 'off'; % 关闭右侧和顶部刻度框
ax.XAxis.TickDirection = 'out'; % 设置x轴刻度向外
ax.YAxis.TickDirection = 'out'; % 设置y轴刻度向外

% 设置图例、标题和轴标签
legend({'20夏季', '20秋季'}, 'Location', 'southoutside', 'Orientation', 'horizontal');
title('2020年夏季和秋季各站点磷酸盐含量柱状图');
xlabel('站点');
ylabel('磷酸盐含量 (μg/L)');

% 设置坐标轴
xticks(stations);
xtickformat('%.0f');

% 删掉网格
grid off;

% 调整图形窗口大小 (单位为像素 [x y width height])
set(gcf, 'Position', [100, 100, 800, 600]);  % 宽800px，高600px

% 显示图形
hold off;
filename = '2020年夏季和秋季各站点磷酸盐含量柱状图.svg';
saveas(gcf, filename, 'svg');  % 保存为 SVG 格式
