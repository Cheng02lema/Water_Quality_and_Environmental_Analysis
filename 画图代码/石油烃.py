import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# 设置字体为思源黑体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False  # 防止负号显示问题

# 读取CSV文件
df = pd.read_csv("底层总表.csv")

# 设置Seaborn风格
sns.set(style="whitegrid", context="talk", font='SimHei')

# 创建图形对象
fig, ax = plt.subplots(figsize=(12, 7))

# 绘制石油烃变化趋势
sns.lineplot(x="时间", y="石油烃(μg/L)", data=df, marker='o', color='#4C72B0', linewidth=2.5, ax=ax)

# 填充区域，使用半透明的颜色
ax.fill_between(df["时间"], df["石油烃(μg/L)"], alpha=0.2, color='#4C72B0')

# 仅在数据变化显著的点上添加数据标签，避免视觉干扰
for i in range(0, df.shape[0], 1):  # 每隔一个点标注
    plt.text(df["时间"].iloc[i], df["石油烃(μg/L)"].iloc[i] + 0.01, f'{df["石油烃(μg/L)"].iloc[i]:.3f}',
             color='#4C72B0', ha='center', va='bottom', fontsize=11)

# 去掉顶部和右侧边框，增加简洁感
sns.despine()

# 设置网格线，淡化网格线
ax.grid(True, linestyle='--', alpha=0.5)

# 设置图表标题和标签，使用更大的字体
plt.title("石油烃的变化趋势", fontsize=22, fontweight='bold', pad=20)
plt.xlabel("时间", fontsize=16, labelpad=15)
plt.ylabel("石油烃(μg/L)", fontsize=16, labelpad=15)

# 调整x轴标签旋转角度
plt.xticks(rotation=45, fontsize=12)

# 调整图形布局以防止重叠
plt.tight_layout()

# 保存为矢量图（SVG格式）
plt.savefig("石油烃变化趋势.svg", format="svg")

# 展示图表
plt.show()
