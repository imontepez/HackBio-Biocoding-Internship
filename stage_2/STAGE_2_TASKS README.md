# **STAGE 2: STATISTICAL ANALYSIS AND DATA VISUALIZATION**
This stage involves data manipulation, statistical analysis and data visualization to derive insight from the various data provided. The stage has different task code ranging from 2.1 to 2.7 based on different academic disciplines. 

_TASK 2.1: Microbiology_
_Instructions_ ⬇️
- Look at this [dataset here](https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/mcgc.tsv).
- This is the [description of the dataset](https://github.com/HackBio-Internship/2025_project_collection/blob/main/Python/Dataset/mcgc_METADATA.txt) . open in a new tab, not a file to be downloaded
- Plot all the growth curves of OD600 vs Time for the different Strains with the following instructions
- For each strain, plot a growth curve of the the knock out (-) an knock in (+) strain overlaid on top of each other
- Using your function from last stage, determine the time to reach the carrying capacity for each strain/mutant
- Generate a scatter plot of the time it takes to reach carrying capacity for the knock out and the knock in strains
- Generate a box plot of the time it takes to reach carrying capacity for the knock out and the knock in strains
- Is there a statistical difference in the time it takes the knock out strains to reach their maximum carrying capacity compared to the knock in strains
- What do you see? Explain your observations as comments in your code

  ---

The code is divided into three parts; plotting growth curves, calculating time to reach carrying capacity and generating statistical plots. The code is about analyzing growth curves of different bacteria strains, specifically wide-type and knock-out type , and comparing their growth characteristics. 

## PART I: Plotting Growth Curves for the Different Strains and Replicaes
first we loaded the data using the function "read.csv()" with header and tab separated, then extracted the time points from the given data. we extracted the columns for the different strains and replicates then put them into a list and named the elements inside the list. we used "names()" to assign meaningful manes to each elements in strian_data making it easier to reference them later. Next we created a dataframe "strand_df" with a single column "Time" which contains the timepoints, then add the mean of the technical replicates across each rows to the dataframe. we set the plotting environment to adjust the size to make them larger for legibility. we plotted the growth curves for each strain and replicates, WT in red and Knock-out in blue with different line types to distinguish them. 

---

### PART II: Dettermining the Time to reach 80% of the Carrying Capacity 
we created a function that retuens the time it takes to reach 80% of the maximum OD which is the carrying capacity. the function is then applied to each strain by loop to calculate the time to reach 80% of the carrying capacity for each strain and print the result. 

---

#### PART III: Generating a Scatter Plot and a Boxplot
this section compares WT and KO carrying capacities statistically. A dataframe of "capacity-df" with strain and OD-capacity was created, then subsetted the capacities for WT and KO to perform a t-testanalysis comparing the means of WT and KO. the group means were extracted and used for plotting scatter plot and box plot.

---

##### TASK 2.4: Biochemistry & Oncology

***INSTRUCTIONS***

Proteins structures are known to be strongly connected to their functions. However, at the amino acid level, not all amino acids contribute to structure and function equally. [Galardini and colleagues](https://elifesciences.org/articles/31035#abstract) decided to investigate the impact of all possible individual, non synonymous nonsense mutations on the structure and function of protein.
The functional impact was computed as SIFT scores and the structural impact was calculated as FoldX Score (in kCal/mol).
Dataset Here:
- [SIFT Dataset](https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/datasets/sift.tsv)
- [FoldX Dataset](https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/datasets/foldX.tsv)

***Task***
- Import both sift and foldx datasets; in both datasets, create a column specific_Protein_aa which will be a cantenation of the Protein and Amino_acid columns such that If you have Protein A5A607 and Amino_acid E63D, you have specific_Protein_aa A5A607_E63D
- Using the specific_Protein_aa column, merge sift and foldx dataset into one final dataframe.
- According to the authors;
A SIFT Score below 0.05 is deleterious
A FoldX score greater than 2 kCal/mol is deleterious
- Using the criteria above, Find all mutations that have a SIFT score below 0.05 and FoldX Score above 2 (i.e: Mutations that affect both structure and function)
- Study the [amino acid substitution nomenclature](https://atlasgeneticsoncology.org/teaching/30067/nomenclature-for-the-description-of-mutations-and-other-sequence-variations)
- Investigate for the amino acid that has the most functional and structural impact
**Hint:** Using the amino acid column, find a way to select the first amino acid. [Solution here](https://reactgo.com/r-get-first-character-string/)
Generate a frequency table for all the amino acids
- Using the amino frequency table above, generate a barplot and pie chart to represent the frequency of the amino acids.
- Briefly describe the amino acid with the highest impact on protein structure and function
- What can you say about the structural property and functional property of amino acids with more than 100 occurences.
----
###### TASK 2.6: Transcriptomics

***INSTRUCTION***

This is a processed RNAseq dataset involving reading in quantitated gene expression data from an RNA-seq experiment, exploring the data using base R functions and then interpretation. The dataset contains an experiment between a diseased cell line and diseased cell lines treated with compound X. The difference in expression change between the two health status is computed as Fold change to log 2 (Log2FC) and the significance of each is computed in p-value.
[Access Dataset Here](https://gist.githubusercontent.com/stephenturner/806e31fce55a8b7175af/raw/1a507c4c3f9f1baaa3a69187223ff3d3050628d4/results.txt)

***Task:***
- Generate a volcano plot. (Hint search for volcano plot online)
- Determine the upregulated genes (Genes with Log2FC > 1 and pvalue < 0.01)
- Determine the downregulated genes (Genes with Log2FC < -1 and pvalue < 0.01)
- What are the functions of the top 5 upregulated genes and top 5 downregulated genes. (Use genecards)
