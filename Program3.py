# Program 3 - Electic->Gas, Unload Cargo Plane, Platooning Truck, Move Airplane, Chest
from spike import PrimeHub, App, DistanceSensor, Motor, MotorPair
from spike.control import wait_for_seconds, wait_until, Timer
from math import *

hub = PrimeHub()
distance = DistanceSensor('C')
tires= MotorPair('E', 'F')
gray_clawie=Motor('B')

# # Go to Motor and make it Electric
tires.move_tank(23,'in', left_speed=70,right_speed=70)
tires.start(speed=20)
while (distance.get_distance_inches() > 15):
    pass
tires.stop()

tires.move_tank(11,'in', left_speed=45,right_speed=40)
tires.move_tank(2,'in', left_speed=25,right_speed=-25)
gray_clawie.run_for_rotations(-0.5, speed=20)
tires.move_tank(4,'in', left_speed=20,right_speed=20)
gray_clawie.run_for_rotations(0.5, speed=15)

# # Return back for Unload Cargo-Plane 
tires.move_tank(-5,'in', left_speed=25, right_speed=25)
tires.move_tank(3,'in', left_speed=-25,right_speed=25)
tires.move_tank(-4,'in', left_speed=40, right_speed=40)
tires.move_tank(0.7,'in', left_speed=-25,right_speed=25)
gray_clawie.run_for_rotations(-0.5, speed=50)

# # Platooning Truck
tires.move_tank(-23.5,'in', left_speed=58, right_speed=51)

# # Airplane and Truck
tires.move_tank(1,'in',left_speed=40,right_speed=40)
tires.move_tank(6,'in', left_speed=20,right_speed=50)
gray_clawie.run_for_rotations(0.5, speed=50)
tires.move_tank(1.85,'in',left_speed=-25,right_speed=25)
tires.move_tank(-24,'in',left_speed=40,right_speed=40)
tires.move_tank(2,'in',left_speed=20, right_speed=20)

# # Treasure Chest - Unused Capacity
tires.move_tank(3,'in',left_speed=25,right_speed=-25)
tires.move_tank(25,'in',left_speed=75,right_speed=70)
