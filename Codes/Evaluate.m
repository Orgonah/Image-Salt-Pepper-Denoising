clear; close all


origin_Baboon = imread("../Baboon.bmp");
origin_Barbara = imread("../Barbara.bmp");
origin_Camera = imread("../Cameraman.bmp");
origin_Pepper = imread("../Pepper.bmp");

for i=30:20:90
    my_Baboon = imread("../Baboon_my" + i + ".bmp");
    my_Barbara = imread("../Barbara_my" + i + ".bmp");
    my_Camera = imread("../Cameraman_my" + i + ".bmp");
    my_Pepper = imread("../Pepper_my" + i + ".bmp");
    
    Baboon_PSNR = psnr(my_Baboon,origin_Baboon);
    Barbara_PSNR = psnr(my_Barbara,origin_Barbara);
    Camera_PSNR = psnr(my_Camera,origin_Camera);
    Pepper_PSNR = psnr(my_Pepper,origin_Pepper);
    AVG_PSNR = (Baboon_PSNR+Barbara_PSNR+Camera_PSNR+Pepper_PSNR)/4;

    disp(['Baboon ' num2str(i) ':   ' num2str(Baboon_PSNR)]);
    disp(['Barbara ' num2str(i) ':   ' num2str(Barbara_PSNR)]);
    disp(['Camera ' num2str(i) ':   ' num2str(Camera_PSNR)]);
    disp(['Pepper ' num2str(i) ':   ' num2str(Pepper_PSNR)]);
    disp(['Average ' num2str(i) ':   ' num2str(AVG_PSNR)]);
    disp(" ")
end