function out = quicksort(hash, low, high,n)
%Quick sort algorithm = will sort a hashmap of decoy images histograms
%by their chi-squared distance (value) to the forged image histogram
%return a sorted array of keys (filenames) of size n
%credit to - http://www.programcreek.com/2012/11/quicksort-array-in-java/
values_cell = hash.values;
keys_cell = hash.keys;
for i=1:length(values_cell)
values_arr(i) = cell2mat(values_cell(i));
end
for i=1:length(keys_cell)
i
keys_arr(i) = cell2mat(keys_cell(i));
end

if dir == null || isempty(hash.values)
    return;
end
if low >= high
    return;
end

middle = low + (high-low) /2;
pivot = values_arr(middle);

i=low; j=high;
while i <= j
    while values_arr(i) < pivot
        i = i+1;
    end
    while values_arr(j) < pivot
        j = j-1;
    end
    if i<=j
        temp = values_arr(i);
        temp2 = keys_arr(i);
        values_arr(i) = values_arr(j);
        keys_arr(i) = values_arr(j);
        values_arr(j) = temp;
        keys_arr = temp2;
        i = i +1;
        j = j -1;
    end
end
if low < j
    quicksort(arr, low, j,n);
end
if high > i
    quicksort(arr, i ,high,n);
end
out = keys;