# Bitmap editor

..

# Running

`>bin/bitmap_editor examples/show.txt`

# Notes

With the last commit we can now probably remove the raises and just return any errors
from the methods directly. These errors are likely given the user input so I didn't
really see them as exceptional cases to begin with but it got me started.

There could be a bit more error checking around `horizontal` and `vertical` methods but
these would be better served by shared examples. These may also be good candidates
for some refactoring and the error messages need to really mention the Xn and Yn args
rather than the generic X and Y args of `apply`.
