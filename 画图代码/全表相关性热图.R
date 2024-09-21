
# 加载包
library(corrplot)
library(showtext)
showtext.auto(enable = TRUE)
# 使用系统默认的中文字体（你可以根据自己的系统调整）
font_add("myfont", "simhei.ttf") # simhei.ttf是黑体字体的路径（可替换为你电脑中的字体）
par(family = "myfont") # 设置中文字体

# 读取CSV文件（确保CSV文件路径正确）
data <- read.csv("全总表热图.csv", header = TRUE)

# 查看数据结构
str(data)

# 选择数值列（假设这些列应该是数值列，依据你的数据结构）
numeric_data <- data[c("温度", "盐度", "DO", "pH", "COD", "石油烃", "无机氮", "磷酸盐")]

# 使用 gsub 函数将所有不是数字的字符替换为 NA
numeric_data[] <- lapply(numeric_data, function(x) as.numeric(gsub("[^0-9.-]", NA, x)))

# 检查清理后的数据
str(numeric_data)

# 计算相关性矩阵
correlation_matrix <- cor(numeric_data, use = "complete.obs")

# 绘制相关性热图
library(corrplot)
corrplot(correlation_matrix, method = "circle", type = "full", tl.col = "black", tl.srt = 45,
         addCoef.col = "black",
         col = colorRampPalette(c("blue", "white", "red"))(200),
         number.cex = 0.8,
         mar = c(0, 0, 1, 0),
         title = "环境参数相关性热图")

