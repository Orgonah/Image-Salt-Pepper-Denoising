function output = counter(image)
    p=10;
    [y_image, x_image] = size(image);
    W=17;
    a = W - ceil(W/2);
    cOut = 0;
    for y=1:y_image-2*p
        for x=1:x_image-2*p
            if(image(p+y,p+x) == 0 || image(p+y,p+x) == 255)
                bCounter = 0;
                wCounter = 0;

                for i=-a:a
                    for j=-a:a
                        temp = image(p+y+i, p+x+j);
                        if(temp == 0)
                            bCounter = bCounter+1;  
                        elseif(temp == 255)
                            wCounter = wCounter+1;
                        end
                    end
                end  
                if (bCounter + wCounter == W*W)
                        if(image(p+y,p+x) == 255*(bCounter>wCounter))
                            cOut = cOut+2;
                        end

                else
                    cOut = cOut+1;
                end
            end
        end
    end
    
    Out = cOut/((y_image-2*p)*(x_image-2*p));

    if(Out<=0.35)
        output=1;
    elseif(Out<=0.6)
        output=2;
    elseif(Out<=0.71)
        output=3;
    elseif(Out<=0.74)
        output=4;
    elseif(Out<=0.8)
        output=5;
    elseif(Out<=0.82)
        output=6;
    elseif(Out<=0.84)
        output=7;
    elseif(Out<=0.87)
        output=8;
    elseif(Out<=0.91)
        output=9;
    elseif(Out<=0.92)
        output=12;
    elseif(Out<=0.95)
        output=18;
    elseif(Out<=0.97)
        output=35;
    else
        output=70; 
    end
end