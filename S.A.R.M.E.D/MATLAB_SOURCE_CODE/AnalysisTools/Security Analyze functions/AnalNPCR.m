function result=AnalNPCR(origiimg,encimg1,encimg2)
banner='<=== NPCR Summary ===>';
img1=origiimg;
img2=encimg1;
img3=encimg2;
if size(origiimg,3)==3
img1=rgb2gray(img1);
img2=rgb2gray(img2);
img3=rgb2gray(img3);
end
[row,col]=size(img1);
D1 = (img1 ~= img2); 
D2 = (img1 ~= img3); 
npcr1=(sum(D1(:)) / (row * col)) * 100;
npcr2=(sum(D2(:)) / (row * col)) * 100;
  result = [banner newline sprintf(...
        'Encrypted 1: %.4f\nEncrypted 2: %.4f\n(Ideal >=99.6%%)', npcr1, npcr2)];

end