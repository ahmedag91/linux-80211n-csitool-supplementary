function CTF = read_CSI()
% This matlab function aims to read a file in .dat format which stores the
% the measured CSI data. Then it returns the channel transfer function (CTF) as a cell array
% This cell contains Ntx X Nrx matrices, where Ntx and Nrx denote the number of active transmit
% and receive antenna, respectively. Each matrix corresponds to a CTF with dimensions Nf X Nt, where Nf and Nt denote the number of frequency and time bins, respectively. Nf always has a value of 30, whereas Nt is variant depending on the sampling rate dt and how many recording seconds.

    [file_name,dr ] = uigetfile({'*.dat'});
    x = read_bf_file([dr file_name ]);
    CTF = cell(x{1}.Ntx*x{1}.Nrx,1);
    for k = 1:length(CTF)
        CTF{k} = zeros(30,length(x));
    end
    for k = 1:length(x)    
        y = get_scaled_csi(x{k});
        for m = 1:size(y,3)
            z = reshape(y(:,:,m),1,[]);
            for n = 1:length(z)
                 CTF{n}(m,k) = z(n);
            end
        end
    end
end