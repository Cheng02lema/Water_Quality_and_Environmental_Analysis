% 创建数据
station = 1:28; % 站位编号
oil_hydrocarbons = [485.26, 598.42, 144.24, 121.37, 213.32, 308.2, 896.11, 412.33, 5.58, 2.5, 226.64, 955.82, 105.72, 181.22, 261.42, 24.11, 2.52, 370.1, 158.48, 185.67, 2.5, 2.5, 298.31, 0.96, 0.96, 2.52, 5.61, 0.95]; % 石油烃数据

% 创建柱状图
figure;
bar(station, oil_hydrocarbons, 'FaceColor', [0.1, 0.3, 0.6]); % 设置更深的蓝色

% 设置图表标题和标签
title('各站位石油烃含量柱状图', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('站位', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('石油烃含量 (μg/L)', 'FontSize', 12, 'FontWeight', 'bold');

% 设置x轴刻度
xticks(station); % 设置每个站位为x轴刻度

% 只显示x轴和左侧y轴的刻度，隐藏右侧和上方的刻度
ax = gca;
ax.Box = 'off'; % 关闭右侧和顶部刻度框
ax.XAxis.TickDirection = 'out'; % 设置x轴刻度向外
ax.YAxis.TickDirection = 'out'; % 设置y轴刻度向外

% 设置字体大小
set(gca, 'FontSize', 12);

% 删掉网格
grid off;
% 调整图形窗口大小 (单位为像素 [x y width height])
set(gcf, 'Position', [100, 100, 800, 600]);  % 宽800px，高600px


% 调整x轴和y轴范围
ylim([0, max(oil_hydrocarbons) + 100]); % y轴范围设置稍高于最大值
filename = '各站位石油烃含量柱状图.svg';
saveas(gcf, filename, 'svg');  % 保存为 SVG 格式
