% 时间数据
time_labels = {'20春', '20秋', '21春', '21秋', '22春', '22秋'};

% 数据
salinity = [31.44, 31.31, 31.44392857, 29.76678571, 30.74964286, 29.66071429];
phosphate = [8.947857143, 7.881785714, 7.921785714, 20.85892857, 13.09357143, 10.63321429];
zooplankton_biomass = [162.4535714, 216.3928571, 83.08892857, 19.43464286, 4586.0508, 60.20821429];
phytoplankton_abundance = [3.853928571, 2.201785714, 3.280357143, 3.922142857, 3.441785714, 2.926785714];

% 1. 绘制磷酸盐与浮游动物生物量的时间序列折线图
figure;
set(gcf, 'Position', [100, 100, 800, 600]);  % 设置图形大小

% 绘制磷酸盐折线图
yyaxis left;  % 使用左y轴
plot(1:6, phosphate, '-o', 'LineWidth', 2, 'Color', [0 0.4470 0.7410], 'DisplayName', '磷酸盐');
ylabel('磷酸盐 (μg/L)');
hold on;

% 绘制浮游动物生物量折线图
yyaxis right;  % 使用右y轴
plot(1:6, zooplankton_biomass, '--s', 'LineWidth', 2, 'Color', [0.8500 0.3250 0.0980], 'DisplayName', '浮游动物生物量');
ylabel('浮游动物生物量 (mg/m^3)');

% 设置图表属性
xlabel('时间');
xticks(1:6);
xticklabels(time_labels);
xlim([1 6]);
title('磷酸盐和浮游动物生物量的时间序列折线图');
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');
grid on;
hold off;

% 2. 绘制盐度与浮游动物生物量的时间序列折线图
figure;
set(gcf, 'Position', [100, 100, 800, 600]);  % 设置图形大小

% 绘制盐度折线图
yyaxis left;  % 使用左y轴
plot(1:6, salinity, '-o', 'LineWidth', 2, 'Color', [0 0.4470 0.7410], 'DisplayName', '盐度');
ylabel('盐度');
hold on;

% 绘制浮游动物生物量折线图
yyaxis right;  % 使用右y轴
plot(1:6, zooplankton_biomass, '--s', 'LineWidth', 2, 'Color', [0.8500 0.3250 0.0980], 'DisplayName', '浮游动物生物量');
ylabel('浮游动物生物量 (mg/m^3)');

% 设置图表属性
xlabel('时间');
xticks(1:6);
xticklabels(time_labels);
xlim([1 6]);
title('盐度和浮游动物生物量的时间序列折线图');
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');
grid on;
hold off;

% 3. 绘制磷酸盐与浮游植物丰富度的时间序列折线图
figure;
set(gcf, 'Position', [100, 100, 800, 600]);  % 设置图形大小

% 绘制磷酸盐折线图
yyaxis left;  % 使用左y轴
plot(1:6, phosphate, '-o', 'LineWidth', 2, 'Color', [0 0.4470 0.7410], 'DisplayName', '磷酸盐');
ylabel('磷酸盐 (μg/L)');
hold on;

% 绘制浮游植物丰富度折线图
yyaxis right;  % 使用右y轴
plot(1:6, phytoplankton_abundance, '--s', 'LineWidth', 2, 'Color', [0.8500 0.3250 0.0980], 'DisplayName', '浮游植物丰富度');
ylabel('浮游植物丰富度');

% 设置图表属性
xlabel('时间');
xticks(1:6);
xticklabels(time_labels);
xlim([1 6]);
title('磷酸盐和浮游植物丰富度的时间序列折线图');
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');
grid on;
hold off;

% 4. 绘制盐度与浮游植物丰富度的时间序列折线图
figure;
set(gcf, 'Position', [100, 100, 800, 600]);  % 设置图形大小

% 绘制盐度折线图
yyaxis left;  % 使用左y轴
plot(1:6, salinity, '-o', 'LineWidth', 2, 'Color', [0 0.4470 0.7410], 'DisplayName', '盐度');
ylabel('盐度');
hold on;

% 绘制浮游植物丰富度折线图
yyaxis right;  % 使用右y轴
plot(1:6, phytoplankton_abundance, '--s', 'LineWidth', 2, 'Color', [0.8500 0.3250 0.0980], 'DisplayName', '浮游植物丰富度');
ylabel('浮游植物丰富度');

% 设置图表属性
xlabel('时间');
xticks(1:6);
xticklabels(time_labels);
xlim([1 6]);
title('盐度和浮游植物丰富度的时间序列折线图');
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');
grid on;
hold off;
