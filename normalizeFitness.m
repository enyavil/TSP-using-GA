function [fitness] = normalizeFitness(fitness)

    Sum = sum(fitness);
    for i = 1:size(fitness,2)
        fitness(i) = fitness(i)/Sum;                        %assign a normalized fitness value for every population within the current generation
    end

end