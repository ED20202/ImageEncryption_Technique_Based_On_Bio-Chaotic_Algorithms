function SaveImage(imageName,image)
 cd('C:')
 [fileName,pathName]=uiputfile({ '*.png',"PNG (*.png)";...
                                 '*.bmp',"BITMAP (*.bmp)";},...
                                 'Save As',imageName);
    
      path = fullfile(pathName,fileName);
      imwrite(image,path)
end