% Script: plot_Nitrogen_Phytoplankton.m
% 目的：绘制无机氮（氮）与浮游植物丰富度的双轴折线图（不归一化和归一化）

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

% 定义浮游植物丰富度数据，缺失数据用NaN表示
phytoplankton_abundance = [NaN, 3.853928571, NaN, 2.201785714, NaN, ...
                           3.280357143, NaN, 3.922142857, 3.441785714, NaN, ...
                           2.926785714, NaN];

% -------------------------------
% 2. 数据过滤（去除缺失数据的年份）
% -------------------------------

% 创建逻辑索引，标记浮游植物丰富度有数据的年份
valid_indices = ~isnan(phytoplankton_abundance);

% 提取有效数据
years_valid = time_labels(valid_indices);
nitrogen_valid = nitrogen(valid_indices);
phytoplankton_valid = phytoplankton_abundance(valid_indices);

% 定义X轴数据点（仅有效数据点）
x = 1:length(years_valid);

% -------------------------------
% 3. 归一化处理（Min-Max 归一化）
% -------------------------------

% 归一化无机氮
nitrogen_norm = (nitrogen_valid - min(nitrogen_valid)) / (max(nitrogen_valid) - min(nitrogen_valid));

% 归一化浮游植物丰富度
phytoplankton_norm = (phytoplankton_valid - min(phytoplankton_valid)) / (max(phytoplankton_valid) - min(phytoplankton_valid));

% -------------------------------
% 4. 绘图
% -------------------------------

% 定义颜色
color_N = [0 0.4470 0.7410];          % 蓝色
color_Phyt = [0.8500 0.3250 0.0980];  % 橙色

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

% 绘制右 Y 轴（浮游植物丰富度）
yyaxis right;

% 绘制浮游植物丰富度折线图（实线）
plot(x, phytoplankton_valid, '--^', 'LineWidth', 2, ...
     'Color', color_Phyt, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_Phyt, ...
     'DisplayName', '浮游植物丰富度');

% 设置右 Y 轴标签
ylabel('浮游植物丰富度', 'FontSize', 12);

% 设置X轴标签和刻度
xlabel('时间', 'FontSize', 12);
xticks(x);
xticklabels(years_valid);
xtickangle(45);  % 旋转X轴标签以避免重叠

% 设置图表标题
title('无机氮 (N) 与浮游植物丰富度的双轴时间序列折线图 (不归一化)', ...
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

% 添加数据标签（浮游植物丰富度数据）
for i = 1:length(x)
    text(x(i), phytoplankton_valid(i), sprintf('%.2f', phytoplankton_valid(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_Phyt);
end

% 保存图表为PNG文件
saveas(gcf, 'Nitrogen_Phytoplankton_Unnormalized.png');

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

% 绘制右 Y 轴（浮游植物丰富度归一化）
yyaxis right;

% 绘制浮游植物丰富度归一化折线图（虚线）
plot(x, phytoplankton_norm, '--^', 'LineWidth', 2, ...
     'Color', color_Phyt, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_Phyt, ...
     'DisplayName', '浮游植物丰富度（归一化）');

% 设置右 Y 轴标签
ylabel('浮游植物丰富度归一化 (0-1)', 'FontSize', 12);

% 设置X轴标签和刻度
xlabel('时间', 'FontSize', 12);
xticks(x);
xticklabels(years_valid);
xtickangle(45);  % 旋转X轴标签以避免重叠

% 设置图表标题
title('无机氮 (N) 与浮游植物丰富度的双轴时间序列折线图 (归一化)', ...
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

% 添加数据标签（浮游植物丰富度归一化数据）
for i = 1:length(x)
    text(x(i), phytoplankton_norm(i), sprintf('%.2f', phytoplankton_norm(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_Phyt, 'FontWeight', 'bold');
end

% 保存图表为PNG文件
saveas(gcf, 'Nitrogen_Phytoplankton_Normalized.png');

hold off;
