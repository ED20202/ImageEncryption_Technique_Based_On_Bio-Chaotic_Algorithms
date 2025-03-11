function results = AnalUACI(origiimg, encimg1,encimg2)
%<========================================================================>
banner='<=== UACI Summary ===>';
img1=origiimg;
img2=encimg1;
img3=encimg2;
if size(origiimg, 3) == 3 && size(encimg1, 3) == 3 && size(encimg2, 3) == 3
   img1 =rgb2gray(img1);
   img2 =rgb2gray(img2);
   img3=rgb2gray(img3);
end
%<========================================================================>
[row, col] = size(img1);
diff = abs(double(img2) - double(img1));
uaci1 = (sum(diff(:)) / (row * col) / 255) * 100;

diff = abs(double(img3) - double(img1));
uaci2 = (sum(diff(:)) / (row * col) / 255) * 100;
    
results = [banner newline sprintf(...
        'Encrypted 1: %.4f\nEncrypted 2: %.4f\n(Ideal ~=33.3%%)', uaci1, uaci2)];
end