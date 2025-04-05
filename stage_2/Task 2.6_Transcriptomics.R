# Hackbio task 2.6 Transcriptomics
#githublink: https://github.com/imontepez/HackBio-Biocoding-Internship/tree/main/stage_2
#Threonine team_2:
#Terry_ngala: https://github.com/Terryida
#Tyler: https://github.com/tylermaire
#Perex: https://github.com/imontepez
#Gracious: https://github.com/Graciousisoah
#Mahpara: https://github.com/mahpara97

'''
 This is a processed RNAseq dataset involving reading in quantitated gene expression data from an RNA-seq experiment, exploring the data using base R functions and then interpretation. 
 The dataset contains an experiment between a diseased cell line and diseased cell lines treated with compound X.
 The difference in expression change between the two health status is computed as Fold change to log 2 (Log2FC) and the significance of each is computed in p-value.
 '''

#Load the datasets
Assignment <- 'https://gist.githubusercontent.com/stephenturner/806e31fce55a8b7175af/raw/1a507c4c3f9f1baaa3a69187223ff3d3050628d4/results.txt'
Assignment1 <- read.table(Assignment,header = TRUE)
head(Assignment1)

# Load the libraries
library(ggplot2)
library(dplyr)

# # Generate a volcano plot.
ggplot(Assignment1, aes(x = log2FoldChange, y = -log10(pvalue)
)) +
  geom_vline(xintercept = c(-0.6, 0.6), col = "orange", linetype = 'dashed') +
  geom_hline(yintercept = -log10(0.05), col = "blue", linetype = 'dashed') +
  geom_point(size = 2) +
  labs(title = "Volcano Plot", x = "Expression", y = "P-Value") +
  theme_set(theme_classic(base_size = 20) +
              theme(
                axis.title.y = element_text(face = "bold", margin = margin(0,20,0,0), size = rel(1.1), color = 'green'),
                axis.title.x = element_text(hjust = 0.5, face = "bold", margin = margin(20,0,0,0), size = rel(1.1), color = 'brown'),
                plot.title = element_text(hjust = 0.5)
              ))


# Add a column to the data frame to specify if they are UP- or DOWN- regulated (log2fc respectively positive or negative)
Assignment1$diffexpressed <- "NA"

# Determine the upregulated genes (Genes with Log2FC > 1 and pvalue < 0.01)
Assignment1$diffexpressed[Assignment1$log2FoldChange > 1 & Assignment1$pvalue < 0.01] <- "UP"

# Determine the downregulated genes (Genes with Log2FC < -1 and pvalue < 0.01)
Assignment1$diffexpressed[Assignment1$log2FoldChange < -1 & Assignment1$pvalue < 0.01] <- "DOWN"

# What are the functions of the top 5 upregulated genes (Use genecards)
head(Assignment1[order(Assignment1$pvalue) & Assignment1$diffexpressed == 'UP', ])

'''
 1. EMILIN2 (Elastin Microfibril Interfacer 2): is an extracellular matrix protein that plays a crucial role in anchoring smooth muscle cells to elastic fibers, contributing to the formation and assembly of blood vessels.
 2. POU3F4 (POU Class 3 Homeobox 4):is a transcription factor involved in the development of the inner ear and certain neural tissues. Mutations in this gene are associated with X-linked nonsyndromic hearing loss.
 3. LOC285954:refers to a long non-coding RNA (lncRNA) whose specific function is not well-characterized. However, some studies suggest it may play a role in tumor suppression and regulation of cell proliferation.
 4. VEPH1 (Ventricular Zone Expressed PH Domain-Containing 1):is believed to be involved in neurodevelopment, particularly in the formation of the ventricular zone during brain development.
 5. DTHD1 (Death Domain-Containing 1):contains a death domain, suggesting a role in apoptotic processes.
'''

# What are the functions of the top 5 downregulated genes.
head(Assignment1[order(Assignment1$pvalue) & Assignment1$diffexpressed == 'DOWN', ])

'''
 1. TBX5 (T-box transcription factor 5): is a transcription factor crucial for the development of the heart and upper limbs during embryonic growth.
 2. IFITM1 (Interferon-Induced Transmembrane Protein 1): is part of the interferon-induced transmembrane protein family and plays a role in the immune response against viral infections.
 3. LAMA2 (Laminin Subunit Alpha 2):encodes the alpha-2 chain of laminin, a protein essential for the structural scaffolding of basement membranes in various tissues.
 4. CAV2 (Caveolin 2): encodes caveolin-2, a protein integral to the formation of caveolae—small invaginations on the cell membrane involved in various cellular processes, including signal transduction, lipid regulation, and endocytosis.
 5. TNN (Tenascin N):encodes tenascin-N, an extracellular matrix glycoprotein involved in tissue development and repair. It plays a role in cell adhesion, migration, and proliferation, particularly within the nervous system and during wound healing.
'''
