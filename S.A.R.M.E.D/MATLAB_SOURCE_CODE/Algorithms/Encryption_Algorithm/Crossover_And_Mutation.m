function [firstchild,secondchild]=Crossover_And_Mutation(rows,cols,depth...
    ,chaotic,image,cp1,cp2,bitlength)
%<------------------------------------------------------------------------>
% Conversion to binary
imgbin = de2bi(image, bitlength, 'left-msb');
chaoticbin = de2bi(chaotic, bitlength, 'left-msb');
%<------------------------------------------------------------------------>
% Mutation
imgbin=bitxor(imgbin,chaoticbin);
%<------------------------------------------------------------------------>
% Crossover
first_child = [chaoticbin(:, cp2+1:end),...
               imgbin(:, cp1+1:cp2),...
               chaoticbin(:, 1:cp1) ];

second_child = [imgbin(:, cp2+1:end),...
                chaoticbin(:, cp1+1:cp2),...
                imgbin(:, 1:cp1) ];
%<------------------------------------------------------------------------>
% Convert binary back to decimal
first = bi2de(first_child,'left-msb');
second = bi2de(second_child,'left-msb');
%<------------------------------------------------------------------------>
% Reshape to image format
firstchild = reshape(first, rows, cols, depth);
secondchild = reshape(second, rows, cols, depth);
end