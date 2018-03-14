function [fitness,current] = calcFitness(X,Y)

    s = size(X);
    fitness(s(1)) = 0;
    current(s(1)) = 0;

    for i = 1:s(1)
        for j = 2:s(2)
            dx = abs(X(i,j) - X(i,j-1));
            dy = abs(Y(i,j) - Y(i,j-1));
            current(i) = current(i) + sqrt(dx^2 + dy^2);    %compute the distance of the population
        end
        fitness(i) = 1/(current(i)+1);                      %assign an individual fitness value 
    end

end