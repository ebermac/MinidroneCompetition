% bwmasktrapezoid
xmask = [70 90 90 70];
ymask = [0 0 40 40];
bwmask1 = poly2mask(xmask,ymask,120,160);
bwmasktrapezoid = boolean(bwmask1);
imshow(bwmask1)


% bwmaskpathtriangle
% xmask = [80 66 70 80];
% ymask = [20 20 40 40];
% bwmaskleft = boolean(poly2mask(xmask,ymask,120,160));
% bwmaskright = flip(bwmaskleft,2);

% xmask = [80 70 75 80];
% ymask = [20 20 40 40];
% bwmaskleft = boolean(poly2mask(xmask,ymask,120,160));
% bwmaskright = flip(bwmaskleft,2);

xmask = [80 70 70 75 80];
ymask = [10 10 20 40 40];
bwmaskleft = boolean(poly2mask(xmask,ymask,120,160));
bwmaskright = flip(bwmaskleft,2);



bwmaskleft = int8(bwmaskleft);
bwmaskright = int8(bwmaskright);
bwmaskleft = bwmaskleft*(-1);

bwmaskpathtriangle = imadd(bwmaskleft,bwmaskright);

figure()
imshow(bwmaskpathtriangle~=0)


% bwmasktraveled
xmask = [60 100 100 60];
ymask = [0 0 120 120];
bwmasktraveled = poly2mask(xmask,ymask,120,160);
bwmasktraveled = ~boolean(bwmasktraveled);
figure()
imshow(bwmasktraveled)


% create matrices
angle = [180:-1:-180];
for i = 1:size(angle,2)
bwmasktrapezoidmatrix(:,:,i) = imrotate(bwmasktrapezoid, angle(i), 'bilinear', 'crop');
bwmasktraveledmatrix(:,:,i) = imrotate(bwmasktraveled, angle(i), 'bilinear', 'crop');
bwmaskpathtrianglematrix(:,:,i) = imrotate(bwmaskpathtriangle, angle(i), 'nearest', 'crop');
end

% angle = [180:-1:-180];
% for i = 1:size(angle,2)
% bwmaskpathtrianglematrix(:,:,i) = imrotate(bwmaskpathtriangle, angle(i), 'nearest', 'crop');
% end

bwmaskpathtrianglematrixmatlab = int8(bwmaskpathtrianglematrix);
bwmasktrapezoidmatrixmatlab = uint8(bwmasktrapezoidmatrix);
bwmasktraveledmatrixmatlab = uint8(bwmasktraveledmatrix);