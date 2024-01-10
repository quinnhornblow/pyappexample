# Import scipy constants module
from scipy import constants
from pyappexample.helper import hello

# Define a function to calculate the area of a circle
def circle_area(radius):
    # Use the pi constant from scipy
    area = constants.pi * radius**2
    return area


def circle_circumference(radius):
    # Use the pi constant from scipy
    circumference = 2 * constants.pi * radius
    return circumference

def run():
    print("Running the run function")
    # Test the function with a radius of 5
    r = 5
    a = circle_area(r)
    c = circle_circumference(r)

    # Print the result
    print(f"The circumference of a circle with radius {r} is {c:.2f}")
    hello()

    # Print the result
    print(f"The area of a circle with radius {r} is {a:.2f}")
    return