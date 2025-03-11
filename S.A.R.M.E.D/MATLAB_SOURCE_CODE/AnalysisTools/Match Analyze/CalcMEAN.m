function banner = CalcMEAN(origi,decimg)
    banner='<=== MEAN Summary ===>';
    image1 = double(origi);
    image2=double(decimg);
    mseval1 = mean(image1(:));
    mseval2 = mean(image2(:));
    banner = [banner newline sprintf(...
        'original: %.4f\n Decrypted: %.4f\n(Ideal original=Decrypted)', mseval1, mseval2)];
end