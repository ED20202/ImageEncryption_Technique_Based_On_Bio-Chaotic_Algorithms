function [fileName,pathName]=Read_Path()
[fileName,pathName]=uigetfile({'*.jpg;*.jepg;*.png;*.bmp', 'Image Files(*.jpg,*jpeg ,*.png, *.bmp)'},'Select an image');
end