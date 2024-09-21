import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm

# 设置字体为思源黑体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False  # 防止负号显示问题

# 读取CSV文件
df = pd.read_csv("底层总表.csv")

# 设置Seaborn风格
sns.set(style="whitegrid", context="talk", font='SimHei')

# 创建图形对象
fig, ax1 = plt.subplots(figsize=(12, 7))

# 绘制平均温度趋势 (左侧Y轴)
color_temp = '#1f77b4'
ax1.set_xlabel("时间", fontsize=14, labelpad=15)
ax1.set_ylabel("平均温度(℃)", color=color_temp, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="温度(℃)", data=df, marker='o', color=color_temp, linewidth=2.5, ax=ax1)
ax1.tick_params(axis='y', labelcolor=color_temp)
ax1.grid(True, linestyle='--', alpha=0.7)  # 添加网格线
ax1.fill_between(df["时间"], df["温度(℃)"], alpha=0.15, color=color_temp)

# 创建共享x轴的右侧Y轴，绘制溶解氧趋势
ax2 = ax1.twinx()
color_do = '#ff7f0e'
ax2.set_ylabel("平均溶解氧(mg/L)", color=color_do, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="DO(mg/L)", data=df, marker='s', color=color_do, linewidth=2.5, ax=ax2)
ax2.tick_params(axis='y', labelcolor=color_do)
ax2.grid(False)  # 右侧Y轴不需要网格线
ax2.fill_between(df["时间"], df["DO(mg/L)"], alpha=0.15, color=color_do)

# 设置图表标题
plt.title("平均温度和平均溶解氧的变化趋势", fontsize=20, fontweight='bold', pad=20)

# 调整x轴标签和刻度
ax1.set_xticklabels(df["时间"], rotation=45, fontsize=12, ha='right')

# 调整图例位置到下方
ax1.legend(["平均温度(℃)"], loc="upper center", bbox_to_anchor=(0.4, -0.2), ncol=2, fontsize=12)
ax2.legend(["平均溶解氧(mg/L)"], loc="upper center", bbox_to_anchor=(0.6, -0.2), ncol=2, fontsize=12)

# 去除多余边框，保持简洁
sns.despine(right=False, left=False)

# 调整图形布局以防止重叠
plt.tight_layout()

# 保存为SVG格式的矢量图
plt.savefig("底层温度和溶解氧.svg", format="svg")

# 也可以保存为PDF格式
# plt.savefig("temperature_do_trend.pdf", format="pdf")

# 展示图表
plt.show()
