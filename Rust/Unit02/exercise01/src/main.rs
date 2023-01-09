use std::fs::{File, OpenOptions};
use std::io::{BufRead, BufReader, Write};
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    // Creating an array to save the file inputs
    let mut data_array: [f32; 8] = [0.0;8];

    // Reading the file inputs
    let infile = BufReader::new(File::open("../Unit02/exercise01/Inputs/input.txt")?);
    for (line, data) in infile.lines().zip(&mut data_array) {
        let line = line?;
        *data = line.split(", ")
                    .nth(1)
                    .ok_or("at least 2 comma-seperated fields")?
                    .trim()
                    .parse()
                    .unwrap();
    }

    // Assigning values
    let m1 = data_array[0];
    let m2 = data_array[1];
    let l1 = data_array[2];
    let l2 = data_array[3];
    let mut a1 = data_array[4];
    let mut a2 = data_array[5];
    let dt = data_array[6];
    let time = data_array[7];

    // Setting internal values
    const G: f32 = 9.8;
    let mut a1_dot = 0.0;
    let mut a2_dot = 0.0;
    let mut current_time = 0.0;

    // Opening output file
    let mut outfile = OpenOptions::new()
        .write(true)
        .create(true)
        .open("../Unit02/exercise01/Outputs/output.csv")?;

    // Euler Method
    while current_time < time {
        // Writing out current positions
        let x1 = l1 * a1.sin();
        let y1 = l1 * a1.cos();
        let x2 = x1 + (l2 * a2.sin());
        let y2 = y1 + (l2 * a2.cos());
        write!(outfile, "{},{},{},{},{}\n",current_time,x1,y1,x2,y2)?;

        // Implimenting Euler's Method
        // Updating angular acceleration
        let mut num1 = m2*G*a2.sin()*(a1-a2).cos();
        let mut num2 = m2*(a1-a2).sin()*((l1*a1_dot*a1_dot*(a1-a2).cos())+(l2*a2_dot*a2_dot));
        let mut num3 = (m1+m2)*G*a1.sin();
        let denominator = m1 + (m2*(a1-a2).sin()*(a1-a2).sin());
        let a1_dot_dot = (num1 - num2 - num3)/(l1*denominator);

        num1 = l1*a1_dot*a1_dot*(a1-a2).sin();
        num2 = G*a2.sin();
        num3 = G*a1.sin()*(a1-a2).cos();
        let num4 = m2*l2*a2_dot*a2_dot*(a1-a2).sin()*(a1-a2).cos();
        let a2_dot_dot = (((m1+m2)*(num1 - num2 + num3)) + num4)/(l2*denominator);

        // Updating angular velocity
        a1_dot = a1_dot + (a1_dot_dot * dt);
        a2_dot = a2_dot + (a2_dot_dot * dt);

        // Updating angle
        a1 = a1 + (a1_dot * dt);
        a2 = a2 + (a2_dot * dt);

        current_time = current_time + dt;
    }

    Ok(())
}