%% �ô���Ϊ����SSA��RF�����Ԥ��
%% ��ջ���
clc
clear
close all
%����ѵ���������뼯
load Datas
data = Datas_HH;
input=data(1:end,:)';
output=data(1:end,:)';

%ѵ�����ݺ�Ԥ������ 4:1  
input_train=input(:,1:1266);%ѵ��2874�����ݣ�ռ0.8
input_test=input(:,1267:end);%��������719����ռ0.2
output_train=output(:,1:1266);
output_test=output(:,1267:end);

train_data=input_train';
train_label=output_train';
%% ������ʼ��
SearchAgents_no=30; % Number of search agents

Function_name='F24'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=100; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);
[Best_score,Best_pos,SSA_cg_curve]=SSA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
x=Best_pos;
%% �����ų�ʼ��ֵȨֵ��������Ԥ��
ntree=round(x);
% test_data ��������
% predict_label ������
% scores ���ʷֲ�
 for ii=1:size(Datas_HH,2)
      Model = TreeBagger(ntree,train_data(:,ii),train_label(:,ii),'Method','regression');%ѵ��
      [Ys,~] = predict(Model,input_test(ii,:)');%����
      [Yd,~] = predict(Model,train_data(:,ii));%����
     % ����һ��
      test_simu1(ii,:) = Ys;
      train_simu1(ii,:) =Yd;
 end
 % ����һ��
test_simu2 = test_simu1;
train_simu2 = train_simu1;
%% �Ը�Ƶ���� ���ηֽ��Ľ��е���
nn=cumsum(pl);%��������ÿ��Ԫ�ض�Ӧ�������ϣ���������;���
test_simu(1,:)=sum(test_simu2(1:nn(1),:));
for j=2:length(pl)
      test_simu(j,:)=sum(test_simu2(nn(j-1):nn(j),:));
end
train_simu(1,:)=sum(train_simu2(1:nn(1),:));
for j=2:length(pl)
      train_simu(j,:)=sum(train_simu2(nn(j-1):nn(j),:));
end
output_test1(1,:)=sum(output_test(1:nn(1),:));
for j=2:length(pl)
      output_test1(j,:)=sum(output_test(nn(j-1):nn(j),:));
end
% save Datas_H test_simu  train_simu 
load Datas_H%���ر���õ�����







