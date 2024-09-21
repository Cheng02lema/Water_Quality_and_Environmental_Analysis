import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# 设置字体为思源黑体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False  # 防止负号显示问题

# 读取CSV文件
df = pd.read_csv("../csv/min.csv")

# 设置Seaborn风格
sns.set(style="whitegrid", context="talk", font='SimHei')

# 创建图形对象
fig, ax = plt.subplots(figsize=(12, 7))

# 绘制溶解氧（DO）柱状图
sns.barplot(x="时间", y="DO(mg/L)", data=df, palette="Blues_d", ax=ax)

# 为每个柱子添加数据标签
for i in range(df.shape[0]):
    plt.text(i, df["DO(mg/L)"].iloc[i] + 0.1, f'{df["DO(mg/L)"].iloc[i]:.2f}',
             color='black', ha='center', va='bottom', fontsize=12)

# 设置图表标题和标签
plt.title("各个时间点的最小溶解氧含量 (DO)", fontsize=22, fontweight='bold', pad=20)
plt.xlabel("时间", fontsize=16, labelpad=15)
plt.ylabel("溶解氧 (mg/L)", fontsize=16, labelpad=15)

# 调整图形布局以防止重叠
plt.tight_layout()

# 保存为矢量图（SVG格式）
plt.savefig("溶解氧含量_柱状图.svg", format="svg")

# 展示图表
plt.show()
