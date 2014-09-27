%Names: Ishan Zaman, Matthew Ridder, and Andrew Chen
%Computing IDs: iuz8fn, mjr3vk, and ac9kr
%Assignment: Experiment 1

%Read in video
video = VideoReader('1000+pg+-+Post-RMF+AdditionSmall.mp4');

%Variables
numFrames = video.NumberOfFrames;
brownPix = 0;
blackPixArray = [];
numComponents = [];

%Loops through video at a rate of 1 Hz (right now it's higher for testing)
for n=1:2000:numFrames

    %Crops the frame to give region of interest
   uncroppedFrame = read(video, n);
   frame = imcrop(uncroppedFrame, [55 0 315 250]);
    
    %Convert image to grayscale
    img = rgb2gray(frame);
     figure,image(img);
    %Adjust the appropriate value for two Thershold
    bwImg = im2bw(img, 0.25);
     figure,imshow(bwImg);
     
    bwImg2 = im2bw(img, 0.15);
     figure,imshow(bwImg2);
    
     
     

end
