# 安装必要的库 (如果没有安装，请先运行此行)
# install.packages("scatterplot3d")

# 创建数据框（基于你提供的数据）
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

# 计算协方差矩阵并进行PCA分析
pca_result <- prcomp(data, scale = TRUE)

# 提取载荷 (PC1, PC2, PC3)
loadings <- pca_result$rotation[, 1:3]

# 提取解释方差比例
explained_variance <- summary(pca_result)$importance[2, 1:3]

# 加载 3D 绘图库
library(scatterplot3d)

# 设置图形窗口宽度
par(mfrow=c(1,1))  # 确保单图模式
par(pin=c(10, 7))  # 设置图形窗口大小，宽度为10，高度为7（可以根据需要调整）

# 创建3D图并绘制变量在 PC1、PC2、PC3 空间中的位置
s3d <- scatterplot3d(loadings[,1], loadings[,2], loadings[,3],
                     xlab = paste0("PC1 (", round(explained_variance[1] * 100, 2), "% 方差解释)"),
                     ylab = paste0("PC2 (", round(explained_variance[2] * 100, 2), "% 方差解释)"),
                     zlab = paste0("PC3 (", round(explained_variance[3] * 100, 2), "% 方差解释)"),
                     type = "h", color = "blue", pch = 16, grid = TRUE, box = TRUE)

# 添加变量名称标签
text(s3d$xyz.convert(loadings[,1], loadings[,2], loadings[,3]), labels = rownames(loadings), col = "red", cex = 1.2)

# 投影到 PC1-PC2 平面（z=0）
for (i in 1:nrow(loadings)) {
  s3d$points3d(c(loadings[i,1], loadings[i,1]), c(loadings[i,2], loadings[i,2]), c(loadings[i,3], 0), type = "l", lty = 2, col = "black")
}
