clc;
clear all;
close all;
% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
imagefiles = dir('*.JPG');      
nfiles = length(imagefiles);    % Number of files found

for i=1:nfiles
   currentfilename = imagefiles(i).name;
   currentimage = imread(currentfilename);
   images{i} = currentimage;
   %feat = function_lbp(currentimage);
   
end

for i = 1:nfiles
    feat{i} = function_lbp(images{i});
end
% Convert cell to a table and use first row as variable names
for i = 1:nfiles
    T = cell2table(feat(1:end,i));
    % Write the table to a CSV file
    my_directory = 'path';
    path = fullfile(my_directory, ['\',imagefiles(i).name,'.csv']);
    writetable(T,path);
    
end