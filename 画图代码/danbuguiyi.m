% Script: plot_Nitrogen_Unnormalized.m

% 清空环境
clear;
clc;

% 定义时间标签
time_labels = {'19冬', '20春', '20夏', '20秋', '20冬', ...
               '21春', '21夏', '21秋', '22春', '22夏', ...
               '22秋', '22冬'};

% 定义无机氮数据（μg/L）
nitrogen = [89.18678571, 93.08357143, 108.1914286, 121.1625, ...
            54.14142857, 104.9385714, 37.82178571, 62.80035714, ...
            264.2957143, 219.0525, 150.6892857, 79.65928571];

% 定义X轴数据点
x = 1:length(nitrogen);

% 定义颜色
color_N = [0 0.4470 0.7410];  % 蓝色

% 创建图形窗口并设置大小
figure;
set(gcf, 'Position', [100, 100, 1000, 600]);  % 设置图形窗口大小为1000x600像素

% 绘制无机氮折线图
plot(x, nitrogen, '-o', 'LineWidth', 2, ...
     'Color', color_N, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_N, ...
     'DisplayName', '无机氮 (μg/L)');

% 设置X轴标签和刻度
xlabel('时间', 'FontSize', 12);
xticks(x);
xticklabels(time_labels);
xtickangle(45);  % 旋转X轴标签以避免重叠

% 设置Y轴标签
ylabel('无机氮 (μg/L)', 'FontSize', 12);

% 设置图表标题
title('无机氮 (氮) 的时间序列折线图 (不归一化)', 'FontSize', 14, 'FontWeight', 'bold');

% 添加图例并将其放置在下方
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');

% 去掉网格
grid off;

% 添加数据标签（不归一化数据）
for i = 1:length(x)
    text(x(i), nitrogen(i), sprintf('%.2f', nitrogen(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_N);
end

% 保存图表为PNG文件（可选）
saveas(gcf, 'Nitrogen_Unnormalized.png');

% 保持图形窗口打开
hold off;
