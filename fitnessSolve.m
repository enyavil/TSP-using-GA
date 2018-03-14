function [solved] = fitnessSolve(index,tempX,tempY,best)

    drawnow
    plot(tempX(index),tempY(index),'-o',tempX(best)+100,tempY(best),'-o','markersize',10)
    grid on
    axis([0 200 0 100])
    solved = 0;                     %no idea how to the criteria for the shortest path so the whole 'solveGenetic' function will run endlessly.. for now

end