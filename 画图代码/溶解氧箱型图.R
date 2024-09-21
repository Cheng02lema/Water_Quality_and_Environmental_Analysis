library(ggplot2)
library(ggpattern)

# 创建数据
data <- data.frame(
  时间 = rep(c("20夏", "21春", "22夏"), each = 28),  # 确保每个时间段有相同数量的行
  DO_mg_L = c(
    # 20夏数据，共28行
    6.13, 6.10, 5.94, 5.88, 5.85, 5.85, 5.95, 5.96, 5.46, 5.43, 5.44, 5.72, 5.81, 5.80,
    5.67, 5.76, 5.80, 5.53, 5.63, 5.65, 5.48, 5.64, 5.79, 5.44, 5.51, 5.65, 5.58, 5.45,

    # 21春数据，共28行
    6.52, 6.57, 6.34, 7.24, 7.35, 7.31, 7.12, 7.31, 7.21, 6.76, 6.17, 7.50, 7.63, 7.11,
    7.48, 5.73, 6.66, 6.93, 7.21, 7.58, 7.13, 7.30, 7.75, 7.24, 7.83, 7.12, 7.53, 7.27,

    # 22夏数据，共28行
    6.70, 6.63, 6.37, 6.51, 6.25, 6.25, 6.26, 6.77, 6.29, 6.06, 6.47, 6.72, 6.12, 6.26,
    6.35, 5.90, 5.98, 5.92, 5.79, 5.96, 6.14, 6.24, 6.34, 6.45, 6.55, 6.62, 6.68, 6.74
  )
)

# 绘制箱型图，并自定义上下端的线条样式
ggplot(data, aes(x = 时间, y = DO_mg_L, pattern = 时间)) +
  geom_boxplot_pattern(
    aes(fill = 时间),
    pattern_density = 0.05,  # 调整填充密度
    pattern_fill = "white",
    pattern_angle = c(45, 0, 135),  # 角度为斜线、横线、竖线
    pattern_colour = "black",  # 设置填充线条颜色
    outlier.shape = 21, outlier.fill = "red", outlier.size = 2,
    alpha = 0.7,
    lwd = 0.8  # 设置线条的粗细
  ) +
  # 使箱型图的上下两端线条更明显
  geom_segment(aes(x = as.numeric(时间) - 0.2, xend = as.numeric(时间) + 0.2, y = DO_mg_L, yend = DO_mg_L),
               data = data.frame(DO_mg_L = c(5.45, 7.53, 5.65), 时间 = c("20夏", "21春", "22夏")),
               size = 1.2, color = "black") +
  stat_summary(fun = mean, geom = "point", shape = 4, size = 4, color = "black") +  # 用黑色十字表示均值
  labs(title = "不同时间的溶解氧 (DO) 含量箱型图", x = "时间", y = "溶解氧 (mg/L)") +  # 设置标题和轴标签
  scale_fill_manual(values = c("20夏" = "blue", "21春" = "brown", "22夏" = "green")) +  # 自定义填充颜色
  theme_classic() +  # 使用经典主题
  theme(
    plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    legend.position = "bottom",  # 图例位置
    legend.title = element_blank(),
    legend.text = element_text(size = 12),
    panel.grid.major = element_line(color = "gray90"),  # 更加精细的网格线
    panel.grid.minor = element_line(color = "gray95")  # 添加次级网格线
  )
