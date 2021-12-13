close all;
clear;
clc;

run  './matconvnet/matlab/vl_setupnn'

% load the 227MB pre-trained CNN
net = load('vgg-face.mat') ;

% Fix any compatibility issues with the network
% net = vl_simplenn_tidy(net) ;
%% 'panda.png' + 0.7 * 'namatode_panda.png' = dishcloth;
%% 'trump.png' + 0.1 *

myFolder = 'C:\Users\19378\Documents\MATLAB\MixedReality\vgg\data';
csvFiles = 'C:\Users\19378\Documents\MATLAB\MixedReality\vgg\csvfiles';

filePattern = fullfile('*.JPG'); % Change to whatever pattern you need.
theFiles = dir(filePattern);


for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(baseFileName);
    fprintf('Now reading %s\n', fullFileName);
    im = imread(fullFileName);
    if(size(im,3) == 1)
        im = repmat(im, [1 1 3]);
    end
    im_ = single(im);
    im_ = imresize(im_, net.meta.normalization.imageSize(1:2)) ;
    
    for i = 1:3
        im_(:,:,i) = im_(:,:,i) - net.meta.normalization.averageImage(i);
    end
    
    % run the CNN
    
    res = vl_simplenn(net, im_);
    featureVector = res(end-2).x;
    featureVector = featureVector (:);
    featureVector  = featureVector /(norm(featureVector) + eps);
    filename = [fullFileName,'.csv'];
    csvwrite(filename,featureVector)
end


% end
%
% res = vl_simplenn(net, im_) ;
%
% % show the classification result
% scores = squeeze(gather(res(end).x)) ;
% [bestScore, best] = max(scores) ;
% figure ; clf ; imagesc(im) ;
% title(sprintf('%s (%d), score %.3f',...
%     net.meta.classes.description{best}, best, bestScore)) ;
%
%
