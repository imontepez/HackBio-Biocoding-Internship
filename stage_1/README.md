HackBio biocoding internship stage_1 task: FUNCTION GALORE!
This stage task involves writing four different functions in R for specific purposes. 
INSTRUCTIONS:
Write a function for translating DNA to protein
Write a function that simulates and generates a logistic population growth curve. Your function should include 2 extra parameters that randomize the length of the lag phase and the exponential phase.  Most living populations follow a logistic population growth. Therefore, your growth curve can be: Population Size vs Time, Cell density vs Time, OD vs Time, CFU vs Time, etc.
Using your function, generate a dataframe with 100 different growth curves.
Write a function for determining the time to reach 80% of the maximum growth; usually the carrying capacity.
Finally, write a function for calculating the hamming distance between your Slack username and twitter/X handle (synthesize if you don’t have one). Feel free to pad it with extra words if they are not of the same length.

FUNCTION 1: Translation of DNA to Protein
The dna_to_protein function takes a single argument, sequence, a string of DNA nucleotides, and translates it into a protein sequence represented as a string of amino acid symbols. It uses a dataframe to map codons—3-nucleotide sequences—to their corresponding amino acids, combining these into two columns for efficient lookup. The function mimics biological translation, where DNA is transcribed to mRNA (assumed as the input here) and translated into proteins, beginning with the start codon "ATG" (Methionine) and ending at stop codons "TAA", "TAG", or "TGA" (represented as "*"). The process involves splitting the input DNA sequence into triplets, matching each codon to its amino acid, and building the protein sequence incrementally.
To achieve this, the function first splits the DNA sequence into a vector of codons by extracting substrings of three characters. It then iterates through these codons, using the dataframe to identify the corresponding amino acid for each and appending it to the growing protein sequence. If a stop codon ("*") is encountered, translation halts, and the function returns the completed amino acid sequence. Otherwise, it processes all codons and returns the final sequence as the output. This structured approach ensures accurate translation while reflecting the biological rules of protein synthesis, making it a useful tool for bioinformatics applications.

FUNCTION 2: Generation and Simulation of a Logistic Growth Curve
Logistic growth is a mathematical model that describes how populations grow in a constrained environment, characterized by an initial exponential growth phase followed by a slowdown as resources become limited. This model is applicable across various fields, including biology, military logistics, and mathematics, highlighting its versatility and significance. The logistic growth model is often represented by the differential equation  where  $dt/dP=rP(1−K/P)$  where P is the population size, r is the growthrate, and K is the carrying capacity. The logistic growth is characterized by S-shaped curve that starts with a slow growth phase, accelerates during the exponential phase, and eventually levels off as it approaches the carrying capacity of the environment. Another characteristics is the Carrying Capacity, maximum population size that the environment can sustain, beyond which growth slows significantly.

$$P(t)=\frac{K}{1+\frac{k-N0}{N0}*e^{-rt}}$$
- where:
- P(t): Population size/quantity/concentration/0D at time ( t ).
- K: Carrying capacity, the maximum sustainable population size.
- N0: Initial population size at t=0
 - r: Intrinsic growth rate, the rate at which the population grows when resources are abundant.
 - t: Time.
 - e: The base of the natural logarithm (approximately 2.718).
This equation generates the S-shaped curve, reflecting three distinct phases: a slow initial increase (lag phase), rapid exponential growth (log phase), and a leveling off as the population approaches ( K ) (stationary phase).

- The function we constructed takes three parameters for the initial population size (n for P_{0}), growth rate (r for r) and time. It assumes the maximum carrying capacity K to be 1, therefore the expression above changes as:

$$P(t)=\frac{1}{1+\frac{1-N0}{N0}*e^{-rt}}$$

- After running the function, a plot is set up. To simulate changes in the concentrations for 100 times, a for loop with random initial concentration values and random growth rates is created. Next, these random values are given as inputs for the logistic growth curve function, along with the defined time range. The function is run for 100 times within the loop, while lines for each output are generated with randomly selected colors from the RGB scale.


 
