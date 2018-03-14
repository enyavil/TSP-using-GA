function chosen = chooseOne(order,fitness)
%carried on to the next gen
    r = rand;
    index = 1;

    while r > 0
        r = r - fitness(index);
        index = index + 1;
    end
    index = index - 1;
    chosen = order(index,:);

end