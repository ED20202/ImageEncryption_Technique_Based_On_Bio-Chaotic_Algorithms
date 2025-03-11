function key=DecryptKey(initikey,firstimg,secondimg)
%<==================== Calculate First image hash ========================>
newimage=firstimg(:);
imgHash1=java.security.MessageDigest.getInstance('SHA-256');
imgHash1.update(newimage);
imgHash1=typecast(imgHash1.digest(),'uint8');
imgHash1=sprintf('%.2x',imgHash1);
%<==================== Calculate Second image hash =======================>
newimage=secondimg(:);
imgHash2=java.security.MessageDigest.getInstance('SHA-256');
imgHash2.update(newimage);
imgHash2=typecast(imgHash2.digest(),'uint8');
imgHash2=sprintf('%.2x',imgHash2);
%<======================= Decryption Key full ============================>
key=[initikey,imgHash1,imgHash2];
end