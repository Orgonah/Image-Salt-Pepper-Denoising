clear; close all

%% BESTS:
% 30->5
% 50->7
% 70->11
% 90->35

W = 3;
for i=30:20:90
    SP_Baboon = imread("../Baboon_SP" + i + ".bmp");
    SP_Barbara = imread("../Barbara_SP" + i + ".bmp");
    SP_Camera = imread("../Cameraman_SP" + i + ".bmp");
    SP_Pepper = imread("../Pepper_SP" + i + ".bmp");
    
    Out_Baboon = medfilt2(SP_Baboon,[W W],"symmetric");
    Out_Barbara = medfilt2(SP_Barbara,[W W],"symmetric");
    Out_Camera = medfilt2(SP_Camera,[W W],"symmetric");
    Out_Pepper = medfilt2(SP_Pepper,[W W],"symmetric");
    
    imwrite(Out_Baboon, "../Baboon_Med" + i + ".bmp");
    imwrite(Out_Barbara, "../Barbara_Med" + i + ".bmp");
    imwrite(Out_Camera, "../Cameraman_Med" + i + ".bmp");
    imwrite(Out_Pepper, "../Pepper_Med" + i + ".bmp");
end

