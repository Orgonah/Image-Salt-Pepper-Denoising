clear; close all


for i=30:20:90
    SP_Baboon = imread("../Images/Baboon_SP" + i + ".bmp");
    SP_Barbara = imread("../Images/Barbara_SP" + i + ".bmp");
    SP_Camera = imread("../Images/Cameraman_SP" + i + ".bmp");
    SP_Pepper = imread("../Images/Pepper_SP" + i + ".bmp");


    Out_Baboon = my_filter(SP_Baboon);
    Out_Barbara = my_filter(SP_Barbara);
    Out_Camera = my_filter(SP_Camera);
    Out_Pepper = my_filter(SP_Pepper);

    imwrite(Out_Baboon, "../Images/Baboon_my" + i + ".bmp");
    imwrite(Out_Barbara, "../Images/Barbara_my" + i + ".bmp");
    imwrite(Out_Camera, "../Images/Cameraman_my" + i + ".bmp");
    imwrite(Out_Pepper, "../Images/Pepper_my" + i + ".bmp");

    % SP = imread("../Untitle_SP" + i + ".bmp");
    % Out = my_filter(SP);
    % imwrite(Out,"../Untitle_my" + i + ".bmp");
end
