clc
clear
close all
%��ȡ���� ���Ӷ� �� �� �� һ�����  һ��ѵ��
rng('default')%�� rand��randi �� randn ʹ�õ���������ɺ�������������Ϊ��Ĭ��ֵ
load  Datas_H
H1=test_simu;
H2=train_simu;
load  Datas_M
M1=test_simu;
M2=train_simu;
load  Datas_L
L1=test_simu;
L2=train_simu;
% ���Ե���
test_simu=sum([H1;M1;L1])';
train_simu=sum([H2;M2;L2])';
Datas=xlsread('data.xlsx','2');%������ʵ����
output_train=Datas(1:1266);
output_test=Datas(1267:end);
%% ѵ������ ��ʵֵ��Ԥ��ֵ���Ƚ�
error1=train_simu-output_train;      %Ԥ��ֵ����ʵֵ�����
%% �������� ��ʵֵ��Ԥ��ֵ���Ƚ�
error2=test_simu-output_test;      %Ԥ��ֵ����ʵֵ�����

%% ELM �������
% 2. ѵ����
P_train = error1';
T_train = error1';
%%
% 3. ���Լ�
P_test = error2';
T_test = error2';
%% ��һ��
% ѵ����
[Pn_train,inputps] = mapminmax(P_train,-1,1);
Pn_test = mapminmax('apply',P_test,inputps);
% ���Լ�
[Tn_train,outputps] = mapminmax(T_train,-1,1);
Tn_test = mapminmax('apply',T_test,outputps);
%% ELM����/ѵ��
[IW,B,LW,TF,TYPE] = elmtrain(Pn_train,Tn_train,4,'sig',0);
%% ELM�������
Tn_sim = elmpredict(Pn_test,IW,B,LW,TF,TYPE);
test_error = mapminmax('reverse',Tn_sim,outputps);
% ����
test_simu=test_simu-test_error';
error=test_simu-output_test;      %Ԥ��ֵ����ʵֵ�����
%%
figure
plot(output_test,'bo-')
hold on
plot(test_simu,'r*-')
legend('Real value','Forecasting value')%����ֵ Ԥ��ֵ
xlabel('Test sample')%��������
ylabel('Forecasting results')%�������
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0])
[c,l]=size(output_test);
mape = mean(abs((output_test - test_simu)./output_test));
MAE=sum(abs(error),1)/l;
RMSE=sqrt(mean((test_simu-output_test).^2,1));
disp(['-----------------------���������������--------------------------'])
disp(['���ղ�����������£�'])
disp(['ƽ���������MAEΪ��',num2str(MAE')])
disp(['���������RMSEΪ��  ',num2str(RMSE')])
disp(['ƽ���ٷֱ����MAPEΪ/%��  ',num2str(mape')])
% save ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM_EC test_simu

