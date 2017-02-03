function [] = quicksort(arr, low, high, n)
%Quick sort algorithm = will sort a hashmap of decoy images histograms
%by their chi-squared distance (value) to the forged image histogram
%return a sorted array of keys (filenames) of size n
%credit to - http://www.programcreek.com/2012/11/quicksort-array-in-java/
if dir == null || isempty(arr)
    return;
end
if low >= high
    return;
end

middle = low + (high-low) /2;
pivot = dir(middle);

i=low; j=high;
while i <= j
    while arr(i) < pivot
        i = i+1;
    end
    while arr(j) < pivot
        j = j-1;
    end
    if i<=j
        temp = arr(i);
        arr(i) = arr(j);
        arr(j) = temp;
        i = i +1;
        j = j -1;
    end
end
if low < j
    quicksort(arr, low, j);
end
if high > i
    quicksort(arr, i ,high);
end
