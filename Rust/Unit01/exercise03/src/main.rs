use std::fs;

fn main() {
    // Reading in the data
    let num = fs::read_to_string("../Unit01/exercise03/Inputs/input.txt")
        .expect("Should have been able to read that file");
    // Converting data to float
    let num: f32 = num.trim().parse().expect("Please type a number");

    println!("{}",num*num);
}
