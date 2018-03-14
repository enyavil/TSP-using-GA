function chosen = mutate(chosen)
%%% choose two elements from the array and swap them
    n = size(chosen,2);
    temp = randi(n); temp2 = temp;
    while temp2 == temp
        temp2 = randi(size(chosen,2));
    end
    num1 = chosen(temp); num2 = chosen(temp2);
    [num1,num2] = swap(num1,num2);
    chosen(temp) = num1; chosen(temp2) = num2;
end

function [num2,num1] = swap(num1,num2)              %just a simple swap
end