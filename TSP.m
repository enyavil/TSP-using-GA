clear;clc;
%% number of random data points
n = 9;

%% size of map
width = 100;
height = 100;

%% parameters for the genetic algorithm
numberPopulation = 1000;        %number of orders per generation
mutationRate = 1;               %rate of mutations within the population
counter = 0;

%% assigning n random points within map

pointX = zeros(1,n);
pointY = zeros(1,n);
array = zeros(1,n);

for i = 1:n
   pointX(1,i) = randi(width-1);
   pointY(1,i) = randi(height-1);
end

%% genetic algorithm search

origX = pointX; origY = pointY;     %assign original order of the points in a separate array
order = zeros(numberPopulation,n);
gen = 1;                            %initial generation counter

for i = 1:numberPopulation
    order(i,:) = randperm(n);                   %order of the indeces.. pick from all possible permutations
    pointX(i,:) = origX(order(i,:));            %X and Y are the coord of the population of current generation
    pointY(i,:) = origY(order(i,:));
end

bestRecord = Inf; bestOrder = 0;    %set bestRecord to Inf and bestOrder to none as default
solved = 0;                         %define if the bestRecord is the solution; unsolved initially

while solved ~= 1                   %while bestRecord is not the solution, repeat process
    [solved,order,gen,bestRecord,bestOrder] = solveGenetic(order,pointX,pointY,gen,bestRecord,bestOrder,origX,origY,mutationRate);
    pointX = origX(order);         %assign a new set of population into the functino 'solveGenetic'
    pointY = origY(order);
end