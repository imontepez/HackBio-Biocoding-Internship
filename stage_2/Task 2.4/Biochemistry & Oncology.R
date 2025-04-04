## Hackbio task 2.4 Biochemistry and oncology
'''
 Proteins structures are known to be strongly connected to their functions. However, at the amino acid level, not all amino acids contribute to structure and function equally. Galardini and colleagues decided to investigate the impact of all possible individual, non synonymous nonsense mutations on the structure and function of protein.
 The functional impact was computed as SIFT scores and the structural impact was calculated as FoldX Score (in kCal/mol).
'''
library(dplyr)
#Import both sift and foldx datasets;

sift_dataset = 'https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/datasets/sift.tsv'

sift_dataset1 = read.table(sift_dataset,header = TRUE)

#head(sift_dataset1)

foldx_dataset = 'https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/datasets/foldX.tsv'

foldx_dataset1 = read.table(foldx_dataset,header = TRUE)

head(foldx_dataset1)

# In both datasets, create a column specific_Protein_aa which will be a cantenation of the Protein and Amino_acid columns such that If you have Protein A5A607 and Amino_acid E63D, you have specific_Protein_aa A5A607_E63D

sift_dataset1$specific_Protein_aa <- paste(sift_dataset1$Protein, sift_dataset1$Amino_Acid, sep = "_")
foldx_dataset1$specific_Protein_aa <- paste(foldx_dataset1$Protein, foldx_dataset1$Amino_Acid, sep = "_")

# Using the specific_Protein_aa column, merge sift and foldx dataset into one final dataframe.
new_mergeddata <- sift_dataset1 %>%
  dplyr::left_join(foldx_dataset1, by = join_by(specific_Protein_aa))

# According to the authors;A SIFT Score below 0.05 is deleterious and A FoldX score greater than 2 kCal/mol is deleterious. Using the criteria above, Find all mutations that have a SIFT score below 0.05 and FoldX Score above 2 (i.e: Mutations that affect both structure and function)
# Filter mutations that meet the deleterious criteria

deleterious_mutations <- subset(new_mergeddata, sift_Score< 0.05 & foldX_Score > 2)

#Print the result
print(deleterious_mutations)

# Study the amino acid substitution nomenclature
# Investigate for the amino acid that has the most functional and structural impact. Hint: Using the amino acid column, find a way to select the first amino acid. Solution here.Generate a frequency table for all the amino acids. Use table() to get the frequency table

# Extract the first amino acid from the Mutation column
deleterious_mutations$AA <- substr(deleterious_mutations$Amino_Acid.x, 1, 1)

# Generate a frequency table for the first amino acids
aa_frequency <- table(deleterious_mutations$AA)

# Print the frequency table
print(aa_frequency)

# Using the amino frequency table above, generate a barplot and pie chart to represent the frequency of the amino acids.
barplot(aa_frequency,col=aa_frequency)

pie(aa_frequency,col=aa_frequency)

'''
 Briefly describe the amino acid with the highest impact on protein structure and function

 Glycine (Gly/G) is the amino acid with the shortest side chain, having an R-group consistent only of a single hydrogen. As a result, glycine is the only amino acid that is not chiral. 
 
 Its small side chain allows it to readily fit into both hydrophobic and hydrophilic environments.This allows for greater flexibility in protein folding and enables it to fit into tight spaces within a protein structure that other amino acids cannot.
 
 What can you say about the structural property and functional property of amino acids with more than 100 occurences.
 
 Amino acids with more than 100 occurrences play crucial structural and functional roles: hydrophobic residues (A, F, I, L, V, W) stabilize protein cores, while flexible residues (G, P) influence loops and turns, and polar/charged residues (D, Q, R, S, T, Y) contribute to enzymatic activity and interactions. Functionally, these amino acids are essential for protein folding, stability, binding interactions, and post-translational modifications, making them critical for both structure and function.
 
'''
