%Names: Ishan Zaman, Matthew Ridder, and Andrew Chen
%Computing IDs: iuz8fn, mjr3vk, and ac9kr
%Assignment: Experiment 1

%Read in video
video = VideoReader('1000+pg+-+Post-RMF+AdditionSmall.mp4');

%Variables
numFrames = video.NumberOfFrames;
darkregionPix = 0;
blackPix = 0;
brownPix = 0;
darkregionPixArray = [];
blackPixArray = [];
brownPixArray = [];
numComponents = [];

%Loops through video at a rate of 1 Hz (right now it's higher for testing)
for n=1:30:numFrames
    darkregionPix = 0;
    blackPix = 0;
    %Crops the frame to give region of interest
   uncroppedFrame = read(video, n);
   frame = imcrop(uncroppedFrame, [55 0 315 250]);
    
   %Counts the pixels of DarkRegion.
    bwImg = im2bw(frame, 0.2);
     [rows, columns] = size(bwImg);
        for i=1:rows
            for j=1:columns
                if bwImg(i, j) == 0
                    darkregionPix = darkregionPix+1;
                end
            end
        end
      darkregionPixArray = [darkregionPixArray, darkregionPix];
     
    %Counts the pixels of black.
    bwImg2 = im2bw(frame, 0.1);
     
   [rows, columns] = size(bwImg2);
        for i=1:rows
            for j=1:columns
                if bwImg2(i, j) == 0
                    blackPix = blackPix+1;
                end
            end
        end
     
     blackPixArray = [blackPixArray, blackPix];
end
brownPixArray = darkregionPixArray - blackPixArray;

%Counts the percentage of blackPixs /darkregionPixArray
Percentage_of_bla_dark = 100*blackPixArray./darkregionPixArray;
Percentage_of_bla_brown = 100*blackPixArray./brownPixArray;

figure,plot(blackPixArray);
xlabel('Second');
ylabel('numbers of Black pixels');
title('The Black pixels with Second' );

figure,plot(brownPixArray);
xlabel('Second');
ylabel('numbers of Brown pixels');
title('The Brown pixels with Second' );

figure,plot(darkregionPixArray);
xlabel('Second');
ylabel('numbers of DarkRegion pixels');
title('The DarkRegion pixels with Second' );

figure,plot(Percentage_of_bla_dark);
xlabel('Second');
ylabel('Percentage');
title('The Percentage with Second for Black/Dark');

figure,plot(Percentage_of_bla_brown);
xlabel('Second');
ylabel('Percentage');
title('The Percentage with Second for Black/Brown');

%Put the figures together to compare
figure,plot(blackPixArray,'k');
xlabel('Second');
ylabel('numbers of pixels');
title('The pixels with Second,Black for BlackPix,Red for DarkPix,Blue for BrownPix');
hold on;
plot(brownPixArray,'b');
plot(darkregionPixArray,'r');
hold off;
figure,plot(Percentage_of_bla_dark,'k');
xlabel('Second');
ylabel('Percentage');
title('The Percentage with Second,Black for Black/Dark,Blue for Black/Brown');
hold on ;
plot(Percentage_of_bla_brown,'b');
hold off ;

