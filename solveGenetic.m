function [solved,order,gen,bestRecord,bestOrder] = solveGenetic(order,X,Y,gen,bestRecord,bestOrder,origX,origY,mutationRate)

    [fitness,current] = calcFitness(X,Y);                           %calculate the fitness of the current population
    [fitness] = normalizeFitness(fitness);                          %normalize the fitness within the current population
    [currentRecord, currentOrderIndex] = min(current);              %save the best record within the current population and its index
    currentOrder = order(currentOrderIndex,:);                      %save the order of the current best
    if currentRecord < bestRecord
        bestRecord = currentRecord;                                 %if the currentRecord is more optimized than the bestRecord, replace the bestRecord
        bestOrder = currentOrder;                                   %also save the order of the current best 
    end
    [solved] = fitnessSolve(currentOrder,origX,origY,bestOrder);    %check if the bestRecord is the solution
    if solved ~= 1                                                  %if the bestRecord is the solution, do not reproduce a next generation
        [order] = nextGeneration(order,fitness,mutationRate,bestOrder);       %create new generation of the population
        gen = gen + 1                                              %generation counter
    end
    
end
