function feat = function_lbp(img_gray)
%check condition: if image is gray scale or not, if not execute below
%command or else jump to line 5;
    %img_gray= rgb2gray(img);
    [height, width] = size(img_gray);
    feat = zeros(1,256);
    for i= 2:height -1
        for j = 2:width-1
            neighbors = img_gray(i-1:i+1,j-1:j+1);
            bits = double(neighbors(:));
            threshold = bits(5);
            bits(5) = [];
            bits = bits -threshold;
            bits = sign(bits);
            bits(bits < 0) = 0;
            byte = sum(bits.*2.^(length(bits)-1 : -1 : 0)');
            feat(byte + 1) = feat(byte + 1) + 1;
        end
    end
    feat = feat./sum(feat);
end