function img_filler = detectcolor(img, channel, min_threshold, max_threshold)

    I = imgaussfilt(img, 4);
    
    switch channel
        case {1, 2, 3}
            m = I(:,:,channel) >= min_threshold & I(:,:,channel) <= max_threshold;
        otherwise
            [r,c,~] = size(I);
            m = ones([r,c]);
            disp(sum(sum(m)));
            for c = 1:3
                m = m & I(:,:,c) >= min_threshold & I(:,:,c) <= max_threshold;
                disp(sum(sum(m)));
            end
    end

    img_filler = m;
end