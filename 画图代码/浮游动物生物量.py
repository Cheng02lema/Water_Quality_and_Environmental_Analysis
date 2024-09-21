import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# 设置字体为思源黑体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False  # 防止负号显示问题

# 读取CSV文件
df = pd.read_csv("表层其他数据特殊.csv")

# 设置Seaborn风格
sns.set(style="whitegrid", context="talk", font='SimHei')

# 创建图形对象
fig, ax = plt.subplots(figsize=(12, 7))

# 绘制浮游动物生物量变化趋势
sns.lineplot(x="时间", y="浮游动物生物量（mg/m3）", data=df, marker='o', color='#4C72B0', linewidth=2.5, ax=ax)

# 填充区域，使用半透明的颜色
ax.fill_between(df["时间"], df["浮游动物生物量（mg/m3）"], alpha=0.2, color='#4C72B0')

# 仅在春季和秋季节点添加数据标签
for i in range(df.shape[0]):
    if "春" in df["时间"].iloc[i] or "秋" in df["时间"].iloc[i]:  # 只选择春季和秋季节点
        plt.text(df["时间"].iloc[i], df["浮游动物生物量（mg/m3）"].iloc[i] + 0.01,
                 f'{df["浮游动物生物量（mg/m3）"].iloc[i]:.3f}', color='#4C72B0', ha='center', va='bottom', fontsize=11)

# 去掉顶部和右侧边框，增加简洁感
sns.despine()

# 设置网格线，淡化网格线
ax.grid(True, linestyle='--', alpha=0.5)

# 设置图表标题和标签，使用更大的字体，并使用 LaTeX 格式将 m^3 的 3 变成上标
plt.title("浮游动物生物量的变化趋势", fontsize=22, fontweight='bold', pad=20)
plt.xlabel("时间", fontsize=16, labelpad=15)
plt.ylabel("浮游动物生物量（mg/m$^3$）", fontsize=16, labelpad=15)  # m^3 中的 3 是上标

# 调整x轴标签旋转角度
plt.xticks(rotation=45, fontsize=12)

# 调整图形布局以防止重叠
plt.tight_layout()

# 保存为矢量图（SVG格式）
plt.savefig("浮游动物生物量变化趋势_春秋节点.svg", format="svg")

# 展示图表
plt.show()
