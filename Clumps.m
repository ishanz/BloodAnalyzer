% Names: Ishan Zaman, Matthew Ridder, and Andrew Chen
% Computing IDs: iuz8fn, mjr3vk, and ac9kr
% Assignment: Experiment 1

clear;
clc;

% Request filename from user
filename = input('Enter the filename of the video to analyze: ', 's');

% Read in video
video = VideoReader(filename);

% User input commands
display('Please enter the time that the DNA is introduced (mm:ss) : ');
dnaEntry1Min = input('Minutes: ' ,'s');
dnaEntry1Min = str2double(dnaEntry1Min);
dnaEntry1Sec = input('Seconds: ' , 's');
dnaEntry1Sec = str2double(dnaEntry1Sec);

% Finds starting frame (when DNA is introduced)
numFrames = video.NumberOfFrames;
frameRate = video.FrameRate;
totalTime = numFrames/frameRate;
startFrame = round((numFrames/totalTime)*(dnaEntry1Min*60 + dnaEntry1Sec));

% Variables
rate = 200;
brownPix = 0;
blackPix = 0;
blackPixArray = [];
numComponents = [];

% Loops through video at a rate of 1 Hz (right now it's higher for testing)
for n=startFrame:rate:numFrames
    blackPix = 0;
    
    % Crops the frame to give region of interest
    uncroppedFrame = read(video, n);
    frame = imcrop(uncroppedFrame, [55 0 315 250]);
    frame = rgb2gray(frame);
    
    % Counts the number of brown pixels at the starting frame (t = 0)
    if n == startFrame
        bwImg = im2bw(frame, .25);
        [rows, columns] = size(bwImg);
        for i=1:rows
            for j=1:columns
                if bwImg(i, j) == 0
                    brownPix = brownPix + 1;
                end
            end
        end    
    end
    
    % Counts the number of black pixels
    bwImg2 = im2bw(frame, 0.15);
    [rows, columns] = size(bwImg2);
    for i=1:rows
        for j=1:columns
            if bwImg2(i, j) == 0
                blackPix = blackPix + 1;
            end
        end
    end
    blackPixArray = [blackPixArray, blackPix];
    
    % Count the number of clumps
    clumps = im2bw(frame, 0.25);
    clumps = medfilt2(clumps);
    clumps = imclose(clumps, strel('disk', 10));
    clumps = imopen(clumps, strel('disk', 3));
    CC = bwconncomp(~clumps, 4);
    numComponents = [numComponents CC.NumObjects];
    imshow(clumps);
    
end

% % Counts the percentage of blackPixs / original brownPix
% blackToBrown = 100*(blackPixArray/brownPix);
% 
% figure,plot(blackPixArray);
% xUnits = get(gca,'xtick');
% set(gca,'xticklabel',round(((startFrame + xUnits * rate)/numFrames)...
%     * totalTime));
% xlabel('Seconds');
% ylabel('Black pixels');
% title('Number of Black Pixels in Video' );
% 
% figure,plot(blackToBrown);
% xUnits = get(gca,'xtick');
% set(gca,'xticklabel',round(((startFrame + xUnits * rate)/numFrames)...
%     * totalTime));
% xlabel('Seconds');
% ylabel('Percentage');
% title('Black Pixel Percentage based on Original Brown Area');
% 
% % Find and display min dark region area
% minRegionArea = min(blackPixArray(2:length(blackPixArray)));
% areaStr = num2str(minRegionArea);
% areaStrFinal = strcat({'The minimum dark region area is '} , ...
%     areaStr, { ' pixels.'});
% display(areaStrFinal);
% 
% % Find and display time at which min dark region area occurs
% minRegionIndex = find(blackPixArray == minRegionArea);
% minRegionTime = round(((startFrame + minRegionIndex * rate)/ ...
%     numFrames)*totalTime);
% minRegionMins = floor(minRegionTime/60);
% minRegionSecs = mod(minRegionTime, 60);
% minsStr = num2str(minRegionMins);
% secsStr = num2str(minRegionSecs);
% timeStrFinal = strcat({'This minimum occurs at '}, minsStr, ...
%     {' minutes and '}, secsStr, {' seconds.'});
% display(timeStrFinal);
% 
% % Finds the percent error in the min dark region area after 30 seconds
% errorFrameIndexAdd = round(((numFrames/totalTime)*30)/rate);
% minRegionAreaMeasured = blackPixArray(1+errorFrameIndexAdd);
% minRegionError = 100 * (abs(minRegionArea - minRegionAreaMeasured)/ ...
%     minRegionArea);
% errorStr = num2str(minRegionError);
% errorStrFinal = strcat({'The error after 30 seconds is '}, ...
%     errorStr, {' percent.'});
% display(errorStrFinal);