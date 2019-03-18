# roll
Simple lua script to roll a dice

Use it by executing script with a rolls in a dice notation as its' arguments:
```
$ lua roll.lua 2d6+12 3d6
2d6+12 = 23
3d6 = 10
```

It supports addition, subtraction and basic dice rools.
It also supports `l`, `h`, `L`, `H` suffixes to select or discard lowest or highest dice.
Another number may be prepended to state how much dice should be selected/discarded.
```
$ lua roll.lua 10d6l 10d6h 10d6L 10d6H 10d6L5 10d6H5
10d6l = 1
10d6h = 6
10d6L = 36
10d6H = 33
10d6L5 = 27
10d6H5 = 7
```
