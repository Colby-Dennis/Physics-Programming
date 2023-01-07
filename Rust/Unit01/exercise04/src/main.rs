use std::fs;

fn main() {
    // Reading in the data
    let num = fs::read_to_string("../Unit01/exercise04/Inputs/input.txt")
        .expect("Should have been able to read that file");
    // Converting data to float
    let num: f32 = num.trim().parse().expect("Please type a number");

    // Squaring the number
    let num = num * num;

    // Writing data to the output file
    fs::write("../Unit01/exercise04/Outputs/output.txt", num.to_string())
        .expect("Unable to write to file");
}
