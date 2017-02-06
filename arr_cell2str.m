function [string_arr] = arr_cell2str(cell_arr)
for i=1:length(cell_arr)
    string_arr(i) = cell2str(cell_arr(i));
end