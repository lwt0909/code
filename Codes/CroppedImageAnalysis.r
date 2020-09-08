# Load data to analyze
library(pacman) # package manager

# Install and load essential packages for analysis
p_load("imager")

# Load data
Test_img <- load.image("../Data/Panoptic-results/cropped/Sample_1_cropped.png")
Test_img[100,200,]
