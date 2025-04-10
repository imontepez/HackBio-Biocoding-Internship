#FUNCTIONS GALORE
# HackBio Internship Program - February, 2025
# stage-1 task for threonine_team 2
# The group consists of five persons, namely;
# Peter (https://github.com/imontepez)
# Tyler (https://github.com/tylermaire)
# Terry (https://github.com/Terryida)
# Gracious (https://github.com/Graciousisoah)
# Mahpara (https://github.com/mahpara97)

# Function 1: Translation of DNA to protein

dna_to_protein<-function(sequence) {
  
# Create a dataframe of codons and amino acids
  
amino_acids<-c("A","R","N","D","C","E","Q","G","H","I","L","K","M","F","P","S","T","W","Y","V","*")
codons<-list(c("GCT","GCC","GCA","GCG"),
               c("CGT","CGC","CGA","CGG","AGA","AGG"),
               c("AAT","AAC"),
               c("GAT","GAC"),
               c("TGT","TGC"),
               c("GAA","GAG"),
               c("CAA","CAG"),
               c("GGT","GGC","GGA","GGG"),
               c("CAT","CAC"),
               c("ATT","ATC","ATA"),
               c("CTT","CTC","CTA","CTG","TTA","TTG"),
               c("AAA","AAG"),
               c("ATG"),
               c("TTT","TTC"),
               c("CCT","CCC","CCA","CCG"),
               c("TCT","TCC","TCA","TCG","AGT","AGC"),
               c("ACT","ACC","ACA","ACG"),
               c("TGG"),
               c("TAT","TAC"),
               c("GTT","GTC","GTA","GTG"),
               c("TAA","TAG","TGA"))
  
  #Treat each vector of codons "as is" using the built-in function "I"
  
  codon_df<-data.frame(codons= I(codons), amino_acids= I(amino_acids))
  
  # Split sequence into triple letters
  
  seq_vec<-character() # Create an empty character vector
  
  for (i in seq(1,nchar(sequence),by=3)){                  # Iterate over each character in the sequence
    codon<-substr(sequence,i,min(i+2,nchar(sequence)))     # Extract sub-strings of 3 from the sequence
    seq_vec<-c(seq_vec,codon)                              #Append codon to the empty vector to create the codon sequence
  }
  
  # Match the codons to the amino acids and create the amino acid sequence
  
  aa_seq<-""
  for (cdn in seq_vec) {
    for (i in 1:nrow(codon_df)) {
      if (cdn %in% codon_df$codons[[i]]){                     # double brackets to access the codon vector within the data frame
        aa_seq<-paste0(aa_seq,codon_df$amino_acids[i])        # add the amino acid to the new character vector, aa_seq
        if (codon_df$amino_acids[[i]]=="*") {
          return(aa_seq)
        }
        break #End the loop once you reach stop codon
      }
    }
  }
  return(aa_seq)
}


# Test the function!

dna_to_protein("ATGTCTTTTACTGCTTATAATAAAGAT")
dna_to_protein("ATTATGCAAAATACAGAACCTGAAACTGAACGTTAG")


# Function 2: Generation and simulation of a logistic growth curve

logistic_growth<-function(n,r,time) { 

  # Defined a function where 
  
  # n = Initial population size/concentration
  # t = Time 
  # r = Growth rate
  # The carrying capacity / maximum concentration (K) is assumed 1
  
  growth<- 1/(1+((1-n)/n)*exp(-r*time))
  return (growth)
}

# To randomize time - This is defined outside the function to try out different scenarios

time<-seq(0,1000,by=0.01)

# Run the function to initialize the growth curve

od<-logistic_growth(0.1,0.1,time) 

# Set up the plot

plot(time,od,
     type="l",
     xlab="Time",
     ylab="Concentration",
     ylim=c(0,1),
     xlim=c(0,1000),
     main = "OD600 vs Time"
     )

# To generate multiple random growth cureve (100) and Simulates variability in initial conditions and growth rates.

for (i in 1:100) {
  
  #Introduces variability in initial population size.
  random_init_od<-runif(1,0.01,0.99) 
  
  #Generates a random growth rate between 0.01 and 1
  random_growth_rate <- runif(1,0.01,1) 
  
 #Run the function once again with randomly generated values by Generating a unique curve for each iteration
  od <- logistic_growth(random_init_od, random_growth_rate, time) 
  
  # Add randomly generated lines with random colors
  lines(time, od, col = rgb(runif(1), runif(1), runif(1), 0.5)) 
}



# Function 3: function to Calculate the time for a population to reach 80% of its carrying capacity

# Similar to the function above, the carrying capacity (K) is assumed to be 0.8
# The logistic growth function described above is reversed in case of this function

carrying_capacity_80<-function(initial_od,growth_rate){ 

  # Check if init_od is valid (between 0 and 0.8, since we are growing toward 0.8)
  if (initial_od <= 0 || initial_od >= 0.8) {
    return("Error: Initial population must be between 0 and 0.8 (exclusive)")
  }
  if (growth_rate <= 0) {
    return("Error: Growth rate must be positive")
  }
  
  '''
   from the formula: t = (ln((N(t)/(K - N(t))) - ln(N0/(K - N0))) / r
   Where N(t) = 0.8, K = 1, N0 = init_od
  
   Correct formula: t = (ln((N(t)/(K - N(t))) - ln(N0/(K - N0))) / r
   Where N(t) = 0.8, K = 1, N0 = init_od
   Simplifies to: t = ln((0.8 / (1 - 0.8)) / (init_od / (1 - init_od))) / r
                t = ln((0.8 / 0.2) / (init_od / (1 - init_od))) / r
                t = ln(4 / (init_od / (1 - init_od))) / r
  '''
  
  #where 0.8 is assumed to be the final_od and a constant
  time_for_capacity <- log((0.8 / (1 - 0.8)) / (initial_od / (1 - initial_od))) / growth_rate
  return(paste("The time it takes to reach 80% of the carrying capacity of 1 is:", 
               round(time_for_capacity, 2), "hours"))
}


# Test the function! 

carrying_capacity_80(0.02,0.3)


# Function 4: Calculating the Hamming distance between two strings 

Hamming_distance <- function(Slackname, Twittername) {
  
  # Split each username into their individual characters
  
  String1 <-strsplit(Slackname,"")[[1]]
  String2<- strsplit(Twittername,"")[[1]]
  
  # Compare the lengths of the strings
  
  if (length(String1) !=length(String2) ) {
    stop("Both inputs must have an equal number of characters!")
  }
  
  # Initialize Hamming distance 
  
  Distance <- 0
  
  # Compare each character in the strings with respect to their positions 
  
  for (x in 1:length(String1)) {
    if (String1[x] != String2[x]){
      
      Distance <- Distance + 1                    # Add to the Hamming distance in case of a different character
    }
  }
  
  return(paste(Slackname,"and", Twittername, "have a Hamming distance of", Distance))}


# Test the function by comparing the Hamming distances between the Slack and Twitter usernames of all team members
Hamming_distance("perexzzzz", "imontepez")

#Terry_ngala, Tyler
#Perex, imontepez
#Gracious, Gracious_1
#Mahpara, Mahpara_twitter
#ngala_terry, Ty_Maire

#github of all members of group    
#https://github.com/mahpara97 
#https://github.com/Terryida
#https://github.com/imontepez 
#https://github.com/tylermaire 
#https://github.com/Graciousisoah
