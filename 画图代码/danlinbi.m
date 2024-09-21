% 清空环境
clear;
clc;

% 定义时间标签
time_labels = {'19冬', '20春', '20夏', '20秋', '20冬', ...
               '21春', '21夏', '21秋', '22春', '22夏', ...
               '22秋', '22冬'};

% 定义N/P比数据
NP_ratio = [17.20110277, 10.85301036, 51.46121285, 17.85887733, ...
            12.28720864, 14.8018385, 2.394516489, 3.235184026, ...
            25.61341529, 25.6762761, 16.1554291, 13.7882843];

% 定义X轴数据点
x = 1:length(NP_ratio);

% 创建图形窗口并设置大小
figure;
set(gcf, 'Position', [100, 100, 800, 600]);  % 设置图形窗口大小为800x600像素

% 定义折线和标记颜色（统一颜色）
line_color = [0 0.4470 0.7410];  % 蓝色

% 绘制N/P比折线图
plot_handle = plot(x, NP_ratio, '-o', 'LineWidth', 2, ...
                   'Color', line_color, ...
                   'MarkerSize', 8, ...
                   'MarkerFaceColor', line_color, ...
                   'DisplayName', 'N/P');

% 设置X轴标签和Y轴标签
xlabel('时间', 'FontSize', 12);
ylabel('N/P', 'FontSize', 12);

% 设置X轴刻度和标签
xticks(x);
xticklabels(time_labels);
xtickangle(45);  % 旋转X轴标签以避免重叠

% 设置图表标题
title('不同年份和季节的氮磷比 (N/P) 时间序列折线图', 'FontSize', 14, 'FontWeight', 'bold');

% 添加图例并将其放置在下方
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');

% 去掉网格
% grid off;  % 可选：确保网格已关闭

% 优化Y轴范围（可选）
y_min = floor(min(NP_ratio)) - 5;
y_max = ceil(max(NP_ratio)) + 5;
ylim([y_min, y_max]);

% 添加数据标签（可选）
for i = 1:length(NP_ratio)
    if ~isnan(NP_ratio(i))
        text(x(i), NP_ratio(i), sprintf('%.2f', NP_ratio(i)), ...
             'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
             'FontSize', 10, 'Color', 'k');
    end
end

% 保存图表为PNG文件（可选）
saveas(gcf, '氮磷比_NP_ratio_TimeSeries.png');

% 保持图形窗口打开
hold off;
