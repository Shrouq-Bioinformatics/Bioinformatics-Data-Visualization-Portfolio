# 🧬 Advanced NGS Variant Data Visualization Script
# Developed by: Shrouq algarni

library(ggplot2)
library(dplyr)

# 1. Load the detailed genomic variant data
data <- read.csv("ngs_variants_data.csv")

# 2. Advanced Biological Filtering (Quality >= 30 AND Read Depth DP >= 20)
filtered_data <- data %>% 
  filter(Quality >= 30 & Depth_DP >= 20 & Filter == "PASS")

# 3. Create a professional Scatter Plot matching Allele Depth vs Quality
ngs_plot <- ggplot(filtered_data, aes(x = Depth_DP, y = Quality, color = Mutation_Type)) +
  geom_point(size = 4, alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE, color = "gray50", linetype = "dashed") +
  scale_color_manual(values = c("Transition" = "#2a9d8f", "Transversion" = "#e76f51")) +
  labs(
    title = "Genomic Variant Quality vs. Sequencing Depth",
    subtitle = "Strict filtering applied: Q >= 30, DP >= 20 (PASS variants only)",
    x = "Total Read Depth (DP)",
    y = "Phred-Scaled Quality Score",
    color = "Mutation Type"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5, color = "gray30")
  )

# 4. Save high-resolution figure
ggsave("ngs_variant_depth_plot.png", plot = ngs_plot, width = 8, height = 6, dpi = 300)
print("Advanced plot generated successfully!")
