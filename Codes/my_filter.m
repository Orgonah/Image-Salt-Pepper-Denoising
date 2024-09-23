function output = my_filter(image)
    [y_image, x_image] = size(image);
    % Padding
    p=10;
    padded = padarray(image,[p p],"replicate");
    % Out = zeros(size(image));
    bin = zeros(size(image));
    for y=1:y_image
        for x=1:x_image
            if(image(y,x)==0 || image(y,x)==255)
                bin(y,x)=1;
            end
        end
    end
    u=0;
    count = counter(padded);
    %count = 18;
    if(count==1)
        u=1;
    elseif(count==2 || count==3)
        u=2;
    elseif(count<=5)
        u=4;
    elseif(count<=9)
        u=7;
    else
        u=9;
    end
    % Kernel Size
    W=3;
    a = W - ceil(W/2);

    % Kernel
    main_kernel = fspecial("gaussian",[W W],W/6);
    for k=1:count
        Out = zeros(size(image));
        for y=1:y_image
            for x=1:x_image
                s = bin(y,x);
                if(s == 1)
                    kernel = main_kernel;
                    sum = 0.0;  
                    for i=-a:a
                        for j=-a:a
                            temp = padded(p+y+i, p+x+j);
                            if(temp == 0 || temp == 255) 
                                kernel(i+a+1, j+a+1) = 0;
                            end
                            sum=sum+kernel(i+a+1, j+a+1);
                        end
                    end

                    if (sum == 0)
                        bcounter=0;
                        wcounter=0;
                        aa=a+u;
                        for i=-aa:aa
                            for j=-aa:aa
                                temp = padded(p+y+i, p+x+j);
                                if(temp == 0)
                                    bcounter = bcounter+1;
                                elseif(temp == 255)
                                    wcounter = wcounter+1;
                                end
                            end
                        end
                        Out(y,x) = 255*(wcounter>bcounter);
                        %Out(y,x) = image(y,x);
                    else    
                        kernel = kernel.*(1/sum);
                       
                        for i=-a:a
                            for j=-a:a
                                q = kernel(i+a+1, j+a+1) * double(padded(p+y+i, p+x+j));
                                Out(y,x) = Out(y,x) + q;
                            end
                        end
                    end
                else
                    Out(y,x) = image(y,x);
                end
                
            end
        end
        padded=padarray(uint8(Out),[p p],"replicate");
    end

    output = uint8(Out);
end


