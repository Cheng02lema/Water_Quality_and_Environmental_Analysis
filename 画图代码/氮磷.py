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
columns_to_normalize = ["无机氮(μg/L)", "磷酸盐(μg/L)"]

# 对无机氮和磷酸盐列进行归一化处理
df_normalized = df.copy()
df_normalized[columns_to_normalize] = scaler.fit_transform(df[columns_to_normalize])

# 将"年份"列改为"时间"
df.rename(columns={'年份': '时间'}, inplace=True)
df_normalized.rename(columns={'年份': '时间'}, inplace=True)

# 第一张图：原始数据的无机氮和磷酸盐变化趋势
sns.set(style="whitegrid", context="talk", font='SimHei')

fig, ax1 = plt.subplots(figsize=(12, 7))

# 绘制无机氮趋势 (左侧Y轴)
color_nitrogen = '#1f77b4'
ax1.set_xlabel("时间", fontsize=14, labelpad=15)
ax1.set_ylabel("无机氮(μg/L)", color=color_nitrogen, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="无机氮(μg/L)", data=df, marker='o', color=color_nitrogen, linewidth=2.5, ax=ax1)
ax1.tick_params(axis='y', labelcolor=color_nitrogen)
ax1.grid(True, linestyle='--', alpha=0.7)
ax1.fill_between(df["时间"], df["无机氮(μg/L)"], alpha=0.15, color=color_nitrogen)

# 在无机氮的每个数据点上显示数值，并调整标签位置以避免重叠
for i in range(df.shape[0]):
    y_pos = df["无机氮(μg/L)"].iloc[i] + 3  # 调整标签的Y轴位置
    ax1.text(df["时间"].iloc[i], y_pos, f'{df["无机氮(μg/L)"].iloc[i]:.2f}',
             color=color_nitrogen, ha='center', va='bottom', fontsize=10)

# 绘制磷酸盐趋势 (右侧Y轴)
ax2 = ax1.twinx()
color_phosphate = '#ff7f0e'
ax2.set_ylabel("磷酸盐(μg/L)", color=color_phosphate, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="磷酸盐(μg/L)", data=df, marker='s', color=color_phosphate, linewidth=2.5, ax=ax2)
ax2.tick_params(axis='y', labelcolor=color_phosphate)
ax2.grid(False)
ax2.fill_between(df["时间"], df["磷酸盐(μg/L)"], alpha=0.15, color=color_phosphate)

# 在磷酸盐的每个数据点上显示数值，并调整标签位置以避免重叠
for i in range(df.shape[0]):
    y_pos = df["磷酸盐(μg/L)"].iloc[i] + 1  # 调整标签的Y轴位置
    ax2.text(df["时间"].iloc[i], y_pos, f'{df["磷酸盐(μg/L)"].iloc[i]:.2f}',
             color=color_phosphate, ha='center', va='bottom', fontsize=10)

# 设置图表标题
plt.title("无机氮和磷酸盐的变化趋势（原始数据）", fontsize=20, fontweight='bold', pad=20)

# 调整x轴标签和刻度
ax1.set_xticklabels(df["时间"], rotation=45, fontsize=12, ha='right')

# 调整图例位置到下方
ax1.legend(["无机氮(μg/L)"], loc="upper center", bbox_to_anchor=(0.4, -0.2), ncol=2, fontsize=12)
ax2.legend(["磷酸盐(μg/L)"], loc="upper center", bbox_to_anchor=(0.6, -0.2), ncol=2, fontsize=12)

# 调整图形布局以防止重叠
plt.tight_layout()

# 保存为SVG格式的矢量图
plt.savefig("无机氮和磷酸盐的变化趋势（原始数据）.svg", format="svg")

# 展示原始数据图表
plt.show()

# 第二张图：归一化处理后的无机氮和磷酸盐变化趋势
fig, ax1 = plt.subplots(figsize=(12, 7))

# 绘制归一化后的无机氮趋势 (左侧Y轴)
ax1.set_xlabel("时间", fontsize=14, labelpad=15)
ax1.set_ylabel("无机氮(μg/L)", color=color_nitrogen, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="无机氮(μg/L)", data=df_normalized, marker='o', color=color_nitrogen, linewidth=2.5, ax=ax1)
ax1.tick_params(axis='y', labelcolor=color_nitrogen)
ax1.grid(True, linestyle='--', alpha=0.7)
ax1.fill_between(df_normalized["时间"], df_normalized["无机氮(μg/L)"], alpha=0.15, color=color_nitrogen)

# 在无机氮的每个数据点上显示数值，并调整标签位置以避免重叠
for i in range(df_normalized.shape[0]):
    y_pos = df_normalized["无机氮(μg/L)"].iloc[i] + 0.05  # 调整标签的Y轴位置
    ax1.text(df_normalized["时间"].iloc[i], y_pos, f'{df_normalized["无机氮(μg/L)"].iloc[i]:.2f}',
             color=color_nitrogen, ha='center', va='bottom', fontsize=10)

# 绘制归一化后的磷酸盐趋势 (右侧Y轴)
ax2 = ax1.twinx()
ax2.set_ylabel("磷酸盐(μg/L)", color=color_phosphate, fontsize=14, labelpad=15)
sns.lineplot(x="时间", y="磷酸盐(μg/L)", data=df_normalized, marker='s', color=color_phosphate, linewidth=2.5, ax=ax2)
ax2.tick_params(axis='y', labelcolor=color_phosphate)
ax2.grid(False)
ax2.fill_between(df_normalized["时间"], df_normalized["磷酸盐(μg/L)"], alpha=0.15, color=color_phosphate)

# 在磷酸盐的每个数据点上显示数值，并调整标签位置以避免重叠
for i in range(df_normalized.shape[0]):
    y_pos = df_normalized["磷酸盐(μg/L)"].iloc[i] + 0.05  # 调整标签的Y轴位置
    ax2.text(df_normalized["时间"].iloc[i], y_pos, f'{df_normalized["磷酸盐(μg/L)"].iloc[i]:.2f}',
             color=color_phosphate, ha='center', va='bottom', fontsize=10)

# 设置图表标题
plt.title("无机氮和磷酸盐的变化趋势（归一化处理）", fontsize=20, fontweight='bold', pad=20)

# 调整x轴标签和刻度
ax1.set_xticklabels(df_normalized["时间"], rotation=45, fontsize=12, ha='right')

# 调整图例位置到下方
ax1.legend(["无机氮(μg/L)"], loc="upper center", bbox_to_anchor=(0.4, -0.2), ncol=2, fontsize=12)
ax2.legend(["磷酸盐(μg/L)"], loc="upper center", bbox_to_anchor=(0.6, -0.2), ncol=2, fontsize=12)

# 调整图形布局以防止重叠
plt.tight_layout()

# 保存为SVG格式的矢量图
plt.savefig("无机氮和磷酸盐的变化趋势（归一化处理）.svg", format="svg")

# 展示归一化数据图表
plt.show()
