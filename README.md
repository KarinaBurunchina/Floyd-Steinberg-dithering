# Floyd-Steinberg-dithering
The main task was to apply Floyd-Steinberg dithering to the image. Using Matlab

# In the function:
1. An input image is converted to a gray-scale one. Also, the number of size and columns are obtained by size(). The matrix of a new image is based on a normalized input image:

```Matlab
img = imread(input_file_name);
img_gray = rgb2gray(img);
[r, c] = size(img_gray);
new_img = double(img_gray)./255;
```
2. Then going from top to bottom through rows and, simultaneously, from left to right through columns, the main dithering is performed. Each pixel undergoes, firstly, rounding. Then, the corresponding position in the new dithered image is assigned to the rounded ‘old’ pixel. The error between the rounded and unrounded values is computed. The values of pixels holding the pattern are calculated using the obtained error.

```Matlab
old = new_img(i, j);
new = round(old );
new_img(i, j) = new;
err = old - new;

new_img(i, j+1) = new_img(i, j+1) + err*7/16;
new_img(i+1, j-1) = new_img(i+1, j-1) + err*3/16;
new_img(i+1, j) = new_img(i+1, j) + err*5/16;
new_img(i+1, j+1) = new_img(i+1, j+1) + err*1/16;
```
3. The Floyd-Steinberg dithered image is obtained:

![alt text](https://github.com/KarinaBurunchina/Floyd-Steinberg-dithering/blob/main/Dithered_task2.png)



