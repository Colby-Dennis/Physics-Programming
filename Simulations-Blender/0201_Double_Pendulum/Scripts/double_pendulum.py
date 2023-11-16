"""
A python program to read in the output data for a double pendulum and animate it within blender.

Blender is defaulted to 24 frames per second so the output data is also ran at 24 fps.

Output data is in a csv of the following form
    t, x1, y1, x2, y2

The script is designed to be run from within the double_pendulum.blend file
"""

# Necessary modules
import csv
from array import *
import bpy
import math

# Setting the scale and height of the pendulum
scale = 5
height = 13

# Working path to directory
# Laptop:
# path = "C:/Users/Colby/OneDrive/Documents/GitHub/Physics-Programming/Simulations-Blender/0201_Double_Pendulum/"
# Desktop
path = "C:/Users/ncolb/OneDrive/Documents/GitHub/Physics-Programming/Simulations-Blender/0201_Double_Pendulum/"

# Arrays to hold pendulum data
pendulum = []
index = 0


# Part 1: Read in the csv data into a 2d array
with open(path+'Inputs/data.csv', newline='') as csvfile:
    data = csv.reader(csvfile, delimiter=',')
    for row in data:
        tempRow = []
        rowIndex = 0
        for item in row:
            tempRow.insert(rowIndex, float(item))
            rowIndex = rowIndex + 1
        pendulum.insert(index, tempRow)
        index = index + 1

# Updating values in the pendulum array with the new scale and height
for i in range(len(pendulum)):
    pendulum[i][1] = pendulum[i][1]*scale
    pendulum[i][2] = pendulum[i][2]*(-scale) + height
    pendulum[i][3] = pendulum[i][3]*scale
    pendulum[i][4] = pendulum[i][4]*(-scale) + height

# Pendulum array now contains data, need to add spheres to environment in blender.

# Getting and setting the objects in the animation
# Objects were already created and labeled
pendulumOne = bpy.data.objects['PendulumOne']
pendulumTwo = bpy.data.objects['PendulumTwo']
stringOne = bpy.data.objects['StringOne']
stringTwo = bpy.data.objects['StringTwo']

# Setting the rotation of the strings to zero
stringOne.rotation_mode = "XYZ"
stringOne.rotation_euler.x = 0
stringOne.rotation_euler.y = 0
stringOne.rotation_euler.z = 0
stringTwo.rotation_mode = "XYZ"
stringTwo.rotation_euler.x = 0
stringTwo.rotation_euler.y = 0
stringTwo.rotation_euler.z = 0

# Only update y and z positions, pendulum will stay at 0.0 in x.
# Setting the frame positions (key frames start at 1 instead of 0)
for i in range(len(pendulum)):
    # Updating mass positions
    # Mass one
    pendulumOne.location = (0.0, pendulum[i][1], pendulum[i][2])
    pendulumOne.keyframe_insert(data_path="location", frame=i+1)
    # Mass two
    pendulumTwo.location = (0.0, pendulum[i][3], pendulum[i][4])
    pendulumTwo.keyframe_insert(data_path="location", frame=i+1)
    
    # Updating sting positions
    # First String 
    x = pendulum[i][1]/2.0
    y = (height + pendulum[i][2])/2.0
    stringOne.location = (0.0, x, y)
    stringOne.keyframe_insert(data_path="location", frame=i+1)
    
    # Second String
    x = (pendulum[i][3] + pendulum[i][1])/2.0
    y = (pendulum[i][2]+pendulum[i][4])/2.0
    stringTwo.location = (0.0, x, y)
    stringTwo.keyframe_insert(data_path="location", frame=i+1)
    
    # Updating string rotations
    # First string
    x = pendulum[i][1]
    y = height - pendulum[i][2]
    stringOne.rotation_euler.x = -math.atan(y/x) + math.pi/2
    stringOne.keyframe_insert("rotation_euler",frame=i+1)
    
    # Second string
    x = pendulum[i][3] - pendulum[i][1]
    y = pendulum[i][2] - pendulum[i][4]
    stringTwo.rotation_euler.x = -math.atan(y/x) + math.pi/2
    stringTwo.keyframe_insert("rotation_euler",frame=i+1)

# Animation should now be done.