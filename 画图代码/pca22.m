% 创建数据矩阵
data = [
    3.025, 9.525, 32.4107, 9.0579, 8.1275, 0.8075, 8.8157, 89.1868, 7.5904, 8.325;
    3.4357, 17.2179, 31.44, 9.0357, 8, 0.8464, 1.1325, 93.0836, 8.9479, 9.3693;
    1.8107, 25.2964, 30.2596, 5.7107, 8.065, 0.5821, 9.5057, 108.1914, 6.2779, 8.9646;
    1.2143, 20.4571, 31.31, 7.5282, 8.0343, 0.7657, 41.9325, 121.1625, 7.8818, 9.0582;
    1.475, 9.0393, 31.0618, 8.7929, 8.3468, 0.5286, 24.8686, 54.1414, 5.0154, 8.7264;
    1.7143, 14.4143, 31.4439, 7.1036, 8.3686, 0.8986, 213.3336, 104.9386, 7.9218, 9.3693;
    1.825, 27.525, 30.6768, 7.2304, 8.1832, 0.9586, 18.4879, 37.8218, 19.9257, 8.2829;
    0.9214, 19.2321, 29.7668, 7.2818, 8.1211, 0.9418, 26.0543, 62.8004, 20.8589, 9.2636;
    3.0214, 12.7286, 30.7496, 8.3782, 8.0861, 0.7979, 9.2943, 264.2957, 13.0936, 10.3721;
    2.3107, 26.3429, 29.8236, 6.19, 8.1257, 0.8282, 10.7166, 219.0525, 13.4982, 10.1896;
    2.4857, 18.4857, 29.6607, 6.3675, 8.1818, 0.8079, 7.8603, 150.6893, 10.6332, 7.6943;
    1.5393, 11.4357, 30.2054, 7.3643, 8.1636, 0.6911, 5.8711, 79.6593, 6.0682, 6.8086
];

% 定义变量名称和样本标签
var_names = {'透明度', '温度', '盐度', 'DO', 'pH', 'COD', '石油烃', '无机氮', '磷酸盐', '悬浮物'};

% 数据标准化
data_standardized = zscore(data);

% 进行PCA分析
[coeff, score, latent] = pca(data_standardized);

% 计算解释方差百分比
explained = (latent / sum(latent)) * 100;

% 创建PCA双标图并将线条设置为黑色
figure;
biplot(coeff(:,1:2), 'Scores', score(:,1:2), 'VarLabels', var_names, 'ObsLabels', time_points, 'LineWidth', 1.5, 'Color', 'k', 'MarkerSize', 10);

% 手动调整重叠数据的标签位置
text_offsets = [0.05, 0.05; 0.05, -0.05; -0.05, 0.05; -0.05, -0.05; ...  % 自定义每个标签的偏移
                0.1, 0.1; 0.1, -0.1; -0.1, 0.1; -0.1, -0.1; 
                0.15, 0.15; 0.15, -0.15; -0.15, 0.15; -0.15, -0.15];
            
% 调整每个数据点的标签位置
for i = 1:size(score, 1)
    text(score(i, 1) + text_offsets(i, 1), score(i, 2) + text_offsets(i, 2), time_points{i}, 'FontSize', 10, 'Color', 'r');
end

% 添加圆圈
theta = linspace(0, 2*pi, 100);
hold on;
plot(cos(theta), sin(theta), 'k--', 'LineWidth', 1.5);  % 画虚线圆圈

% 添加主箭头
for i = 1:size(coeff,1)
    quiver(0, 0, coeff(i,1), coeff(i,2), 0, 'MaxHeadSize', 0.3, 'Color', 'k', 'LineWidth', 1.5);
end

% 设置图形轴为相等
axis equal;

% 设置图形轴范围
xlim([-1.5, 1.5]);
ylim([-1.5, 1.5]);

% 设置图标题和解释方差比例
title('PCA 双标图 (标准化后的数据，黑色线条)');
xlabel(['PC1 - 解释方差: ', num2str(explained(1), '%.2f'), '%']);
ylabel(['PC2 - 解释方差: ', num2str(explained(2), '%.2f'), '%']);

% 显示网格
grid on;
hold off;
