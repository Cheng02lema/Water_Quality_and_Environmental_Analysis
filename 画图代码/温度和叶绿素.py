import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler

# 设置字体为思源黑体
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False  # 防止负号显示问题

# 读取CSV文件
df = pd.read_csv("表层总表.csv")

# 初始化归一化器
scaler = MinMaxScaler()

# 选择需要归一化的列
columns_to_normalize = ["温度(℃)", "叶绿素a(mg/m3)"]

# 对温度和叶绿素a列进行归一化处理
df_normalized = df.copy()
df_normalized[columns_to_normalize] = scaler.fit_transform(df[columns_to_normalize])



# 第一张图：原始数据的温度和叶绿素a变化趋势
sns.set(style="whitegrid", context="talk", font='SimHei')

fig, ax1 = plt.subplots(figsize=(12, 7))

# 绘制温度趋势 (左侧Y轴)
color_temp = '#1f77b4'
ax1.set_xlabel("时间", fontsize=14, labelpad=15)
ax1.set_ylabel("温度(℃)", color=color_temp, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="温度(℃)", data=df, marker='o', color=color_temp, linewidth=2.5, ax=ax1)
ax1.tick_params(axis='y', labelcolor=color_temp)
ax1.grid(True, linestyle='--', alpha=0.7)

# 绘制叶绿素a趋势 (右侧Y轴)
ax2 = ax1.twinx()
color_chl_a = '#ff7f0e'
ax2.set_ylabel("叶绿素a(mg/m3)", color=color_chl_a, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="叶绿素a(mg/m3)", data=df, marker='s', color=color_chl_a, linewidth=2.5, ax=ax2)
ax2.tick_params(axis='y', labelcolor=color_chl_a)
ax2.grid(False)

# 设置图表标题
plt.title("温度和叶绿素a的变化趋势（原始数据）", fontsize=20, fontweight='bold', pad=20)

# 调整x轴标签和刻度
ax1.set_xticklabels(df["时间"], rotation=45, fontsize=12, ha='right')

# 调整图例位置到下方
ax1.legend(["温度(℃)"], loc="upper center", bbox_to_anchor=(0.4, -0.2), ncol=2, fontsize=12)
ax2.legend(["叶绿素a(mg/m3)"], loc="upper center", bbox_to_anchor=(0.6, -0.2), ncol=2, fontsize=12)

# 调整图形布局以防止重叠
plt.tight_layout()

# 保存为SVG格式的矢量图
plt.savefig("温度和叶绿素a的变化趋势（原始数据）.svg", format="svg")

# 展示原始数据图表
plt.show()

# 第二张图：归一化处理后的温度和叶绿素a变化趋势
fig, ax1 = plt.subplots(figsize=(12, 7))

# 绘制归一化后的温度趋势 (左侧Y轴)
ax1.set_xlabel("时间", fontsize=14, labelpad=15)
ax1.set_ylabel("温度(℃)", color=color_temp, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="温度(℃)", data=df_normalized, marker='o', color=color_temp, linewidth=2.5, ax=ax1)
ax1.tick_params(axis='y', labelcolor=color_temp)
ax1.grid(True, linestyle='--', alpha=0.7)

# 绘制归一化后的叶绿素a趋势 (右侧Y轴)
ax2 = ax1.twinx()
ax2.set_ylabel("叶绿素a(mg/m3)", color=color_chl_a, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="叶绿素a(mg/m3)", data=df_normalized, marker='s', color=color_chl_a, linewidth=2.5, ax=ax2)
ax2.tick_params(axis='y', labelcolor=color_chl_a)
ax2.grid(False)

# 设置图表标题
plt.title("温度和叶绿素a的变化趋势（归一化处理）", fontsize=20, fontweight='bold', pad=20)

# 调整x轴标签和刻度
ax1.set_xticklabels(df_normalized["时间"], rotation=45, fontsize=12, ha='right')

# 调整图例位置到下方
ax1.legend(["温度(℃)"], loc="upper center", bbox_to_anchor=(0.4, -0.2), ncol=2, fontsize=12)
ax2.legend(["叶绿素a(mg/m3)"], loc="upper center", bbox_to_anchor=(0.6, -0.2), ncol=2, fontsize=12)

# 调整图形布局以防止重叠
plt.tight_layout()

# 保存为SVG格式的矢量图
plt.savefig("温度和叶绿素a的变化趋势（归一化处理）.svg", format="svg")

# 展示归一化数据图表
plt.show()
