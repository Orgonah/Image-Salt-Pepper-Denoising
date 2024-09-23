clear; clc; close all

% origin_Baboon = imread("../Baboon.bmp");
% origin_Barbara = imread("../Barbara.bmp");
% origin_Camera = imread("../Cameraman.bmp");
% origin_Pepper = imread("../Pepper.bmp");
origin = imread("../Untitle.bmp");

for i=30:20:90
    % SP_Baboon = imnoise(origin_Baboon,'salt & pepper',i/100);
    % SP_Barbara = imnoise(origin_Barbara,'salt & pepper',i/100);
    % SP_Camera = imnoise(origin_Camera,'salt & pepper',i/100);
    % SP_Pepper = imnoise(origin_Pepper,'salt & pepper',i/100);
    % 
    % imwrite(SP_Baboon, "../Baboon_SP" + i + ".bmp");
    % imwrite(SP_Barbara, "../Barbara_SP" + i + ".bmp");
    % imwrite(SP_Camera, "../Cameraman_SP" + i + ".bmp");
    % imwrite(SP_Pepper, "../Pepper_SP" + i + ".bmp");
    SP = imnoise(origin,'salt & pepper',i/100);
    imwrite(SP, "../Untitle_SP" + i + ".bmp");


end