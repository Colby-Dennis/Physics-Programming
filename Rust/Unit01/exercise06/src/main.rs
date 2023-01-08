use std::fs::OpenOptions;
use std::io::Write;
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    // Writing out hypotenuse to file
    let mut outcsv = OpenOptions::new()
        .write(true)
        .create(true)
        .open("Outputs/output.csv")?;

    let mut outtab = OpenOptions::new()
        .write(true)
        .create(true)
        .open("Outputs/output.txt")?;

    for n in 1..26{
        write!(outcsv, "{}, {}\n", n, n*n)?;
        write!(outtab, "{}\t{}\n", n, n*n)?;
    }

    Ok(())
}