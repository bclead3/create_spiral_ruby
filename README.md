5 kyu
The Clockwise Spiral

Do you know how to make a spiral? Let's test it!
Classic definition: A spiral is a curve which emanates from a central point, getting progressively farther away as it revolves around the point.

Your objective is to complete a function createSpiral(N) that receives an integer N and returns an NxN two-dimensional array with numbers 1 through NxN represented as a clockwise spiral.

Return an empty array if N < 1 or N is not int / number

Examples:

`N = 3 Output: [[1,2,3],[8,9,4],[7,6,5]]`
```azure
1    2    3    
8    9    4    
7    6    5   
```
 
`N = 4 Output: [[1,2,3,4],[12,13,14,5],[11,16,15,6],[10,9,8,7]]`
```azure
1   2   3   4
12  13  14  5
11  16  15  6
10  9   8   7
```

`N = 5 Output: [[1,2,3,4,5],[16,17,18,19,6],[15,24,25,20,7],[14,23,22,21,8],[13,12,11,10,9]]`
```azure
1   2   3   4   5    
16  17  18  19  6    
15  24  25  20  7    
14  23  22  21  8    
13  12  11  10  9
```
To test the code, just start the `./run.sh` script with integer argument(s).

`./run.sh 5 7 9`

```azure
[[1, 2, 3, 4, 5],
 [16, 17, 18, 19, 6],
 [15, 24, 25, 20, 7],
 [14, 23, 22, 21, 8],
 [13, 12, 11, 10, 9]]

[[1, 2, 3, 4, 5, 6, 7],
 [24, 25, 26, 27, 28, 29, 8],
 [23, 40, 41, 42, 43, 30, 9],
 [22, 39, 48, 49, 44, 31, 10],
 [21, 38, 47, 46, 45, 32, 11],
 [20, 37, 36, 35, 34, 33, 12],
 [19, 18, 17, 16, 15, 14, 13]]

[[1, 2, 3, 4, 5, 6, 7, 8, 9],
 [32, 33, 34, 35, 36, 37, 38, 39, 10],
 [31, 56, 57, 58, 59, 60, 61, 40, 11],
 [30, 55, 72, 73, 74, 75, 62, 41, 12],
 [29, 54, 71, 80, 81, 76, 63, 42, 13],
 [28, 53, 70, 79, 78, 77, 64, 43, 14],
 [27, 52, 69, 68, 67, 66, 65, 44, 15],
 [26, 51, 50, 49, 48, 47, 46, 45, 16],
 [25, 24, 23, 22, 21, 20, 19, 18, 17]]
```
