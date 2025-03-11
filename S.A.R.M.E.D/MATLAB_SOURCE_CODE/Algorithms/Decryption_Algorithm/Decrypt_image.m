function Decimg = Decrypt_image(first_child, second_child,initkey)
%<====================== Genetic Information =============================>
[rows, cols, depth] = size(first_child);
bitlength = 8;
cp1 = 2;
cp2 = 4;
%<================== Replicate chaotic mask for decryption ===============>
[x,y,z]=Transform_initi_Key(initkey);
chaotic=Chaotic_Selection(rows,cols,2,x,y,z);
%<====== Conversion to binary for children to reconstruct the image ======>
firstbin = de2bi(first_child, bitlength, 'left-msb');
secondbin = de2bi(second_child, bitlength, 'left-msb');
%<===== Conversion to binary for children to reconstruct the image =======>
if depth==1
 chaotic=rgb2gray(chaotic); % if image is gray mask is gray too
end
chaoticbin = de2bi(chaotic, bitlength, 'left-msb');
%<===================== Reversal of Crossover ============================>
img_part1 = secondbin(:, end-cp1+1:end);
img_part2 = firstbin(:, (bitlength - cp2 + 1):(bitlength - cp1)); 
img_part3 = secondbin(:, 1:(bitlength - cp2));
original_bin = [img_part1, img_part2, img_part3];
original_bin = bitxor(original_bin, chaoticbin); % Reversal of mutation
%<===================== Reshape to Image format and done =================>
origi = bi2de(original_bin, 'left-msb');
Decimg = reshape(origi, rows, cols, depth);
end