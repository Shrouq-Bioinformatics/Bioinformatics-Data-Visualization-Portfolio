# 💊 Molecular Docking Data Visualization Script
# Developed by: Shrouq Algarni

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# 1. Load the molecular docking dataset
df = pd.read_csv("docking_results.csv")

# 2. Set up the professional plotting environment
plt.figure(figsize=(9, 5))
sns.set_theme(style="whitegrid")

# 3. Create a professional Histogram with a Density Curve (KDE)
docking_hist = sns.histplot(
    data=df, 
    x='Binding_Affinity_kcal_mol', 
    kde=True, 
    color='#4a90e2', 
    bins=6,
    edgecolor='black'
)

# 4. Add a scientific threshold line for top leads (e.g., <= -7.0 kcal/mol)
plt.axvline(x=-7.0, color='#e76f51', linetype='--', linewidth=2, label='High Affinity Threshold (-7.0 kcal/mol)')

# 5. Customize labels and titles for academic publication
plt.title('Distribution of Binding Affinities Across Screened Ligands', fontsize=14, fontweight='bold', pad=15)
plt.xlabel('Binding Affinity (kcal/mol) - Lower is Better', fontsize=12, labelpad=10)
plt.ylabel('Frequency (Number of Compounds)', fontsize=12)
plt.legend(loc='upper left')

plt.tight_layout()

# 6. Save the high-resolution histogram figure
plt.savefig("docking_affinity_histogram.png", dpi=300)
print("Advanced Docking Histogram generated successfully as 'docking_affinity_histogram.png'!")
