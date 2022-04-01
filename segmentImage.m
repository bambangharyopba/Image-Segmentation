function img_seg = segmentImage(img, img_edge, img_fill)
    clean_edge = (img_edge & img_fill);     % remove irrelevant edges
    mask = clean_edge | img_fill;
    mask_image = ~cat(3, mask, mask, mask);
    img_seg = img;
    img_seg(mask_image) = 0;
end

