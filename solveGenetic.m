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

function [fitness] = normalizeFitness(fitness)

Sum = sum(fitness);
for i = 1:size(fitness,2)
    fitness(i) = fitness(i)/Sum;                        %assign a normalized fitness value for every population within the current generation
end

end

function [solved] = fitnessSolve(index,tempX,tempY,best)

    drawnow
    plot(tempX(index),tempY(index),'-o',tempX(best)+100,tempY(best),'-o','markersize',10)
    grid on
    axis([0 200 0 100])
    solved = 0;                     %no idea how to the criteria for the shortest path so the whole 'solveGenetic' function will run endlessly.. for now

end

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

function chosen = chooseOne(order,fitness)

r = rand;
index = 1;

while r > 0
    r = r - fitness(index);
    index = index + 1;
end
index = index - 1;
chosen = order(index,:);

end

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