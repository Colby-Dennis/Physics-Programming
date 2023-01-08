use std::fs::OpenOptions;
use std::io::Write;
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    // Opening file to write out data
    let mut outcsv = OpenOptions::new()
        .write(true)
        .create(true)
        .open("../Unit01/exercise06/Outputs/output.csv")?;

    let mut outtab = OpenOptions::new()
        .write(true)
        .create(true)
        .open("../Unit01/exercise06/Outputs/output.txt")?;

    // Writing out the data
    for n in 1..26{
        write!(outcsv, "{}, {}\n", n, n*n)?;
        write!(outtab, "{}\t{}\n", n, n*n)?;
    }

    Ok(())
}