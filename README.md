# HMJLS_Generator
HMJLS Generator:

This repository provides a MATLAB function `hmjlsg(n_s)` that generates `n_s` random instances of Hidden Markov Jump Linear Systems (MJLS) and saves them to disk.

<br><br>
**Run in MATLAB:**

Open MATLAB in the folder containing the script, then run, e.g., hmjlsg(10) to generate 10 HMJLS instances.


<br><br>
**Output:**

A folder named `./examples/` will be created (if it doesn't exist), and inside it you'll find:

example_1.mat
example_2.mat
...
example_n.mat

<br><br>
The code is designed to be easily modified. You are encouraged to freely alter the system generation parameters to suit your needs. For instance, you can:

. Change the range of dimensions for states, inputs, or outputs.
. Adjust the sparsity or distribution of matrix entries.
. Modify how the Markov transition matrices P and Q are generated.
. Set different initial distributions or structures for system matrices.
