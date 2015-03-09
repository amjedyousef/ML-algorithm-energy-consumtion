clear;
close all;
clc;
%labels
%l = {1,2,4,8,16,64,128};
% l={1,3,5,7,9,11,13,15,17,19,21,23,25,61,27,29,31,33,35,37,39,41,43,45,47,49,50};
 l = {'wifi' , '3g' , 'GPS - PAB' , 'GPS - HA'};
%%
%energy calculations
m = load('values.txt');
e = m(:,4); % Extract only the energy column
t = m(:,2); % Extract only the time column
t = t/1000; % convert from milliseconds to seconds
col_len = input('Please enter the number of query per one experiment : ');
num_of_exper = length(e) / col_len;
e_data_vecs = reshape(e  , [col_len , num_of_exper]);
t_data_vecs = reshape(t  , [col_len , num_of_exper]);
e_max_data = max(e);
t_max_data = max(t);
% limit number of labels
l = l(1:num_of_exper);

%%
%plotting

figure()
bp_e = boxplot(e_data_vecs, 'Labels' , l , 'notch' , 'on');
grid on
box on
xlabel('Communication Technology');
ylabel('Energy (Joule)');
set(gca , 'YTick' , [0:0.5: e_max_data]);

set(findobj(gca,'Type','text'),'FontSize',16)
set(findobj('type','axes'),'fontsize',16)
set(bp_e,'LineWidth',1.5);
