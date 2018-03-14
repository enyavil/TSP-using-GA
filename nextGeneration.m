function order = nextGeneration(order,fitness,mutationRate,bestOrder)

%%%create a new generation with the same number of population as the current generation
    newOrder = zeros(size(order,1),size(order,2));
    for i = 1:size(order,1)-1
        chosen = chooseOne(order,fitness);          %choose a next batch of population from the current population. Higher fitness will be selected more often
        if rand < mutationRate
            chosen = mutate(chosen);                %mutate the batch of the chosen according to the mutationRate
        end
        newOrder(i,:) = chosen;
    end
    for i = size(order,1)
        chosen = mutate(bestOrder);
        newOrder(i,:) = chosen;
    end
    order = newOrder;
end