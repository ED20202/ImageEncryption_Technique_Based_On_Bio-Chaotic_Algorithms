function [output1,output2,key]=Bio_Chaotic_Encryption(picture,initikey)
[rows,cols,depth]=size(picture);
%<Use initial key to get XYZ values=======================================>
 [x,y,z]=Transform_initi_Key(initikey);
%<Genetic information=====================================================>
bitlength = 8;
cp1 = 2; % Crossover point 1
cp2 = 4; % Crossover point 2
%<Bio-Chaotic-Encryption==================================================>
chaotic=Chaotic_Selection(rows,cols,2,x,y,z); % GA Selection Process
if depth < 3
chaotic=rgb2gray(chaotic);% If image was gray convert mask to gray
end
[output1,output2]=Crossover_And_Mutation...
(rows,cols,depth,chaotic,picture,cp1,cp2,bitlength);
key=DecryptKey(initikey,output1,output2);
end