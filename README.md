When I first started The Odin Project and many terms and prepositions were completely foreign to me, there was one phrase that stuck with me for some reason. 'Knights Travails'. This project name sounds cool, and it stuck with me. As I have progressed through the curiculum, I was so excited to see I was at this project. And now it is complete! I see that I have added much more complexity than was called for even before seeing others' solutions, but I am happy I have made this step. I look forward to more projects and learning more!

This is a project assigned in The Odin Project curriculum. In this project, we are expected to exercise some knowledge of graph theory. Before this project, we worked on binary search trees. In this problem, the trees are no longer binary.

In this problem, we must not only create a tree that includes the optimal 'path' for the knight to travail. We must also report this path back. My solution to this was rather than having nodes point back to their parent, I created #find_path for Tree. This method starts at the end point of the path (which is given), and it searches for the node that contains that end point value. Once that parent is found, it finds the parent of the parent. And so on. 

Steps provided from The Odin Project:
1.  Put together a script that creates a game board and a knight.
2.  Treat all possible moves the knight could make as children in a tree. Don’t allow any moves to go off the board.
3.  Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
4.  Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like, e.g.:

  > knight_moves([3,3],[4,3])
  => You made it in 3 moves!  Here's your path:
    [3,3]
    [4,5]
    [2,4]
    [4,3]

You can think of the board as having 2-dimensional coordinates. Your function would therefore look like:

knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]
