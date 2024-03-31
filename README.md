# Arm Assembly Learning
This is the code base for me learning assembly for ARM architectures. It's based on the book [Programming with 64-Bit ARM Assembly Language](https://learning.oreilly.com/library/view/programming-with-64-bit/9781484258811/). 
All the building, running, and cleaning commands below are handled by the Makefile which is created in each chapter directory.

## Building
To build without debugging symbols use the `./builddr.zsh` script with the first argument as the chapter and the secon argument
the exact file (no ending). To build with debug symbols use the `./buildd.zsh` script with the same arguments.

## Running
After building the file with one of the commands above, run `./run.zsh` with the same arguments as before.

## Cleaning
Run the `./clean.zsh` command with the same arguments.
