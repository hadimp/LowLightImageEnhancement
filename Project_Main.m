close all
clear 

%% Parameters

% img
img = imread('cars.bmp'); 
% Alpha
Alpha = 3;
% Gamma
Gamma = 0.8;
% Rho
Rho = 1.15;
% Mu
Mu = 0.05;
% Number of iterations
Num_iter = 50;


%% Calculating the initial illumination map

img = im2double(img);
Initial_map = calc_init_map(img);

%% Applying the initial map on the image

initial_illuminated_image = zeros(size(img));
for channel = 1:3
    initial_illuminated_image(:,:, channel) = img(:,:, channel) ./ Initial_map;
end

%% Calculating the refined illumination map

Refined_map = calc_refined_map(Initial_map, Alpha, Rho, Mu, Num_iter);
Refined_map = abs(Refined_map);

%% Applying the refined map on the image

refined_image = zeros(size(img));
for channel = 1:3
    refined_image(:,:, channel) = img(:,:, channel) ./ Refined_map;
end

%% Gamma Correction

GammaCorrected_map = Refined_map .^ Gamma;

%% Applying the refined and gamma corrected map on the image

illuminated_image = zeros(size(img));
for channel = 1:3
    illuminated_image(:,:, channel) = img(:,:, channel) ./ GammaCorrected_map;
end


%% Displaying the results
figure(1)
imshow(img);

figure(2)
imshow(initial_illuminated_image);
saveas(gcf, 'initial_cars.png');

figure(3)
imshow(refined_image,[]);
saveas(gcf, 'refined_cars.png');

figure(4)
imshow(illuminated_image,[]);
saveas(gcf, 'illuminated_cars.png');
