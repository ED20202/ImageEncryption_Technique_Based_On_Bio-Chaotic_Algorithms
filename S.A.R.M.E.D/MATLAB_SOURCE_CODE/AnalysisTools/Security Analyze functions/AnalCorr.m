function results = AnalCorr(encimg1, encimg2)
    banner = '<=== Correlation Summary ===>';
    [horiz1, vert1, diag1] = process_single_image(encimg1);
    [horiz2, vert2, diag2] = process_single_image(encimg2);
    
    % Fixed string formatting and added proper ideal explanation
    corr1 = sprintf(...
        ['Encrypted 1:\n' ...
         'Horizontal: %.4f\n' ...
         'Vertical:   %.4f\n' ...
         'Diagonal:   %.4f\n'], horiz1, vert1, diag1);
    
    corr2 = sprintf(...
        ['Encrypted 2:\n' ...
         'Horizontal: %.4f\n' ...
         'Vertical:   %.4f\n' ...
         'Diagonal:   %.4f\n'], horiz2, vert2, diag2);
    
    % Corrected ideal value explanation
    ideal = sprintf(['Ideal for encryption:\n' ...
                    'Values should be close to 0\n' ...
                    '(range [-1, 1], but < 0.1 is good)']);
    
    results = [banner newline corr1 newline corr2 newline ideal];
end

function [horiz_corr, vert_corr, diag_corr] = process_single_image(img)
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = im2double(img);
    % Horizontal pairs
    x_horiz = img(:, 1:end-1);
    y_horiz = img(:, 2:end);
    
    % Vertical pairs
    x_vert = img(1:end-1, :);
    y_vert = img(2:end, :);
    
    % Diagonal pairs
    x_diag = img(1:end-1, 1:end-1);
    y_diag = img(2:end, 2:end);
    
    % Flatten to column vectors
    x_horiz = x_horiz(:); y_horiz = y_horiz(:);
    x_vert = x_vert(:); y_vert = y_vert(:);
    x_diag = x_diag(:); y_diag = y_diag(:);
    
    % Compute correlations
    horiz_corr = corrcoef(x_horiz, y_horiz);
    horiz_corr = horiz_corr(1, 2);
    
    vert_corr = corrcoef(x_vert, y_vert);
    vert_corr = vert_corr(1, 2);
    
    diag_corr = corrcoef(x_diag, y_diag);
    diag_corr = diag_corr(1, 2);
end