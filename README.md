# Physics-Programming
 A collection of programs to better my computational physics skills. Focusing on utilizing Fortran 90, C++, and Rust.

## Project Structure
 The project is structured to first start with genaric workflow techniques then move towards physics and algorithms. Each programming language has its own folder and in each folder there is bin folder where the executables will live. 

 The file structure will look like this (similar structure for each language.)

 -CPP
 -Fortran90
  | -Bin
   | exer####.exe
  | -Unit##
   | -Exercise##
     | -Program
     | -Inputs
     | -Outputs
 -Rust

#### How I'm making rust projects.
* Navigate to the unit folder.
* Use "cargo new exercise##".
* Navigate to the new exercise## folder.
* Create a Makefile that will run the build command and copy the .exe to the bin folder. (Double check all file paths).