# Task 4 - Basic Image Processing with Python Pillow
from PIL import Image
import matplotlib.pyplot as plt
import numpy as np

# Load the original RGB image
original_image = Image.open('./images/lighthouse.png')

# Display the original RGB image
plt.subplot(2, 2, 1)
plt.imshow(np.array(original_image))
plt.title('Original RGB Image')

# Convert the original RGB image to grayscale
gray_image = original_image.convert('L')

# Display the grayscale image
plt.subplot(2, 2, 2)
plt.imshow(np.array(gray_image), cmap='gray')
plt.title('Grayscale Image')

# Rotate the original RGB image
rotated_image = original_image.rotate(45)

# Display the rotated image
plt.subplot(2, 2, 3)
plt.imshow(np.array(rotated_image))
plt.title('Rotated Image')

# Display the histogram of the grayscale image
plt.subplot(2, 2, 4)
plt.hist(np.array(gray_image).ravel(), bins=256, color='blue')
plt.title('Histogram of Grayscale Image')

plt.show()