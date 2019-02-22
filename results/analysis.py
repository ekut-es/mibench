## @brief Result Analysis for MiBench
#  @author Konstantin Lübeck (Embedded Systems, University of Tübingen)

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import cm

# read runtime.xlsx
runtime_xlsx = pd.ExcelFile('runtime.xlsx')

# read runtime.xlsx sheets
i7_7700k = pd.read_excel(runtime_xlsx, runtime_xlsx.sheet_names[0])
i5_6500 = pd.read_excel(runtime_xlsx, runtime_xlsx.sheet_names[1])
ryzen7_2700x = pd.read_excel(runtime_xlsx, runtime_xlsx.sheet_names[2])
arm_cortex_a9 = pd.read_excel(runtime_xlsx, runtime_xlsx.sheet_names[3])

# names of columns which will be selected for analysis
time_real_col_names = ['time_real_0', 'time_real_1', 'time_real_2']
time_user_col_names = ['time_user_0', 'time_user_1', 'time_user_2']
time_system_col_names = ['time_system_0', 'time_system_1', 'time_system_2']

# calculate means for real, user, and system time. for i7-7700K
# diff = real - user - system 
i7_7700k_mean_time_real = i7_7700k.loc[:,time_real_col_names].mean(axis=1)
i7_7700k_mean_time_user = i7_7700k.loc[:,time_user_col_names].mean(axis=1)
i7_7700k_mean_time_system = i7_7700k.loc[:,time_system_col_names].mean(axis=1)
i7_7700k_mean_time_diff = i7_7700k_mean_time_real - i7_7700k_mean_time_user - i7_7700k_mean_time_system

# calculate standard deviation for real, user, and system time. for i7-7700K
i7_7700k_std_time_real = i7_7700k.loc[:,time_real_col_names].std(axis=1)
i7_7700k_std_time_user = i7_7700k.loc[:,time_user_col_names].std(axis=1)
i7_7700k_std_time_system = i7_7700k.loc[:,time_system_col_names].std(axis=1)


# calculate means for real, user, and system time. for i5-6500
# diff = real - user - system 
i5_6500_mean_time_real = i5_6500.loc[:,time_real_col_names].mean(axis=1)
i5_6500_mean_time_user = i5_6500.loc[:,time_user_col_names].mean(axis=1)
i5_6500_mean_time_system = i5_6500.loc[:,time_system_col_names].mean(axis=1)
i5_6500_mean_time_diff = i5_6500_mean_time_real - i5_6500_mean_time_user - i5_6500_mean_time_system

# calculate standard deviation for real, user, and system time. for i5-6500
i5_6500_std_time_real = i5_6500.loc[:,time_real_col_names].std(axis=1)
i5_6500_std_time_user = i5_6500.loc[:,time_user_col_names].std(axis=1)
i5_6500_std_time_system = i5_6500.loc[:,time_system_col_names].std(axis=1)


# calculate means for real, user, and system time. for Ryzen 7 2700X
# diff = real - user - system 
ryzen7_2700x_mean_time_real = ryzen7_2700x.loc[:,time_real_col_names].mean(axis=1)
ryzen7_2700x_mean_time_user = ryzen7_2700x.loc[:,time_user_col_names].mean(axis=1)
ryzen7_2700x_mean_time_system = ryzen7_2700x.loc[:,time_system_col_names].mean(axis=1)
ryzen7_2700x_mean_time_diff = ryzen7_2700x_mean_time_real - ryzen7_2700x_mean_time_user - ryzen7_2700x_mean_time_system

# calculate standard deviation for real, user, and system time. for Ryzen 7 2700X
ryzen7_2700x_std_time_real = ryzen7_2700x.loc[:,time_real_col_names].std(axis=1)
ryzen7_2700x_std_time_user = ryzen7_2700x.loc[:,time_user_col_names].std(axis=1)
ryzen7_2700x_std_time_system = ryzen7_2700x.loc[:,time_system_col_names].std(axis=1)


# calculate means for real, user, and system time. for ARM Cortex-A9
# diff = real - user - system 
arm_cortex_a9_mean_time_real = arm_cortex_a9.loc[:,time_real_col_names].mean(axis=1)
arm_cortex_a9_mean_time_user = arm_cortex_a9.loc[:,time_user_col_names].mean(axis=1)
arm_cortex_a9_mean_time_system = arm_cortex_a9.loc[:,time_system_col_names].mean(axis=1)
arm_cortex_a9_mean_time_diff = arm_cortex_a9_mean_time_real - arm_cortex_a9_mean_time_user - arm_cortex_a9_mean_time_system

# calculate standard deviation for real, user, and system time. for ARM Cortex-A9
arm_cortex_a9_std_time_real = arm_cortex_a9.loc[:,time_real_col_names].std(axis=1)
arm_cortex_a9_std_time_user = arm_cortex_a9.loc[:,time_user_col_names].std(axis=1)
arm_cortex_a9_std_time_system = arm_cortex_a9.loc[:,time_system_col_names].std(axis=1)

# get names of benchmarks from runtime.xlsx for plot
benchmark_labels = i7_7700k.loc[:,'benchmark']

# get colors for plot
color_map = cm.get_cmap('Set3')
colors = color_map(np.linspace(0, 1, 12))
mean_system_time_color = colors[0] 
mean_user_time_color = colors[1] 
mean_diff_time_color = colors[2] 

# calculate position of bars
bar_width = 2.0
bar_distance = 0

x0 = np.arange(len(i7_7700k_mean_time_real))*10
x1 = [x + (bar_width + bar_distance) for x in x0]
x2 = [x + (bar_width + bar_distance) for x in x1]
x3 = [x + (bar_width + bar_distance) for x in x2]

fig, ax = plt.subplots()

i7_7700k_mean_time_system_plt = plt.barh(x3, i7_7700k_mean_time_system, bar_width, color = mean_system_time_color, edgecolor = 'black')
i7_7700k_mean_time_user_plt = plt.barh(x3, i7_7700k_mean_time_user, bar_width, left = i7_7700k_mean_time_system, color = mean_user_time_color, edgecolor = 'black')
i7_7700k_mean_time_diff_plt = plt.barh(x3, i7_7700k_mean_time_diff, bar_width, left = (i7_7700k_mean_time_system + i7_7700k_mean_time_user), capsize= 3, xerr = i7_7700k_std_time_real, color = mean_diff_time_color, edgecolor = 'black')


ryzen7_2700x_mean_time_system_plt = plt.barh(x2, ryzen7_2700x_mean_time_system, bar_width, color = mean_system_time_color, edgecolor = 'black')
ryzen7_2700x_mean_time_user_plt = plt.barh(x2, ryzen7_2700x_mean_time_user, bar_width, left = ryzen7_2700x_mean_time_system, color = mean_user_time_color, edgecolor = 'black')
ryzen7_2700x_mean_time_diff_plt = plt.barh(x2, ryzen7_2700x_mean_time_diff, bar_width, left = (ryzen7_2700x_mean_time_system + ryzen7_2700x_mean_time_user), capsize= 3, xerr = ryzen7_2700x_std_time_real, color = mean_diff_time_color, edgecolor = 'black')


i5_6500_mean_time_system_plt = plt.barh(x1, i5_6500_mean_time_system, bar_width, color = mean_system_time_color, edgecolor = 'black')
i5_6500_mean_time_user_plt = plt.barh(x1, i5_6500_mean_time_user, bar_width, left = i5_6500_mean_time_system, color = mean_user_time_color, edgecolor = 'black')
i5_6500_mean_time_diff_plt = plt.barh(x1, i5_6500_mean_time_diff, bar_width, left = (i5_6500_mean_time_system + i5_6500_mean_time_user), capsize= 3, xerr = i5_6500_std_time_real, color = mean_diff_time_color, edgecolor = 'black')


#arm_cortex_a9_mean_time_system_plt = plt.barh(x0, arm_cortex_a9_mean_time_system, bar_width, color = mean_system_time_color, edgecolor = 'black')
#arm_cortex_a9_mean_time_user_plt = plt.barh(x0, arm_cortex_a9_mean_time_user, bar_width, left = arm_cortex_a9_mean_time_system, color = mean_user_time_color, edgecolor = 'black')
#arm_cortex_a9_mean_time_diff_plt = plt.barh(x0, arm_cortex_a9_mean_time_diff, bar_width, left = (arm_cortex_a9_mean_time_system + arm_cortex_a9_mean_time_user), capsize= 3, xerr = arm_cortex_a9_std_time_real, color = mean_diff_time_color, edgecolor = 'black')

plt.text(7.5, bar_width*6-1, "Intel i7-7700K")
plt.text(7.5, bar_width*3-1, "AMD Ryzen 7 2700X")
plt.text(7.5, 0-1, "Intel i5-6500")

#plt.arrow(7.4, bar_width*6+1, -2, -2)
#plt.arrow(7.4, bar_width*3+1, -2, -2)
#plt.arrow(7.4, 0+1, -2, -2)

ax.annotate("", xy=(4.8, bar_width*3+1), xytext=(7.4, bar_width*6), arrowprops=dict(arrowstyle="->"))
ax.annotate("", xy=(4.8, bar_width*2), xytext=(7.4, bar_width*3), arrowprops=dict(arrowstyle="->"))
ax.annotate("", xy=(4.8, bar_width), xytext=(7.4, 0), arrowprops=dict(arrowstyle="->"))

ax.set_xlabel('Runtime [s]')
ax.set_title('MiBench Runtimes')
ax.set_yticks(x0+2*bar_width)
ax.set_yticklabels(benchmark_labels);

fig.set_size_inches(8,10)
fig.tight_layout()

plt.savefig(fname = 'runtime_plot.png', format = 'png')
#plt.show()
