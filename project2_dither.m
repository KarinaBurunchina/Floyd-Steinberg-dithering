function robt310_project2_dither(input_file_name, output_file_name, part)

img = imread(input_file_name); %get image 

if size(img,3) == 3         % if rgb -> convert to grayscale
    img = rgb2gray(img);
end
[r, c] = size(img);     % find size of input image
new_img = double(img)./255; %normalize image 

if part == 0
    
    figure 
    subplot(1, 2, 1);   
    imshow(img);
    title('Original (grayscale)');

    for i = 1:r-1   % go from top to bottom through every row of image
        for j = 2: c-1 % go from left to right through every column
            old = new_img(i, j);    %get pixel of image's particular coordinate
            new = round(old );  %rounding pixel's value (before every pixel was normalized)

            new_img(i, j) = new;    %assign new rounded value for the same coordinate
            err = old - new; % get error

            %special pattern of Floyd-steinberg dithering
            new_img(i, j+1) = new_img(i, j+1) + err*7/16;
            new_img(i+1, j-1) = new_img(i+1, j-1) + err*3/16;
            new_img(i+1, j) = new_img(i+1, j) + err*5/16;
            new_img(i+1, j+1) = new_img(i+1, j+1) + err*1/16;
        end
    end

    subplot(1, 2, 2);
    imshow(new_img);
    title('Floyd-Steinberg dithering');
    imwrite(new_img, output_file_name);
else
    fprintf('Not implemented additional method \n')
end
end