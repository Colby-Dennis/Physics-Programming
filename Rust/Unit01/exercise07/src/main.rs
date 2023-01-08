use std::env;
use std::fs::OpenOptions;
use std::io::Write;
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    // Collecting input and storing it to a variable.
    let args: Vec<String> = env::args().collect();
    let q: f32 = args[1].trim().parse().unwrap();
    
    // Opening file to write out result
    let mut outfile = OpenOptions::new()
        .write(true)
        .create(true)
        .open("../Unit01/exercise07/Outputs/output.txt")?;

    // Writing out the square
    write!(outfile, "{}", q*q)?;

    Ok(())
}
