use std::fs::File;
use std::fs;
use std::io::{self, BufRead};
use std::path::Path;

fn main() {
    // Creating an array to save the file inputs
    let mut data_array: [f32; 2] = [0.0;2];

    // reading the file inputs
    if let Ok(lines) = read_lines("../Unit01/exercise05/Inputs/input.txt") {
        let mut i = 0;
        for line in lines {
            if let Ok(ip) = line {
                let split = ip.split(", ");
                let vec: Vec<&str> = split.collect();
                data_array[i] = vec[1].trim().parse().expect("Check Number");
                i = i + 1;
            }
        }
    }
    
    // Saving the numbers to variables
    let a: f32 = data_array[0];
    let b: f32 = data_array[1];
    
    // Writing out hypotenuse to file
    fs::write("../Unit01/exercise05/Outputs/output.txt", ((a*a) + (b*b)).sqrt().to_string())
        .expect("Unable to write to file");
}

// The recommended way to read in by lines from the Rust Cookbook
// https://doc.rust-lang.org/rust-by-example/std_misc/file/read_lines.html
fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}
