function output = myfunc(input1,input2)
    if nargin == 1
        input2 = 1;
    end
    if(input2 ==1)
        output = f1(input1);
    else
        output = f2(input1);
    end
end
function out = f1(in)
    out = sin(in);
end

function out = f2(in)
    out = cos(in);
end