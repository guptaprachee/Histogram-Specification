clc, clear all, close all;

img1=imread('lena1.jpg');

ref=imread('1.jpg');

% Separate RGB channel
imr = img1(:,:,1);
img = img1(:,:,2);
imb = img1(:,:,3);

rer = ref(:,:,1);
reg = ref(:,:,2);
reb = ref(:,:,3);
% numel=prod(size(img))
% Compute histogram of ref

Hnimgr2 = imhist(rer)./numel(rer);
Hnimgg2 = imhist(reg)./numel(reg);
Hnimgb2 = imhist(reb)./numel(reb);

% Histogram specification, using image reference
outr = histeq(imr,Hnimgr2);
outg = histeq(img,Hnimgg2);
outb = histeq(imb,Hnimgb2);

final(:,:,1) = outr;
final(:,:,2) = outg;
final(:,:,3) = outb;


figure;
subplot(131);imshow(ref);title('Reference Image');
subplot(132);imshow(img1);title('Input Image');
subplot(133);imshow(final);title('Result Image');

% Plot for histogram specification
figure;
subplot(131);imhist(ref);title('Reference Image');
subplot(132);imhist(img1);title('Input Image');
subplot(133);imhist(final);title('Result Image');
