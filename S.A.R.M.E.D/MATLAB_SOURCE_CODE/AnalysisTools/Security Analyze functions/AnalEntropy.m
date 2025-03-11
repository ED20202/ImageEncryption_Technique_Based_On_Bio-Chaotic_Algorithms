function result = AnalEntropy(enc1, enc2)
if size(enc1,3)==3
    enc1=rgb2gray(enc1);
    enc2=rgb2gray(enc2);
end
    banner = '<=== Entropy Summary ===>'; 
    ent1 = entropy(enc1);
    ent2 = entropy(enc2);
        result = [banner newline sprintf(...
        'Encrypted 1: %.4f\nEncrypted 2: %.4f\n(Ideal >=7.9)', ent1, ent2)];
end