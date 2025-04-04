STAGE 2: STATISTICAL ANALYSIS AND DATA VISUALIZATION
This stage involves data manipulation, statistical analysis and data visualization to derive insight from the various data provided. The stage has different task code ranging from 2.1 to 2.7 based on different academic disciplines. 

TASK 2.1: Microbiology
Instructions:
- Look at this [dataset here] (https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/mcgc.tsv).
- This is the [description of the dataset] (https://github.com/HackBio-Internship/2025_project_collection/blob/main/Python/Dataset/mcgc_METADATA.txt) . open in a new tab, not a file to be downloaded
- Plot all the growth curves of OD600 vs Time for the different Strains with the following instructions
- For each strain, plot a growth curve of the the knock out (-) an knock in (+) strain overlaid on top of each other
- Using your function from last stage, determine the time to reach the carrying capacity for each strain/mutant
- Generate a scatter plot of the time it takes to reach carrying capacity for the knock out and the knock in strains
- Generate a box plot of the time it takes to reach carrying capacity for the knock out and the knock in strains
- Is there a statistical difference in the time it takes the knock out strains to reach their maximum carrying capacity compared to the knock in strains
- What do you see? Explain your observations as comments in your code

The code is divided into three parts; plotting growth curves, calculating time to reach carrying capacity and generating statistical plots. the code is about analyzing growth curves of different bacteria strains, specifically wide-type and knock-out type , and comparing their growth characteristics. 

first we loaded the data using the function "read.csv()" with header and tab separated, the extracted the time points from the given data. we extracted the columns for the different strains andd replicates and put them into a list and named the elements inside the list. we used "names()" to assign meaningful manes to each elements in strian_data making it easier to reference them later. Next we created a dataframe "strand_df" with a single column "Time" which contains the timepoints, then add the mean of the technical replicates to the dataframe. we set the plotting environment to adjust the size to make them larger for legibility. we plotted the growth curves for each strain and replicates, WT in red and Knock-out in bluenwith different line types to distinguish them. 

PART II: Dettermining the time to reach 80% of the carrying capacity 
we created a function that retuens the time it takes to reach 80% of the maximum OD which is the carrying capacity. the function is then applied to each strain by loop to calculate the time to reach 80% of the carrying capacity for each strain and print the result. 

PART III: Generating a scatter plot and a boxplot
this section compares WT and KO carrying capacities statistically. A dataframe of "capacity-df" with strain and OD-capacity was created, then subsetted the capacities for WT and KO to perform a t-testanalysis comparing the means of WT and KO. the group means were extracted and used for plotting scatter plot and box plot.
