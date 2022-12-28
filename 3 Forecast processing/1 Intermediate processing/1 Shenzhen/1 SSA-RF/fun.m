function rmse=fun(a)
rng('default')
load Datas
data = Datas_HH;
input=data(1:end,:)';
output=data(1:end,:)';

%ѵ�����ݺ�Ԥ������ 4:1  
input_train=input(:,1:2874);
input_test=input(:,2875:end);
output_train=output(:,1:2874);
output_test=output(:,2875:end);

train_data=input_train';
train_label=output_train';
%% ���ɭ��Ԥ��
ntree=round(a);
Model = TreeBagger(ntree,train_data(:,1),train_label(:,1),'Method','regression');%ѵ��
% test_data ��������
% predict_label ������
% scores ���ʷֲ�
[test_simu,scores] = predict(Model,input_test(1,:)');%����
% ����һ��
rmse=sum(sqrt(mean((test_simu-output_test(1,:)').^2,2)));