function banner = CalcMSE(origi, decimg)
    banner='<=== MSE Summary ===>';
    origi = double(origi);
    decimg = double(decimg);
    mseval = mean((origi(:) - decimg(:)).^2);
    banner = [banner newline  sprintf(...
        'MSE: %.4f\n(Ideal = 0)', mseval)];
end