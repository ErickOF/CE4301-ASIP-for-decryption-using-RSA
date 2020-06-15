from matplotlib import pyplot as plt
import numpy as np


def show_imgs(encrypted_img, decrypted_img):
    # First image
    plt.figure(1)
    plt.subplot(211)
    plt.imshow(encrypted_img, cmap='gray')

    # Second image
    plt.subplot(212)
    plt.imshow(decrypted_img, cmap='gray')
    plt.show()

def rsa_decryption(base, mod, exp):
    if mod == 1:
        return 0

    decrypted_pixel = 1
    for _ in range(exp):
        decrypted_pixel = (decrypted_pixel * base) % mod

    return decrypted_pixel

def decryption(img, mod, exp):
    # Output image
    decrypted_img = []

    # Input image dimension
    N = len(img)

    for i in range(0, N, 2):
        # Take two pixel which represent one
        pixel1, pixel2 = img[i:i + 2]
        # Convert to a 16 bit pixel
        pixel = (pixel1 << 8) + pixel2
        # Decrypt pixel
        decrypted_pixel = rsa_decryption(pixel, mod, exp)
        # Add to output image
        decrypted_img.append(decrypted_pixel)
        
        if i % 3840 == 0:
            print(f'{i}/{N}={i/N}')

    return decrypted_img

def open_file(filename):
    file = open(filename)
    content = file.read()
    file.close()
    return content.split('\n')[-1]


if __name__ == '__main__':
    # Image path
    img_path = '../src/img.txt'

    # Value used to generate public and private keys
    e = 1987
    d = 3163
    n = 3599
    p = 61
    q = 59

    # Read image
    encrypted_img = open_file(img_path)
    encrypted_img = [int(num) for num in encrypted_img.split(' ')[1:]]
    print(len(encrypted_img))

    # Decrypt image
    decrypted_img = np.array(decryption(encrypted_img, n, d), dtype=np.int).reshape(640, 480)
    print(decrypted_img.shape)

    # Show results
    show_imgs(np.array(encrypted_img, dtype=np.int).reshape(960, 640), decrypted_img)

