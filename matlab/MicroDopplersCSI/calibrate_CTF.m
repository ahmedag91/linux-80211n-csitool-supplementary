function CTF = calibrate_CTF(CTFs, num, denom)
    %This function aims to calibrate the CSI data given the CTF cell as input
    % Syntax: plotting(CTFs, num, denom)
    % CTFs: channel transfer functions input (Cell array)
    % num: numerator index input (single value)
    % denom: denominator index input (single value)
    % CTF: the calibrated output CTF (matrix)
    CTF = CTFs{num}./CTFs{denom};
end