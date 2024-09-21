# 安装必要的包 (如果还没有安装)
# install.packages("factoextra")
# install.packages("plotly")

# 加载必要的库
library(factoextra)
library(plotly)

# 创建数据框
data <- data.frame(
  温度 = c(15.9, 18.2, 12.9, 17.7, 11.6, 15.8),
  DO = c(8.9, 7.19, 5.73, 6.92, 8.01, 6.04),
  pH = c(7.94, 7.92, 8.32, 8.04, 8.01, 8.11),
  COD = c(0.52, 0.6, 0.69, 0.46, 0.41, 0.54),
  石油烃 = c(0.49, 33.02, 0.95, 8.57, 5.07, 4.816),
  无机氮 = c(33.09, 64.4, 56.33, 43, 209.22, 118.76),
  叶绿素a = c(0.98, 0.12, 21.1, 1.76, 1.52, 2.17),
  磷酸盐 = c(7.74, 4, 4.57, 12.95, 2.5, 4.1),
  营养指数EI = c(0.130714286, 0.160714286, 0.162142857, 0.264642857, 0.644642857, 0.264642857),
  浮游动物生物量 = c(162.4535714, 216.3928571, 83.08892857, 19.43464286, 4586.0508, 60.20821429),
  浮游动物多样性 = c(1.763571429, 1.403571429, 1.865, 1.688214286, 0.3375, 0.714285714),
  浮游植物多样性指数 = c(1.578928571, 1.900714286, 1.625, 2.321785714, 2.5075, 0.615714286)
)

# 执行 PCA 分析
pca_result <- prcomp(data, scale = TRUE)

# 提取 PCA 载荷 (前三个主成分)
loadings <- pca_result$rotation[, 1:3]

# 提取解释方差比例
explained_variance <- summary(pca_result)$importance[2, 1:3]

# 手动调整标签位置（添加微小偏移量）
loadings_adjusted <- loadings
loadings_adjusted["营养指数EI", ] <- loadings_adjusted["营养指数EI", ] + c(0.05, 0.05, 0)  # 手动调整

# 使用 Plotly 创建交互式 3D 载荷图
fig <- plot_ly(
  x = loadings_adjusted[,1],
  y = loadings_adjusted[,2],
  z = loadings_adjusted[,3],
  type = 'scatter3d',
  mode = 'markers+text',
  text = rownames(loadings_adjusted), # 变量标签
  marker = list(size = 8, color = 'blue', opacity = 0.7), # 增加标记大小并调整透明度
  textposition = 'top right'  # 标签位置调整
)

# 设置轴标签和解释方差
fig <- fig %>% layout(
  scene = list(
    xaxis = list(title = paste0("PC1 (", round(explained_variance[1] * 100, 2), "% 方差解释)")),
    yaxis = list(title = paste0("PC2 (", round(explained_variance[2] * 100, 2), "% 方差解释)")),
    zaxis = list(title = paste0("PC3 (", round(explained_variance[3] * 100, 2), "% 方差解释)"))
  ),
  title = "PCA 3D 载荷图"
)

# 显示交互式图表
fig
