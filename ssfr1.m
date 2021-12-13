close all;
clear;
clc;

i=1;
Label=[]; 
bdd={};

experience = './Dataset';
extension ='JPG';

% Bsif Filters
filename= ['./texturefilters/ICAtextureFilters_17x17_12bit'];
load(filename, 'ICAtextureFilters');
fun = @(x) bsif(x, ICAtextureFilters,'nh');

% filelist = dir([experience,'/*',extension]);
% nfiles = length(filelist);

filePattern = fullfile('*.JPG'); % Change to whatever pattern you need.
theFiles = dir(filePattern);

for ifile = 1 : length(theFiles)
   
    
    baseFileName = theFiles(ifile).name;
    fullFileName = fullfile(baseFileName);
    fprintf('Now reading %s\n', fullFileName);
    
%     fn = filelist(ifile).name;
%     tmp=[experience,'/', fn];
%     fprintf('Now reading %s\n', tmp);
    x=imread(fullFileName); %this is the input face image
        x = im2double(x);

    if(size(x,3) == 1)
        x = repmat(x, [1 1 3]);
    end
    x=imresize(x, [164 120]);
    
    
    r=x(:,:,1);   g=x(:,:,2);    b=x(:,:,3);
   
    %Preprocessing
    r=imadjust(r);    g=imadjust(g);    b=imadjust(b);
    r=medfilt2(r);    g=medfilt2(g);    b=medfilt2(b);
   
   
    % Multi-Bloc decomposition & BSIF Application   ----> H1 vectors
    r1=blockproc(r,[164 120],fun);   g1=blockproc(g,[164 120],fun);    b1=blockproc(b,[164 120],fun);
    r2=blockproc(r,[82 60],fun);     g2=blockproc(g,[82 60],fun);      b2=blockproc(b,[82 60],fun);
    r3=blockproc(r,[41 30],fun);     g3=blockproc(g,[41 30],fun);      b3=blockproc(b,[41 30],fun);
 
   
    r1 = r1(:)';     g1 = g1(:)';  b1 = b1(:)';
    r2 = r2(:)';     g2 = g2(:)';  b2 = b2(:)';
    r3 = r3(:)';     g3 = g3(:)';  b3 = b3(:)';  
   
   
    % H2 vectors
    r = [r1 r2 r3];    g = [g1 g2 g3];   b = [b1 b2 b3];
   
    % H3 final vector
    featureVector = [r1 g1 b1]; %this is the one, use it similarly to VGG face features
   
    filename = [fullFileName,'.csv'];
    csvwrite(filename,featureVector)
   
    i=i+1;
   
    
   
end