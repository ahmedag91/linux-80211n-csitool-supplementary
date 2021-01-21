## Description and How to Run

The files in this folder are just an incremental work added to the original [CSI tool](https://github.com/dhalperi/linux-80211n-csitool-supplementary). The in this folder files were implemented in Matlab 2019b. The purpose of these files is to process the measured raw CSI data and compute the true micro-Doppler signatures by means of the spectrograms. The Matlab files are documented. Just run the `main.m` file in Matlab and it will ask to choose a file with `.dat` extension. This file should contain the collected raw CSI data. If you find this library is useful for your research work, please cite the papers below


## What Does these `.m` Files Do?
This folder contains the following files with brief descriptions

- `calibrate_CTF.m`: This file calibrates the measured CTF by applying element-wise division.
- `plotting.m`: This file has plotting function that can be called. This function was made to reduce the repitions of the code.
- `surfing.m`: This file contains a surfing functions, which plots a heat map.
- `read_CSI.m`: This file contains a code that reads the recorded CSI from `.dat` file. Then it reconstructs the CTF.
- `main.m`: The main file to run. It reads the CSI data to construct the CTF, calibrate the CTF, apply the highpass filtering and/or the principle component analysis (PCA) to denoise the data. Then it computes the spectrogram of the denoised data and display it using the function implemented in `surfing.m`.

## Citation

```bash
@INPROCEEDINGS{9129187,
        author={A. {Abdelgawwad} and A. {Catal{\`}a} and M. {P{\"}atzold}},
        booktitle={2020 IEEE 91st Vehicular Technology Conference (VTC2020-Spring)},
        title={Doppler Power Characteristics Obtained from Calibrated Channel State Information for Human Activity Recognition},
        year={2020},
        volume={},
        number={},
        pages={1-7},
        doi={10.1109/VTC2020-Spring48590.2020.9129187}
    }
```
```bash
@ARTICLE{9187210,
        author={M. {Muaaz} and A. {Chelli} and A. A. {Abdelgawwad} and A. C. {Mallofr{\'}e} and M. {P{\"}{a}tzold}},
        journal={IEEE Access},
        title={WiWeHAR: Multimodal Human Activity Recognition Using Wi-Fi and Wearable Sensing Modalities},
        year={2020},
        volume={8},
        number={},
        pages={164453-164470},
        doi={10.1109/ACCESS.2020.3022287}
    }
```
