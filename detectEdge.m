function img_edge = detectEdge(img, sigma, method, threshold, type)
    img = imgaussfilt(img, sigma);

    switch type
        case 'Red'
            I = img(:,:,1)-img(:,:,2)-img(:,:,3);
        case 'Green'
            I = img(:,:,2)-img(:,:,1)-img(:,:,3);
        case 'Blue'
            I = img(:,:,3)-img(:,:,1)-img(:,:,2);
        otherwise
            I = im2gray(img);
    end

    switch method
        case "Laplace"
            H1 = [1 1 1; 1 -8 1; 1 1 1];
            H2 = [1 1 1; 1 1 1; 1 1 1];
            magnitude = @(c1, c2) c1;
        case "LoG"
            H1 = [0 0 -1 0 0;
                0 -1 -2 -1 0;
                -1 -2 16 -2 -1;
                0 -1 -2 -1 0;
                0 0 -1 0 0];
            H2 = [1 1 1; 1 1 1; 1 1 1];
            magnitude = @(c1, c2) c1;
        case "Sobel"
            H1 = [-1 0 1; -2 0 2; -1 0 1];
            H2 = [1 2 1; 0 0 0; -1 -2 -1];
            magnitude = @(c1, c2) sqrt(c1.^2 + c2.^2); 
        case "Prewitt"
            H1 = [-1 0 1; -1 0 1; -1 0 1];
            H2 = [1 1 1; 0 0 0; -1 -1 -1];
            magnitude = @(c1, c2) sqrt(c1.^2 + c2.^2);
        case "Roberts"
            H1 = [1 0; 0 -1];
            H2 = [0 1; -1 0];
            magnitude = @(c1, c2) sqrt(c1.^2 + c2.^2);
        case "Canny"
            img_edge = edge(I, 'Canny');
            return
        otherwise
    end

    J1 = conv2(double(I), double(H1), 'same');
    J2 = conv2(double(I), double(H2), 'same');
    img_edge = uint8(magnitude(J1, J2)) > threshold;
end