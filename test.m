trainedUNIT_url = 'https://ssd.mathworks.com/supportfiles/vision/data/trainedDayDuskUNITGeneratorNet.zip';
trainedUNIT_filename = 'trainedDayDuskUNITGeneratorNet.mat';
downloadTrainedDayDuskGeneratorNet(trainedUNIT_url,pwd);
load(trainedUNIT_filename);
input = imread("car1.jpg");
imshow(input)

input = imread("car1.jpg");
imshow(input)

input = (im2single(input) - 0.5)/0.5;
input = imresize(input,0.25);
dlInput = dlarray(input,"SSCB");
%Translate the source image to the target domain using the UNIT generator network.
dlOutput = unitPredict(gen,dlInput);
%Extract the translated image data from the dlarray object and rescale the data to the range [0, 1]. Display the translated image. The translated image resembles images acquired in dusk conditions.

output = rescale(extractdata(dlOutput));
imshow(output)

%%

trainedUNIT_url = 'https://ssd.mathworks.com/supportfiles/vision/data/trainedDayDuskUNITGeneratorNet.zip';
trainedUNIT_filename = 'trainedDayDuskUNITGeneratorNet.mat';
downloadTrainedDayDuskGeneratorNet(trainedUNIT_url,pwd);
load(trainedUNIT_filename);

input = imread("office_2.jpg");
imshow(input)
%Preprocess the image so that it is compatible with the network. Convert the data to data type single in the range [-1, 1]. Store the data in a dlarray object.
input = (im2single(input) - 0.5)/0.5;
dlInput = dlarray(input,"SSCB");
%Translate the target image to the source domain using the pretrained UNIT generator network, gen.
dlOutput = unitPredict(gen,dlInput,"OutputType","TargetToSource");

%Extract the translated image data from the dlarray object and rescale the data to the range [0, 1]. Display the translated image. The translated image resembles images acquired in daytime lighting conditions.
output = rescale(extractdata(dlOutput));
imshow(output)


