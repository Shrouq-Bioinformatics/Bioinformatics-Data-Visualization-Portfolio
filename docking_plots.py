# 💊 Molecular Docking Data Visualization Script
# Developed by: Shrouq Algarni

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# 1. Load the molecular docking dataset
df = pd.read_csv("docking_results.csv")

# 2. Filter for top lead compounds with high affinity (Binding Affinity <= -7.5 kcal/mol)
top_leads = df[df['Binding_Affinity_kcal_mol'] <= -7.5].sort_values(by='Binding_Affinity_kcal_mol')

# 3. Set up the professional plotting environment
plt.figure(figsize=(10, 6))
sns.set_theme(style="whitegrid")

# 4. Create a specialized bar plot for top drug candidates
docking_plot = sns.barplot(
    x='Binding_Affinity_kcal_mol', 
    y='Ligand_ID', 
    data=top_leads, 
    palette='viridis',
    hue='Ligand_ID',
    legend=False
)

# 5. Customize labels and titles for academic publication
plt.title('Top Drug Leads Based on Molecular Docking Screening', fontsize=14, fontweight='bold', pad=15)
plt.xlabel('Binding Affinity (kcal/mol) - Lower is Better', fontsize=12, labelpad=10)
plt.ylabel('Ligand Identifier', fontsize=12)

# Add value labels on the bars for clarity
for index, value in enumerate(top_leads['Binding_Affinity_kcal_mol']):
    plt.text(value + 0.1, index, f" {value} kcal/mol", va='center', fontsize=10, fontweight='bold')

plt.tight_layout()

# 6. Save the high-resolution figure for thesis or paper
plt.savefig("top_docking_leads_plot.png", dpi=300)
print("Molecular docking visualization generated and saved successfully as 'top_docking_leads_plot.png'!")
