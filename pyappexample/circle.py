# Import scipy constants module
from scipy import constants

# Define a function to calculate the area of a circle
def circle_area(radius):
  # Use the pi constant from scipy
  area = constants.pi * radius ** 2
  return area

# Test the function with a radius of 5
r = 5
a = circle_area(r)

# Print the result
print(f"The area of a circle with radius {r} is {a:.2f}")

def circle_circumference(radius):
  # Use the pi constant from scipy
  circumference = 2 * constants.pi * radius
  return circumference

# Test the function with a radius of 5

c = circle_circumference(r)

# Print the result
print(f"The circumference of a circle with radius {r} is {c:.2f}")
