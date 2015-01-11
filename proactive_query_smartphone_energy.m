clear;
close;
clc;
%labels
l = {1,2,4,8,16,64,128};
m = load('data.txt');
m = m(:,4); % Extract only the energy column
col_len = input('Please enter the number of query per one experiment : ');
num_of_exper = length(m) / col_len;
data_vecs = reshape(m  , [col_len , num_of_exper]);
max_data = max(m);
% limit number of labels
l = l(1:num_of_exper);
%plotting
bp = boxplot(data_vecs, 'Labels' , l , 'notch' , 'on');
grid on
xlabel('Number of queries per one request');
ylabel('Energy (Joule)');
set(gca , 'YTick' , [0:0.5: max_data]);

set(findobj(gca,'Type','text'),'FontSize',16)
set(findobj('type','axes'),'fontsize',16)
set(bp,'LineWidth',1.5);
