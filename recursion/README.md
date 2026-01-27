# Project: Recursion

This was a small project, where the goal was to become a little more comfortable
using recursion to solve a couple classic problems. 

The first was the fibonacci sequence, which was a welcome challenge. It was a bit 
difficult to figure out how to return a sequence array with only one parameter (for 
the length of the array), so I ended up using a second parameter to pass through the 
sequence array.

The second part of the assignment was merge sort. The basic algorithm works as 
follows:
- Base case: if the array length is 1 or zero, return the array as sorted
- Sort the first half of the array (recursively)
- Sort the second half of the array (recursively)
- Merge the two sorted arrays
- Return the merged array