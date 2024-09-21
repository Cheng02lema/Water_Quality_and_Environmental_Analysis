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

% 定义浮游动物生物量数据（使用NaN替代缺失数据）
zooplankton_biomass = [NaN, 162.4535714, NaN, 216.3928571, NaN, ...
                       83.08892857, NaN, 19.43464286, 4586.0508, NaN, ...
                       60.20821429, NaN];

% 创建一个逻辑索引，标记浮游动物生物量有数据的年份
valid_indices = ~isnan(zooplankton_biomass);

% 提取有效数据
NP_valid = NP_ratio(valid_indices);
zooplankton_valid = zooplankton_biomass(valid_indices);
time_labels_valid = time_labels(valid_indices);

% 归一化处理（Min-Max 归一化）
NP_norm = (NP_valid - min(NP_valid)) / (max(NP_valid) - min(NP_valid));
zooplankton_norm = (zooplankton_valid - min(zooplankton_valid)) / (max(zooplankton_valid) - min(zooplankton_valid));

% 定义X轴数据点（仅有效数据点）
x = 1:length(NP_valid);

% 定义颜色
color_NP = [0 0.4470 0.7410];        % 蓝色
color_Zoop = [0.8500 0.3250 0.0980]; % 橙色

% --------------------------------------------
% 绘制不归一化的数据双轴折线图
% --------------------------------------------
figure;
set(gcf, 'Position', [100, 100, 1000, 600]);  % 设置图形窗口大小为1000x600像素

% 绘制左 y 轴（N/P比）
yyaxis left;
hold on;

% 不归一化的N/P比
plot(x, NP_valid, '-o', 'LineWidth', 2, ...
     'Color', color_NP, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_NP, ...
     'DisplayName', 'N/P');

% 设置左 y 轴标签
ylabel('N/P');

% 绘制右 y 轴（浮游动物生物量）
yyaxis right;

% 不归一化的浮游动物生物量
plot(x, zooplankton_valid, '--^', 'LineWidth', 2, ...
     'Color', color_Zoop, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_Zoop, ...
     'DisplayName', '浮游动物生物量');

% 设置右 y 轴标签
ylabel('浮游动物生物量 (mg/m^3)');

% 设置X轴标签和刻度
xlabel('时间', 'FontSize', 12);
xticks(x);
xticklabels(time_labels_valid);
xtickangle(45);  % 旋转X轴标签以避免重叠

% 设置图表标题
title('氮磷比 (N/P) 与浮游动物生物量的双轴时间序列折线图 (不归一化)', 'FontSize', 14, 'FontWeight', 'bold');

% 添加图例并将其放置在下方
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');

% 去掉网格
% 默认情况下，MATLAB不显示网格线。如果需要确保网格关闭，可以添加以下命令：
% grid off;

% 添加数据标签（不归一化数据）
for i = 1:length(x)
    text(x(i), NP_valid(i), sprintf('%.2f', NP_valid(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_NP);
    text(x(i), zooplankton_valid(i), sprintf('%.2f', zooplankton_valid(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_Zoop);
end

% 保存图表为PNG文件（可选）
saveas(gcf, 'N_P_Zooplankton_Biomass_Dual_Axis_Unnormalized.png');

hold off;

% --------------------------------------------
% 绘制归一化的数据双轴折线图
% --------------------------------------------
figure;
set(gcf, 'Position', [150, 150, 1000, 600]);  % 设置图形窗口大小为1000x600像素

% 绘制左 y 轴（归一化N/P比）
yyaxis left;
hold on;

% 归一化的N/P比
plot(x, NP_norm, '-s', 'LineWidth', 2, ...
     'Color', color_NP, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_NP, ...
     'DisplayName', 'N/P（归一化）');

% 设置左 y 轴标签
ylabel('N/P（归一化）');

% 绘制右 y 轴（归一化浮游动物生物量）
yyaxis right;

% 归一化的浮游动物生物量
plot(x, zooplankton_norm, '--d', 'LineWidth', 2, ...
     'Color', color_Zoop, ...
     'MarkerSize', 8, 'MarkerFaceColor', color_Zoop, ...
     'DisplayName', '浮游动物生物量（归一化）');

% 设置右 y 轴标签
ylabel('浮游动物生物量（归一化） (0-1)');

% 设置X轴标签和刻度
xlabel('时间', 'FontSize', 12);
xticks(x);
xticklabels(time_labels_valid);
xtickangle(45);  % 旋转X轴标签以避免重叠

% 设置图表标题
title('氮磷比 (N/P) 与浮游动物生物量的双轴时间序列折线图 (归一化)', 'FontSize', 14, 'FontWeight', 'bold');

% 添加图例并将其放置在下方
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');

% 去掉网格
% 默认情况下，MATLAB不显示网格线。如果需要确保网格关闭，可以添加以下命令：
% grid off;

% 添加数据标签（归一化数据）
for i = 1:length(x)
    text(x(i), NP_norm(i), sprintf('%.2f', NP_norm(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_NP, 'FontWeight', 'bold');
    text(x(i), zooplankton_norm(i), sprintf('%.2f', zooplankton_norm(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', ...
         'FontSize', 8, 'Color', color_Zoop, 'FontWeight', 'bold');
end

% 保存图表为PNG文件（可选）
saveas(gcf, 'N_P_Zooplankton_Biomass_Dual_Axis_Normalized.png');

hold off;
