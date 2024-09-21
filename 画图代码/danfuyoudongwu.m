% Script: plot_Nitrogen_Zooplankton.m
% 目的：绘制无机氮（氮）与浮游动物生物量的双轴折线图（不归一化和归一化）

% 清空环境
clear;
clc;

% -------------------------------
% 1. 数据准备
% -------------------------------

% 定义时间标签
time_labels = {'19冬', '20春', '20夏', '20秋', '20冬', ...
               '21春', '21夏', '21秋', '22春', '22夏', ...
               '22秋', '22冬'};

% 定义无机氮数据（μg/L）
nitrogen = [89.18678571, 93.08357143, 108.1914286, 121.1625, ...
            54.14142857, 104.9385714, 37.82178571, 62.80035714, ...
            264.2957143, 219.0525, 150.6892857, 79.65928571];

% 定义浮游动物生物量数据（mg/m³），缺失数据用NaN表示
zooplankton_biomass = [NaN, 162.4535714, NaN, 216.3928571, NaN, ...
                       83.08892857, NaN, 19.43464286, 4586.0508, NaN, ...
                       60.20821429, NaN];

% -------------------------------
% 2. 数据过滤（去除缺失数据的年份）
% -------------------------------

% 创建逻辑索引，标记浮游动物生物量有数据的年份
valid_indices = ~isnan(zooplankton_biomass);

% 提取有效数据
years_valid = time_labels(valid_indices);
nitrogen_valid = nitrogen(valid_indices);
zooplankton_valid = zooplankton_biomass(valid_indices);

% 定义X轴数据点（仅有效数据点）
x = 1:length(years_valid);

% -------------------------------
% 3. 归一化处理（Min-Max 归一化）
% -------------------------------

% 归一化无机氮
nitrogen_norm = (nitrogen_valid - min(nitrogen_valid)) / (max(nitrogen_valid) - min(nitrogen_valid));

% 归一化浮游动物生物量
zooplankton_norm = (zooplankton_valid - min(zooplankton_valid)) / (max(zooplankton_valid) - min(zooplankton_valid));

% -------------------------------
% 4. 绘图
% -------------------------------

% 定义颜色
color_N = [0 0.4470 0.7410];          % 蓝色
color_Zoop = [0.8500 0.3250 0.0980];  % 橙色

%% 4.1 不归一化的数据双轴折线图
figure;
set(gcf, 'Position', [100, 100, 1200, 600]);  % 设置图形窗口大小为1200x600像素

% 绘制左 Y 轴（无机氮）
yyaxis left;
hold on;

% 绘制无机氮折线图（实线）
plot(x, nitrogen_valid, '-o', 'LineWidth', 2, ...
     'Color', color_N, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_N, ...
     'DisplayName', '无机氮 (μg/L)');

% 设置左 Y 轴标签
ylabel('无机氮 (μg/L)', 'FontSize', 12);

% 绘制右 Y 轴（浮游动物生物量）
yyaxis right;

% 绘制浮游动物生物量折线图（实线）
plot(x, zooplankton_valid, '--^', 'LineWidth', 2, ...
     'Color', color_Zoop, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_Zoop, ...
     'DisplayName', '浮游动物生物量 (mg/m³)');

% 设置右 Y 轴标签
ylabel('浮游动物生物量 (mg/m³)', 'FontSize', 12);

% 设置X轴标签和刻度
xlabel('时间', 'FontSize', 12);
xticks(x);
xticklabels(years_valid);
xtickangle(45);  % 旋转X轴标签以避免重叠

% 设置图表标题
title('无机氮 (N) 与浮游动物生物量的双轴时间序列折线图 (不归一化)', ...
      'FontSize', 14, 'FontWeight', 'bold');

% 添加图例并将其放置在下方
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');

% 去掉网格
grid off;

% 添加数据标签（无机氮数据）
for i = 1:length(x)
    text(x(i), nitrogen_valid(i), sprintf('%.2f', nitrogen_valid(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_N);
end

% 添加数据标签（浮游动物生物量数据）
for i = 1:length(x)
    text(x(i), zooplankton_valid(i), sprintf('%.2f', zooplankton_valid(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_Zoop);
end

% 保存图表为PNG文件
saveas(gcf, 'Nitrogen_Zooplankton_Unnormalized.png');

hold off;

%% 4.2 归一化的数据双轴折线图
figure;
set(gcf, 'Position', [150, 150, 1200, 600]);  % 设置图形窗口大小为1200x600像素

% 绘制左 Y 轴（无机氮归一化）
yyaxis left;
hold on;

% 绘制无机氮归一化折线图（虚线）
plot(x, nitrogen_norm, '-o', 'LineWidth', 2, ...
     'Color', color_N, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_N, ...
     'DisplayName', '无机氮（归一化）');

% 设置左 Y 轴标签
ylabel('无机氮归一化 (0-1)', 'FontSize', 12);

% 绘制右 Y 轴（浮游动物生物量归一化）
yyaxis right;

% 绘制浮游动物生物量归一化折线图（虚线）
plot(x, zooplankton_norm, '--^', 'LineWidth', 2, ...
     'Color', color_Zoop, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_Zoop, ...
     'DisplayName', '浮游动物生物量（归一化）');

% 设置右 Y 轴标签
ylabel('浮游动物生物量归一化 (0-1)', 'FontSize', 12);

% 设置X轴标签和刻度
xlabel('时间', 'FontSize', 12);
xticks(x);
xticklabels(years_valid);
xtickangle(45);  % 旋转X轴标签以避免重叠

% 设置图表标题
title('无机氮 (N) 与浮游动物生物量的双轴时间序列折线图 (归一化)', ...
      'FontSize', 14, 'FontWeight', 'bold');

% 添加图例并将其放置在下方
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');

% 去掉网格
grid off;

% 添加数据标签（无机氮归一化数据）
for i = 1:length(x)
    text(x(i), nitrogen_norm(i), sprintf('%.2f', nitrogen_norm(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_N, 'FontWeight', 'bold');
end

% 添加数据标签（浮游动物生物量归一化数据）
for i = 1:length(x)
    text(x(i), zooplankton_norm(i), sprintf('%.2f', zooplankton_norm(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_Zoop, 'FontWeight', 'bold');
end

% 保存图表为PNG文件
saveas(gcf, 'Nitrogen_Zooplankton_Normalized.png');

hold off;
