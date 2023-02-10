let eulerFortran
let eulerCpp
let eulerRust

let eulerFortranDoublePendulum
let eulerCppDoublePendulum
let eulerRustDoublePendulum

function preload() {
    eulerFortran = loadTable('../../Fortran90/Unit02/Exercise01/Outputs/output.csv')
    eulerCpp = loadTable('../../Cpp/Unit02/Exercise01/Outputs/output.csv')
    eulerRust = loadTable('../../Rust/Unit02/exercise01/Outputs/output.csv')
}

function setup() {
    createCanvas(400, 400);
    eulerFortranDoublePendulum = new DoublePendulumClass(eulerFortran);
    eulerCppDoublePendulum = new DoublePendulumClass(eulerCpp);
    eulerRustDoublePendulum = new DoublePendulumClass(eulerRust);
  }
  
  function draw() {
    background(0);
    // Moving the origin
    stroke(255);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Fortran90", 100, 50);
    text("C++", 200, 50);
    text("Rust", 300, 50);

    translate(100,75);
    stroke(255,0,0);
    fill(255,0,0);
    eulerFortranDoublePendulum.show();
    eulerFortranDoublePendulum.update();

    translate(100,0);
    stroke(0,255,0);
    fill(0,255,0);
    eulerCppDoublePendulum.show();
    eulerCppDoublePendulum.update();

    translate(100,0);
    stroke(0,0,255);
    fill(0,0,255);
    eulerRustDoublePendulum.show();
    eulerRustDoublePendulum.update();
  }