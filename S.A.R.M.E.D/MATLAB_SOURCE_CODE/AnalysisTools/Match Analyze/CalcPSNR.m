function banner=CalcPSNR(origi,decimg)
banner='<=== PSNR Summary ===>';
[psnrval,~]=psnr(decimg,origi);
banner = [ banner newline sprintf(...
        'PSNR: %.4f\n(Ideal = inf)', psnrval)];
end