use std::env;
use std::fs::{File, OpenOptions};
use std::io::{BufRead, BufReader, Write};
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    // Constructing the paths
    let mut input_path = "".to_string();
    let mut output_path = "".to_string();

    let args: Vec<String> = env::args().collect();

    if args.len() > 1 {
        input_path.push_str(&args[1]);
        output_path.push_str(&args[1]);
    } 

    input_path.push_str("Inputs/input.txt");
    output_path.push_str("Outputs/output.txt");

    // Opening the input and output files
    let infile = BufReader::new(File::open(input_path)?);
    let mut outfile = OpenOptions::new()
        .write(true)
        .create(true)
        .open(output_path)?;

    // Writing out the square of the input files
    for line in infile.lines() {
        let line = line?;
        let a: f32 = line.trim().parse().unwrap();
        write!(outfile,"{}\n", a*a)?;
    }

    Ok(())
}