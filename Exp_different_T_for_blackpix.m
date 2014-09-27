%Names: Ishan Zaman, Matthew Ridder, and Andrew Chen
%Computing IDs: iuz8fn, mjr3vk, and ac9kr
%Assignment: Experiment 1

%Read in video
video = VideoReader('1000+pg+-+Post-RMF+AdditionSmall.mp4');

%Variables
numFrames = video.NumberOfFrames;
darkregionPix = 0;
blackPix10 = 0;
blackPix11 = 0;
blackPix12 = 0;
blackPix13 = 0;
blackPix14 = 0;
blackPix15 = 0;
brownPix10 = 0;
brownPix11 = 0;
brownPix12 = 0;
brownPix13 = 0;
brownPix14 = 0;
brownPix15 = 0;
darkregionPixArray = [];
blackPixArray10 = [];
blackPixArray11 = [];
blackPixArray12 = [];
blackPixArray13 = [];
blackPixArray14 = [];
blackPixArray15 = [];
brownPixArray10 = [];
brownPixArray11 = [];
brownPixArray12 = [];
brownPixArray13 = [];
brownPixArray14 = [];
brownPixArray15 = [];
numComponents = [];

%Loops through video at a rate of 1 Hz (right now it's higher for testing)
for n=1:30:numFrames
    darkregionPix = 0;
    blackPix10 = 0;
    blackPix11 = 0;
    blackPix12 = 0;
    blackPix13 = 0;
    blackPix14 = 0;
    blackPix15 = 0;
    %Crops the frame to give region of interest
   uncroppedFrame = read(video, n);
   frame = imcrop(uncroppedFrame, [55 0 315 250]);
    
   %Counts the pixels of DarkRegion.
    bwImg = im2bw(frame, 0.25);
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
    bwImg10 = im2bw(frame, 0.1);
     
   [rows, columns] = size(bwImg10);
        for i=1:rows
            for j=1:columns
                if bwImg10(i, j) == 0
                    blackPix10 = blackPix10+1;
                end
            end
        end
     
     blackPixArray10 = [blackPixArray10, blackPix10];
     
      bwImg11 = im2bw(frame, 0.11);
     
   [rows, columns] = size(bwImg11);
        for i=1:rows
            for j=1:columns
                if bwImg11(i, j) == 0
                    blackPix11 = blackPix11+1;
                end
            end
        end
     
     blackPixArray11 = [blackPixArray11, blackPix11];
     
       bwImg12 = im2bw(frame, 0.12);
     
   [rows, columns] = size(bwImg12);
        for i=1:rows
            for j=1:columns
                if bwImg12(i, j) == 0
                    blackPix12 = blackPix12+1;
                end
            end
        end
     
     blackPixArray12 = [blackPixArray12, blackPix12];
     
       bwImg13 = im2bw(frame, 0.13);
     
   [rows, columns] = size(bwImg13);
        for i=1:rows
            for j=1:columns
                if bwImg13(i, j) == 0
                    blackPix13 = blackPix13+1;
                end
            end
        end
     
     blackPixArray13 = [blackPixArray13, blackPix13];
       bwImg14 = im2bw(frame, 0.14);
     
   [rows, columns] = size(bwImg14);
        for i=1:rows
            for j=1:columns
                if bwImg14(i, j) == 0
                    blackPix14 = blackPix14+1;
                end
            end
        end
     
     blackPixArray14 = [blackPixArray14, blackPix14];
     
     
       bwImg15 = im2bw(frame, 0.15);
     
   [rows, columns] = size(bwImg15);
        for i=1:rows
            for j=1:columns
                if bwImg15(i, j) == 0
                    blackPix15 = blackPix15+1;
                end
            end
        end
     
     blackPixArray15 = [blackPixArray15, blackPix15];
end


%Counts the percentage of blackPixs /darkregionPixArray
Percentage_of_bla_dark10 = 100*blackPixArray10./darkregionPixArray;
Percentage_of_bla_dark11 = 100*blackPixArray11./darkregionPixArray;
Percentage_of_bla_dark12 = 100*blackPixArray12./darkregionPixArray;
Percentage_of_bla_dark13 = 100*blackPixArray13./darkregionPixArray;
Percentage_of_bla_dark14 = 100*blackPixArray14./darkregionPixArray;
Percentage_of_bla_dark15 = 100*blackPixArray15./darkregionPixArray;


figure,plot(blackPixArray10,'b');
hold on;
plot(blackPixArray11,'g');
plot(blackPixArray12,'r');
plot(blackPixArray13,'c');
plot(blackPixArray14,'m');
plot(blackPixArray15,'y');
xlabel('Second');
ylabel('numbers of Black pixels');
title('The Black pixels with Second' );
hold off;

figure,plot(Percentage_of_bla_dark10,'b');
hold on;
plot(Percentage_of_bla_dark11,'g');
plot(Percentage_of_bla_dark12,'r');
plot(Percentage_of_bla_dark13,'c');
plot(Percentage_of_bla_dark14,'m');
plot(Percentage_of_bla_dark15,'y');
xlabel('Second');
ylabel('Percentage');
title('The Percentage with Second for Black/Dark');
hold off;



