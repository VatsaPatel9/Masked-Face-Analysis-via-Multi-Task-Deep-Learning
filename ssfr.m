close all;
clear all;
clc;

% Bsif Filters
filename=['./texturefilters/ICAtextureFilters_17x17_12bit'];
load(filename, 'ICAtextureFilters');
fun = @(x) bsif(x, ICAtextureFilters,'nh');

filelist = dir([experience,'/*',extension]);
nfiles = length(filelist);

for ifile = 1:nfiles
    
    fn = filelist(ifile).name;
    tmp=[experience,'/', fn];
    x=imread(tmp); %this is the input face image
    x=imresize(x, [164 120]);
    
    r=x(:,:,1);   g=x(:,:,2);    b=x(:,:,3);
    
    %Preprocessing
    r=imadjust(r);    g=imadjust(g);    b=imadjust(b);
    r=medfilt2(r);    g=medfilt2(g);    b=medfilt2(b);
    
    
    % Multi-Bloc decomposition & BSIF Application   ----> H1 vectors
    r1=blkproc(r,[164 120],fun);   g1=blkproc(g,[164 120],fun);    b1=blkproc(b,[164 120],fun);
    r2=blkproc(r,[82 60],fun);     g2=blkproc(g,[82 60],fun);      b2=blkproc(b,[82 60],fun);
    r3=blkproc(r,[41 30],fun);     g3=blkproc(g,[41 30],fun);      b3=blkproc(b,[41 30],fun);
    
    
    r1 = r1(:)';     g1 = g1(:)';  b1 = b1(:)';
    r2 = r2(:)';     g2 = g2(:)';  b2 = b2(:)';
    r3 = r3(:)';     g3 = g3(:)';  b3 = b3(:)';
    
    
    % H2 vectors
    r = [r1 r2 r3];    g = [g1 g2 g3];   b = [b1 b2 b3];
    
    % H3 final vector
    featureVector=[r g b]; %this is the one, use it similarly to VGG face features
    
    
    i=i+1;
    
end

