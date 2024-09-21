import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler

# 设置字体为思源黑体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False  # 防止负号显示问题

# 读取CSV文件
df = pd.read_csv("../csv/表层总表.csv")

# 初始化归一化器
scaler = MinMaxScaler()

# 选择需要归一化的列
columns_to_normalize = ["温度(℃)", "DO(mg/L)"]

# 对数据进行归一化处理
df_normalized = df.copy()
df_normalized[columns_to_normalize] = scaler.fit_transform(df[columns_to_normalize])

# 设置Seaborn风格
sns.set(style="whitegrid", context="talk", font='SimHei')

# 创建图形对象
fig, ax1 = plt.subplots(figsize=(12, 7))

# 绘制归一化后的温度趋势 (左侧Y轴)
color_temp = '#1f77b4'
ax1.set_xlabel("时间", fontsize=14, labelpad=15)
ax1.set_ylabel("温度(℃)", color=color_temp, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="温度(℃)", data=df_normalized, marker='o', color=color_temp, linewidth=2.5, ax=ax1)
ax1.tick_params(axis='y', labelcolor=color_temp)
ax1.grid(True, linestyle='--', alpha=0.7)
ax1.fill_between(df_normalized["时间"], df_normalized["温度(℃)"], alpha=0.15, color=color_temp)

# 创建共享x轴的右侧Y轴，绘制归一化后的溶解氧趋势
ax2 = ax1.twinx()
color_do = '#ff7f0e'
ax2.set_ylabel("DO(mg/L)", color=color_do, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="DO(mg/L)", data=df_normalized, marker='s', color=color_do, linewidth=2.5, ax=ax2)
ax2.tick_params(axis='y', labelcolor=color_do)
ax2.grid(False)
ax2.fill_between(df_normalized["时间"], df_normalized["DO(mg/L)"], alpha=0.15, color=color_do)

# 设置图表标题
plt.title("温度和溶解氧的变化趋势（归一化处理）", fontsize=20, fontweight='bold', pad=20)

# 调整x轴标签和刻度
ax1.set_xticklabels(df_normalized["时间"], rotation=45, fontsize=12, ha='right')

# 调整图例位置到下方
ax1.legend(["温度(℃)"], loc="upper center", bbox_to_anchor=(0.4, -0.2), ncol=2, fontsize=12)
ax2.legend(["DO(mg/L)"], loc="upper center", bbox_to_anchor=(0.6, -0.2), ncol=2, fontsize=12)

# 去除多余边框
sns.despine(right=False, left=False)

# 调整图形布局以防止重叠
plt.tight_layout()

# 保存为SVG格式的矢量图
plt.savefig("表层归一化温度和溶解氧.svg", format="svg")

# 展示图表
plt.show()
