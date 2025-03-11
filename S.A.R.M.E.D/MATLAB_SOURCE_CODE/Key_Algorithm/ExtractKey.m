function [firstimg, secondimg, initkey] = ExtractKey(key, enc1, enc2)
initkey=key(1:16);
check=DecryptKey(initkey,enc1,enc2);
if strcmp(check,key)
firstimg=enc1;
secondimg=enc2;
return;
else   
check=DecryptKey(initkey,enc2,enc1);
if strcmp(check,key)
firstimg=enc2;
secondimg=enc1;
return;
end
end
firstimg=[];
secondimg=[];
errordlg('Selected images or key might be invalid try again',' Error','modal');
end