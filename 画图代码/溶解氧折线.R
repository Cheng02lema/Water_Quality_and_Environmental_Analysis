# 加载必要的包
library(showtext)
library(ggplot2)
library(reshape2)

# 添加中文字体支持
font_add(family = "SimHei", regular = "SimHei.ttf")
showtext_auto()

# 准备数据
data <- data.frame(
  时间 = c("19冬", "20春", "20夏", "20秋", "20冬", "21春", "21夏", "21秋", "22春", "22夏", "22秋", "22冬"),
  站点16溶解氧 = c(9.07, 9.04, 5.76, 7.65, 8.66, 5.73, 6.77, 7.23, 8.22, 6.04, 6.68, 7.19),
  平均溶解氧 = c(9.057857143, 9.035714286, 5.710714286, 7.528214286, 8.792857143, 7.103571429, 7.230357143, 7.281785714, 8.378214286, 6.19, 6.3675, 7.364285714)
)

# 转换为长格式
data_melt <- melt(data, id = "时间")

# 绘制图表
ggplot(data_melt, aes(x = 时间, y = value, color = variable, group = variable)) +
  geom_line(aes(linetype = variable), size = 1.5) +  # 线条样式和粗细
  scale_color_manual(values = c("#1f77b4", "#ff7f0e")) +  # 自定义颜色
  scale_linetype_manual(values = c("solid", "dashed")) +  # 实线和虚线
  labs(title = "站点16与平均溶解氧的变化趋势",
       x = "时间",
       y = "溶解氧 (mg/L)",
       color = "溶解氧类型",
       linetype = "溶解氧类型") +
  theme_minimal(base_size = 15, base_family = "SimHei") +  # 使用思源黑体
  theme(
    plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12, colour = "gray40"),
    axis.text.y = element_text(size = 12, colour = "gray40"),
    legend.position = "top",
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 12),
    legend.key.width = unit(3, "cm"),  # 图例宽度
    axis.title.x = element_text(size = 14, colour = "gray30"),
    axis.title.y = element_text(size = 14, colour = "gray30"),
    panel.grid = element_blank(),  # 去除网格线
    axis.line = element_line(colour = "gray40", size = 1.2),  # 精致的轴线
    axis.ticks = element_line(colour = "gray40", size = 1),  # 刻度线颜色和长度
    axis.ticks.length = unit(-0.3, "cm"),  # 刻度线向内显示，负值表示朝内
    axis.line.x.bottom = element_line(color = "gray40", size = 0.8),  # x 轴的颜色
    axis.line.y.left = element_line(color = "gray40", size = 0.8)  # y 轴的颜色
  ) +
  scale_x_discrete(breaks = data$时间) +  # 设置x轴刻度
  scale_y_continuous(labels = scales::number_format(accuracy = 0.01)) +  # y轴刻度精度
  guides(linetype = guide_legend(override.aes = list(size = 2)))  # 调整图例虚线显示

# 保存为 SVG 文件
