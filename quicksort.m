function [] = quicksort(arr, low, high)
%Quick sort algorithm = will sort an array of decoy images histograms
%by their chi-squared distance to the forged image histogram
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
