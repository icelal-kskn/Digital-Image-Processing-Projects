import cv2
import numpy as np
import matplotlib.pyplot as plt

def compare_image(modified, reproduced):
    difference = cv2.subtract(modified, reproduced)
    result = not np.any(difference)
    return result

def show_diffrence(original,modified , reproduced):
    plt.figure(figsize=(10, 5))
            
    plt.subplot(1, 3, 1)
    plt.imshow(cv2.cvtColor(original, cv2.COLOR_BGR2RGB))
    plt.title('Original Image')
    plt.axis('off')

    plt.subplot(1, 3, 2)
    plt.imshow(cv2.cvtColor(modified, cv2.COLOR_BGR2RGB))
    plt.title('Modified Image')
    plt.axis('off')
        
    plt.subplot(1, 3, 3)
    plt.imshow(cv2.cvtColor(reproduced, cv2.COLOR_BGR2RGB))
    plt.title('Reproduced Image')
    plt.axis('off')

        
    plt.show()

def histogram_equalization(image):

    r, g, b = cv2.split(image)

    r_eq = cv2.equalizeHist(r)
    g_eq = cv2.equalizeHist(g)
    b_eq = cv2.equalizeHist(b)

    equalized_image = cv2.merge((r_eq, g_eq, b_eq))

    return equalized_image

def solarization(original_img):
    img_float = original_img.astype(np.float32)
    threshold = 128
    solarized_img = np.where(img_float > threshold, 255 - img_float, img_float)

    return solarized_img

def contrast_stretching(original_img):

    img_float = original_img.astype(np.float32)

    min_val = np.min(img_float, axis=(0, 1))
    max_val = np.max(img_float, axis=(0, 1))

    range_val = max_val - min_val

    stretched_img = (img_float - min_val) / range_val * 255

    stretched_img = stretched_img.astype(np.uint16)

    return stretched_img

def smoothing_filter(image, kernel_size=(33,31), sigma=0):
    return cv2.GaussianBlur(image, kernel_size, sigma)

def sharpening_filter(image, kernel_size=(3, 3), sigma=1.0, strength=1.5):
    blurred = cv2.GaussianBlur(image, kernel_size, sigma)
    return cv2.addWeighted(image, 1.0 + strength, blurred, -strength, 0)

def power_law_filter(image, gamma=0.3):

    img_float = image.astype(np.float32)/255

    power_law_img = ((np.power(img_float, gamma)) * 255).astype(np.uint8)
        
    return power_law_img

for i in range(65, 71):
    modified_path = f'./Modified_Photos/{chr(i)}_modified.png'
    original_path = f'./Original_Photos/{chr(i)}_original.png'

    cv_modified_image = cv2.imread(modified_path)
    cv_original_image = cv2.imread(original_path)
    
    result_histogram= compare_image(cv_modified_image.astype(np.uint8), histogram_equalization(cv_original_image).astype(np.uint8)) 
    result_solarization = compare_image(cv_modified_image.astype(np.uint8), solarization(cv_original_image).astype(np.uint8))
    result_contrast_stretching = compare_image(cv_modified_image.astype(np.uint8), contrast_stretching(cv_original_image).astype(np.uint8))
    result_sharpening_filter= compare_image(cv_modified_image.astype(np.uint8), sharpening_filter(cv_original_image).astype(np.uint8))
    result_smoothing_filter = compare_image(cv_modified_image.astype(np.uint8), smoothing_filter(cv_original_image).astype(np.uint8))
    result_power_law_filter= compare_image(cv_modified_image.astype(np.uint8), power_law_filter(cv_original_image).astype(np.uint8))

    if result_histogram:
        show_diffrence(cv_original_image, cv_modified_image, histogram_equalization(cv_original_image))
        print(f"\n {chr(i)}'s operation is histogram equalizaton")
    elif result_solarization:
        show_diffrence(cv_original_image, cv_modified_image, solarization(cv_original_image))
        print(f"\n {chr(i)}'s operation is solarization")
    elif result_contrast_stretching:
        show_diffrence(cv_original_image, cv_modified_image, contrast_stretching(cv_original_image))
        print(f"\n {chr(i)}'s operation is contrast stretching")
    elif result_smoothing_filter:
        show_diffrence(cv_original_image, cv_modified_image, smoothing_filter(cv_original_image))
        print(f"\n {chr(i)}'s operation is smoothing filter")
    elif result_sharpening_filter: 
        show_diffrence(cv_original_image, cv_modified_image, sharpening_filter(cv_original_image))
        print(f"\n {chr(i)}'s operation is sharpening filter")   
    else:
        show_diffrence(cv_original_image, cv_modified_image, power_law_filter(cv_original_image))
 






