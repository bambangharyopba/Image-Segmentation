img_path = "img/mango.jpg";

g = gcf;
g.WindowState = 'maximized';

img = imread(img_path);
img_edge = detectEdge(img, 2, "Canny", 15, "Red");
img_fill= fillImage(img_edge, 40, 7000);
img_seg = segmentImage(img, img_edge, img_fill);

subplot(2, 2, 1); imshow(img); title('Original Image');
subplot(2, 2, 2); imshow(img_edge); title('Edge Image');
subplot(2, 2, 3); imshow(img_fill); title('Fill Image');
subplot(2, 2, 4); imshow(img_seg); title('Segmented Image');