# 🧬 Advanced NGS Variant Data Visualization Script
# Developed by: Shrouq algarni

library(ggplot2)
library(dplyr)

# 1. Load the detailed genomic variant data
data <- read.csv("ngs_variants_data.csv")

# 2. Filter variants based on scientific quality standards
filtered_data <- data %>% filter(Quality >= 30 & Filter == "PASS")

# 3. Create a professional Density Plot for Quality Scores
ngs_density_plot <- ggplot(filtered_data, aes(x = Quality, fill = Mutation_Type, color = Mutation_Type)) +
  geom_density(alpha = 0.4, size = 1) +
  scale_fill_manual(values = c("Transition" = "#2a9d8f", "Transversion" = "#e76f51")) +
  scale_color_manual(values = c("Transition" = "#1d7066", "Transversion" = "#b54f36")) +
  labs(
    title = "Genomic Variant Quality Score Distribution (Density Plot)",
    subtitle = "Comparing Phred-Scaled Quality Distributions for PASS Variants",
    x = "Phred-Scaled Quality Score",
    y = "Density",
    fill = "Mutation Type",
    color = "Mutation Type"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5, color = "gray30"),
    legend.position = "top"
  )

# 4. Save the high-resolution density figure
ggsave("ngs_variant_density_plot.png", plot = ngs_density_plot, width = 8, height = 6, dpi = 300)
print("Advanced Density Plot generated successfully as 'ngs_variant_density_plot.png'!")
