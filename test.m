img_path = "img/banana.jpg";

g = gcf;
g.WindowState = 'maximized';

img = imgaussfilt(imread(img_path), 2);
img_edge = detectEdge(img, "Sobel", 15, "red");
img_mask = bwareaopen(imfill(imclose(img_edge, strel("disk", 20)), "holes"), 7000);
subplot(2, 2, 1); imshow(img); title('Original Image');
subplot(2, 2, 2); imshow(img_edge); title('Edge Image');
subplot(2, 2, 3); imshow(img_mask); title('Mask Image');

mask = (img_edge & img_mask) | img_mask;
mask_image = ~cat(3, mask, mask, mask);
img_seg = img;
img_seg(mask_image) = 0;
subplot(2, 2, 4); imshow(img_seg); title('Segmented Image');