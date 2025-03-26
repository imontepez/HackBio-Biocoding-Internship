# **HackBio biocoding internship stage_1 task:** ***FUNCTION GALORE!***

This stage task involves writing four different functions in R for specific purposes. 

## ***INSTRUCTIONS:***   

- Write a function for translating DNA to protein
- Write a function that simulates and generates a logistic population growth curve. Your function should include 2 extra parameters that randomize the length of the lag-phase and the exponential phase.  Most living populations follow a logistic population growth. Therefore, your growth curve can be: Population Size vs Time, Cell density vs Time, OD vs Time, CFU vs Time, etc.
- Using your function, generate a dataframe with 100 different growth curves.
- Write a function for determining the time to reach 80% of the maximum growth; usually the carrying capacity.
- Finally, write a function for calculating the hamming distance between your Slack username and twitter/X handle (synthesize if you don’t have one). Feel free to pad it with extra words if they are not of the same length.  
---

### **FUNCTION 1: Translation of DNA to Protein**
The dna_to_protein function takes a single argument, ***sequence***, a string of DNA nucleotides, and translates it into a protein sequence represented as a string of amino acid symbols. It uses a dataframe to map codons —3-nucleotide sequences to their corresponding amino acids, combining these into two columns for efficient lookup. The function mimics biological translation, where DNA is transcribed to mRNA (assumed as the input here) and translated into proteins, beginning with the start codon "ATG" (Methionine) and ending at stop codons "TAA", "TAG", or "TGA" (represented as "*"). The process involves splitting the input DNA sequence into triplets, matching each codon to its amino acid, and building the protein sequence incrementally.
To achieve this, the function first splits the DNA sequence into a vector of codons by extracting substrings of three characters. It then iterates through these codons, using the dataframe to identify the corresponding amino acid for each and appending it to the growing protein sequence. If a stop codon ("*") is encountered, translation halts, and the function returns the completed amino acid sequence. Otherwise, it processes all codons and returns the final sequence as the output. This structured approach ensures accurate translation while reflecting the biological rules of protein synthesis, making it a useful tool for bioinformatics applications.

---
#### **FUNCTION 2: Generation and Simulation of a Logistic Growth Curve**
Logistic growth is a mathematical model that describes how populations grow in a constrained environment, characterized by an initial exponential growth phase followed by a slowdown as resources become limited. This model is applicable across various fields, including biology, military logistics, and mathematics, highlighting its versatility and significance. The logistic growth model is often represented by the differential equation:

$$\frac{dt}{dP}=rP*(\frac{1−K}{P})$$ 

where 
- P is the population size,
- r is the growthrate, and
- K is the carrying capacity.
  
The logistic growth is characterized by S-shaped curve that starts with a slow growth phase, accelerates during the exponential phase, and eventually levels off as it approaches the carrying capacity of the environment. Another characteristics is the Carrying Capacity, maximum population size that the environment can sustain, beyond which growth slows significantly.

$$P(t)=\frac{K}{1+\frac{k-N0}{N0}*e^{-rt}}$$

- where:
- P(t): Population size/quantity/concentration/0D at time ( t ).
- K: Carrying capacity, the maximum sustainable population size.
- N0: Initial population size at t=0
 - r: Intrinsic growth rate, the rate at which the population grows when resources are abundant.
 - t: Time.
 - e: The base of the natural logarithm (approximately 2.718).
   
This equation generates the S-shaped curve, reflecting three distinct phases: a slow initial increase (lag phase), rapid exponential growth (log phase), and a leveling off as the population approaches ( K ) (stationary phase). The function we constructed takes three parameters for the initial population size (n for P~t~), growth rate (r for r) and time. It assumes the maximum carrying capacity K to be 1, therefore the expression above changes as:


$$P(t)=\frac{1}{1+\frac{1-N0}{N0}*e^{-rt}}$$


- After running the function, a plot is set up. To simulate changes in the concentrations for 100 times, a for loop with random initial concentration values and random growth rates is created. Next, these random values are given as inputs for the logistic growth curve function, along with the defined time range. The function is run for 100 times within the loop, while lines for each output are generated with randomly selected colors from the RGB scale.

---

##### **FUNCTION 3: Function for determining the time to reach 80% of the maximum growth -based on function_2**

Based on the previous function, we defined another function to calcalulate the time to reach 80% of the carrying capacity(K=1), hence the logistic equation becomes:

$$P(0.8)=\frac{1}{1+\frac{1-P0}{P0}*e^{-rt}}$$

To do so, we utilize the growth rate, initial concentration and final concentration as parameters within the function. We insert them in a formula described within the function and return a print statement. we insert them into the function which returns a print statement and the value of the time to reach 80% of K from the formular below:

time_for_capacity = $log((0.8 / (1 - 0.8)) / (init_od / (1 - init_od))) / growth_rate$

Its can be deduced that function_2 and 3 were used to perform three main tasks:

1. logistic_growth Function: Models logistic population growth with a carrying capacity of 1, given an initial population (n), growth rate (r), and time points (time). It’s used to simulate growth curves.

2. Simulation and Plotting: Generates and plots 100 logistic growth curves with random initial populations and growth rates, overlaid on a single plot with random colors, to visualize variability.

3. carrying_capacity_80 Function: Attempts to calculate the time to reach 80% of the carrying capacity (0.8), but contains an error in its use of final_od. It’s meant to analyze growth dynamics.

###### **FUNCTION 4: write a function for calculating the hamming distance between your Slack username and twitter/X handle**

Hamming distance is a metric used to quantify the difference between two strings of equal length by counting the number of positions at which the corresponding symbols differ.  It measures the number of positions at which two strings of equal length differ, providing a straightforward way to assess similarity or dissimilarity. This metric is not only foundational for various computational applications but also serves as a basis for more complex similarity measures. It is widely used in error detection and correction codes, where it helps identify and correct errors in transmitted data. 

The function for calculating the hamming distance were optimized to enhance readiability and performance. The function takes a Slack username and Twitter/X username as it;s arguments. It validates the two parameters to ensure they are both character strings and non-empty strings. It then split the usernames into character vectors and check if they are equal length before calculating for the hamming distance using vectorized comparison -the function compares each character within these vectors based on their positions. If a character within the first username/vector is different from that within the second username/vector, the Hamming distance is increased by 1. Finally, it returns a statement with the numeric Hamming distance between the two strings. to read more about Hamming distance used the link [Hamming distance](https://en.wikipedia.org/wiki/Hamming_distance) [research paper/pdf](https://scispace.com/papers/measures-of-string-similarities-based-on-the-hamming-sw2upqnw9iyr)

---






