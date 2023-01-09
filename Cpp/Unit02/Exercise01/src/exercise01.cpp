#include<iostream>
#include<fstream>
#include<string>
#include<cmath>

using namespace std;

int main() {
    float m1, m2, l1, l2, a1, a2, dt, time;
    float g, a1Dot, a2Dot, a1DotDot, a2DotDot, currentTime;
    float x1, y1, x2, y2;
    float num1, num2, num3, num4, denominator;
    string str;

    // Getting input values
    ifstream indata;
    indata.open("../Unit02/Exercise01/Inputs/input.txt");
    indata >> str >> m1;
    indata >> str >> m2;
    indata >> str >> l1;
    indata >> str >> l2;
    indata >> str >> a1;
    indata >> str >> a2;
    indata >> str >> dt;
    indata >> str >> time;
    indata.close();

    // Setting internal values
    g = 9.8;
    a1Dot = 0.0;
    a2Dot = 0.0;
    currentTime = 0.0;

    // Opening file to output data
    ofstream outdata;
    outdata.open("../Unit02/Exercise01/Outputs/output.csv");

    // Euler Method
    while (currentTime < time) {
        // Writing out current positions
        x1 = l1 * sin(a1);
        y1 = l1 * cos(a1);
        x2 = x1 + (l2 * sin(a2));
        y2 = y1 + (l2 * cos(a2));
        outdata << currentTime << "," << x1 << ",";
        outdata << y1 << "," << x2 << "," << y2 << "\n";

        // Implimenting Euler's Method
        // Updating angular acceleration
        num1 = m2*g*sin(a2)*cos(a1-a2);
        num2 = m2*sin(a1-a2)*((l1*a1Dot*a1Dot*cos(a1-a2))+(l2*a2Dot*a2Dot));
        num3 = (m1+m2)*g*sin(a1);
        denominator = m1 + (m2*sin(a1-a2)*sin(a1-a2));
        a1DotDot = (num1 - num2 - num3)/(l1*denominator);

        num1 = l1*a1Dot*a1Dot*sin(a1-a2);
        num2 = g*sin(a2);
        num3 = g*sin(a1)*cos(a1-a2);
        num4 = m2*l2*a2Dot*a2Dot*sin(a1-a2)*cos(a1-a2);
        a2DotDot = (((m1+m2)*(num1 - num2 + num3)) + num4)/(l2*denominator);

        // Updating angular velocity
        a1Dot = a1Dot + (a1DotDot * dt);
        a2Dot = a2Dot + (a2DotDot * dt);

        // Updating angle
        a1 = a1 + (a1Dot * dt);
        a2 = a2 + (a2Dot * dt);

        currentTime = currentTime + dt;
    }

    return 0;
}