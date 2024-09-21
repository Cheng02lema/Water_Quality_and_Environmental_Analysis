import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# 设置字体为思源黑体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False  # 防止负号显示问题

# 创建一个包含示例数据的DataFrame
data = {
    '时间': ['20夏']*28 + ['21春']*28 + ['22夏']*28,  # 这里添加了 22夏 作为第三组
    'DO(mg/L)': [
        6.13, 6.10, 5.94, 5.88, 5.85, 5.85, 5.95, 5.96, 5.46, 5.43, 5.44, 5.72, 5.81, 5.80, 5.67, 5.76, 5.80, 5.53, 5.63, 5.65, 5.48, 5.64, 5.79, 5.44, 5.51, 5.65, 5.58, 5.45,
        6.52, 6.57, 6.34, 7.24, 7.35, 7.31, 7.12, 7.31, 7.21, 6.76, 6.17, 7.50, 7.63, 7.11, 7.48, 5.73, 6.66, 6.93, 7.21, 7.58, 7.13, 7.30, 7.75, 7.24, 7.83, 7.12, 7.53, 7.27,
        8.56, 8.07, 8.00, 8.27, 7.96, 7.36, 7.19, 7.10, 6.82, 6.88, 6.82, 6.98, 7.09, 7.02, 6.97, 6.77, 6.74, 6.85, 6.85, 6.90, 6.94, 6.91, 6.70, 6.98, 6.96, 7.01, 7.82, 7.93
    ]
}

df = pd.DataFrame(data)

# 设置Seaborn风格
sns.set(style="whitegrid", context="talk", font='SimHei')

# 创建图形对象
plt.figure(figsize=(12, 7))

# 绘制DO的箱型图，并设置样式
ax = sns.boxplot(x="时间", y="DO(mg/L)", data=df, palette="Set2", showmeans=True,
                 meanprops={"marker": "X", "markerfacecolor": "red", "markeredgecolor": "red", "markersize": 10})

# 添加图例
handles = [plt.Line2D([0], [0], color='blue', label='20夏', linewidth=3, linestyle='-'),
           plt.Line2D([0], [0], color='brown', label='21春', linewidth=3, linestyle='-'),
           plt.Line2D([0], [0], color='green', label='22夏', linewidth=3, linestyle='-')]
plt.legend(handles=handles, title='时间', loc='lower center', ncol=3, bbox_to_anchor=(0.5, -0.15), fontsize=12)

# 设置图表标题和标签
plt.title("不同时间的溶解氧 (DO) 含量的箱型图", fontsize=22, fontweight='bold', pad=20)
plt.xlabel("时间", fontsize=16, labelpad=15)
plt.ylabel("溶解氧 (mg/L)", fontsize=16, labelpad=15)

# 调整图形布局以防止重叠
plt.tight_layout()

# 保存为矢量图（SVG格式）
plt.savefig("溶解氧箱型图_带图例.svg", format="svg")

# 展示图表
plt.show()
