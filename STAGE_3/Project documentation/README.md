# **STAGE 3 FINAL PROJCT ON DRUG DISCOVERY USING MACHINE LEARNING**
---

- What chemical properties determine if a small molecule will bind to a protein target?

  ***INSTRUCTIONS***
  
[***Study this data***](https://github.com/HackBio-Internship/2025_project_collection/raw/refs/heads/main/Python/Dataset/drug_class_struct.txt)

It is a chemical descriptor matrix of over 10000 compounds

- Using PCA and K-mean clustering; represent the chemical space of all the compounds represented here:

- A chemical space representation can be extremely diverse, but you will definitely find some interesting chemical clusters. [Read about chemical space here](https://practicalcheminformatics.blogspot.com/2019/11/visualizing-chemical-space.html)

- Color the chemical spaces by the docking score.

- Is there a sub-cluster that preferentially has a lower docking score?

- What are they and how do you interpret these special cluster

 These compounds were docked against adenosine deaminase (ada), a protein associated with a lot of diseases
  
- Docking score is in the score column.
- Note that in docking, the lower the binding energy, the better!
- Using regression algorithms, can you predict the docking score using the chemical features alone
