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
