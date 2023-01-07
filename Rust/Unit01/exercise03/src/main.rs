use std::fs;

fn main() {
    let num = fs::read_to_string("../Unit01/exercise03/Inputs/input.txt")
        .expect("Should have been able to read that file");

    let num: f32 = num.trim().parse().expect("Please type a number");

    println!("{}",num*num);
}
