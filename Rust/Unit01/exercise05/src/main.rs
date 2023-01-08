use std::fs::{File, OpenOptions};
use std::io::{BufRead, BufReader, Write};
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    // Creating an array to save the file inputs
    let mut data_array: [f32; 2] = [0.0;2];

    // Reading the file inputs
    let infile = BufReader::new(File::open("Inputs/input.txt")?);
    for (line, data) in infile.lines().zip(&mut data_array) {
        let line = line?;
        *data = line.split(", ")
                    .nth(1)
                    .ok_or("at least 2 comma-seperated fields")?
                    .trim()
                    .parse()
                    .unwrap();
    }

    let [a, b] = data_array;

    // Writing out hypotenuse to file
    let mut outfile = OpenOptions::new()
        .write(true)
        .create(true)
        .open("Outputs/output.txt")?;

    write!(outfile, "c: {}", f32::hypot(a,b))?;

    Ok(())
}