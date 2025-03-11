function banner=CalcSTD(origi,decimg)
banner='<=== STD Summary ===>';
stdval=std(double(origi(:))-double(decimg(:)));
banner = [banner newline  sprintf(...
        'STD: %.4f\n(Ideal = 0)', stdval)];
end
