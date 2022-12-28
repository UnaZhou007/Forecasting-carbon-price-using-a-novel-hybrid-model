%% �ô���Ϊ����WOA��ELM�����Ԥ��
%% ��ջ���
tic
clc
clear
close all 
rng('default')%�� rand��randi �� randn ʹ�õ���������ɺ�������������Ϊ��Ĭ��ֵ
load Datas
data = Datas_L';
input=data(1:end,:)';
output=data(1:end,:)';

%ѵ�����ݺ�Ԥ������ 4:1  
input_train=input(:,1:1266);
input_test=input(:,1267:end);
output_train=output(:,1:1266);
output_test=output(:,1267:end);

[inputn,inputps]=mapminmax(input_train);
[outputn,outputps]=mapminmax(output_train);

%% ������ʼ��
SearchAgents_no=30; % Number of search agents

Function_name='F24'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=100; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj,fun1]=Get_Functions_details(Function_name);
dim=1;
[Best_score,Best_pos,WOA_cg_curve]=WOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
a=round(Best_pos);
%% �����������ڵ�����������Ԥ��
%%
% 2. ѵ����
P_train = input_train;
T_train = output_train;

%%
% 3. ���Լ�
P_test = input_test;
T_test = output_test;

%% ��һ��
% ѵ����
[Pn_train,inputps] = mapminmax(P_train,-1,1);
Pn_test = mapminmax('apply',P_test,inputps);
% ���Լ�
[Tn_train,outputps] = mapminmax(T_train,-1,1);
Tn_test = mapminmax('apply',T_test,outputps);

tic
%% ELM����/ѵ��
[IW,B,LW,TF,TYPE] = elmtrain(Pn_train,Tn_train,a,'sig',0);

%% ELM�������
Tr_sim = elmpredict(Pn_train,IW,B,LW,TF,TYPE);
% ����һ��
train_simu = mapminmax('reverse',Tr_sim,outputps);
Tn_sim = elmpredict(Pn_test,IW,B,LW,TF,TYPE);
% ����һ��
test_simu = mapminmax('reverse',Tn_sim,outputps);
output_test=T_test;
% save Datas_L test_simu  train_simu 
load Datas_L%���ر���õ�����





