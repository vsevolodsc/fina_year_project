function [] = quicksort(hash, low, high, n)
%Quick sort algorithm = will sort a hashmap of decoy images histograms
%by their chi-squared distance (value) to the forged image histogram
%return a sorted array of keys (filenames) of size n
%credit to - http://www.programcreek.com/2012/11/quicksort-array-in-java/
values_cell = hash.values
keys_cell = hash.keys
for i=1:length(values_cell)
values(i) = cell2mat(values_cell(i));
end
for i=1:length(keys_cell)
values(i) = cell2mat(keys_cell(i));
end

if dir == null || isempty(hash.values)
    return;
end
if low >= high
    return;
end

middle = low + (high-low) /2;
pivot = values(middle);

i=low; j=high;
while i <= j
    while values(i) < pivot
        i = i+1;
    end
    while values(j) < pivot
        j = j-1;
    end
    if i<=j
        temp = values(i);
        temp_key = keys(i);
        values(i) = values(j);
        keys(i) = values(j);
        values(j) = temp;
        keys = temp2;
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
