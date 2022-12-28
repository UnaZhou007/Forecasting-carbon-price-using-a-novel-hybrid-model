function rmse=fun(a)
%% ����ѧϰ���ڻع���������е�Ӧ���о�
load Datas
data = Datas_L';
input=data(1:end,:)';
output=data(1:end,:)';
%�ڵ����
[num,~]=size(input);

%ѵ�����ݺ�Ԥ������ 4:1  
input_train=input(:,1:1266);
input_test=input(:,1267:end);
output_train=output(:,1:1266);
output_test=output(:,1267:end);

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
[IW,B,LW,TF,TYPE] = elmtrain(Pn_train,Tn_train,round(a),'sig',0);

%% ELM�������
Tn_sim = elmpredict(Pn_test,IW,B,LW,TF,TYPE);
% ����һ��
test_simu = mapminmax('reverse',Tn_sim,outputps);
output_test=T_test;
%% ����Ա�
rmse=sum(sqrt(mean((test_simu-output_test).^2,2)));








