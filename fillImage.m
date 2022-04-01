function img_fill = fillImage(img, radius, fill_threshold)
    se = strel("disk", radius);                     % Morphological structuring element
    close = imclose(img, se);                       % Morphologically close image
    fill = imfill(close, "holes");                  % Fill image holes
    img_fill = bwareaopen(fill, fill_threshold);    % Remove filled area under threshold
end

