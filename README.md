Overview: 

A simulation based verification is done on a buggy version of AES. The testbench has a scoreboard to compare with the bug free version. The objective is to identify and report the bugs.
Steps:

1. Copy the "tb_aes_1b.sv" and the "run_1b.sh" scripts and paste in the same location where the scripts and the generated output text files of question 1a are located.
4. Run the "run_1b.sh" script.


Note:
The "file_read variable" in "tb_aes_1b.sv" contains the file with random key patterns, random plain text patterns and the corresponding encrypted texts from golden netlist. The location of the file 
must be put here.

Outputs:

The script will generate the following txt files.
1. aes_buggy_output.txt -->  This file contains the keys used for golden netlist (1st column), the plain text patterns used for the golden netlist (2nd column) and the corresponding encrypted text for the buggy netlist. (3rd column).
