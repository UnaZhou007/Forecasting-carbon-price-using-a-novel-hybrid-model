%% �ô���Ϊ����CS�Ż�BP�����Ԥ��
%% ��ջ���
tic
clc
clear
close all 
load Datas
data = Datas_M';
input=data(1:end,:)';
output=data(1:end,:)';
%�ڵ����
[num,~]=size(input);
inputnum=num;%����
hiddennum=10;%������
outputnum=num;%���

%ѵ�����ݺ�Ԥ������ 4:1  
input_train=input(:,1:1266);
input_test=input(:,1267:end);
output_train=output(:,1:1266);
output_test=output(:,1267:end);

[inputn,inputps]=mapminmax(input_train);%��һ������
[outputn,outputps]=mapminmax(output_train);
%��������
rand('seed',1)%��ͬ��key�£���һ�ε���rand�����Ľ������ͬ��

net=newff(inputn,outputn,hiddennum,{'tansig','purelin'},'trainlm');
netBP=newff(inputn,outputn,hiddennum,{'tansig','purelin'},'trainlm');

%% ������ʼ��
parnum = inputnum * hiddennum + hiddennum * outputnum + hiddennum + outputnum; %51
SearchAgents_no=30; % Number of search agents

Function_name='F24'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=100; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj,fun1]=Get_Functions_details(Function_name);
dim=parnum;
[Best_score,Best_pos,CS_cg_curve]=CS(SearchAgents_no,Max_iteration,lb,ub,dim,fobj,inputnum,hiddennum,outputnum,net,inputn,outputn);
%% ���
x=Best_pos;
%% �����ų�ʼ��ֵȨֵ��������Ԥ��
% %��CS�Ż���BP�������ֵԤ��
w1=x(1:inputnum*hiddennum);
B1=x(inputnum*hiddennum+1:inputnum*hiddennum+hiddennum);
w2=x(inputnum*hiddennum+hiddennum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum);
B2=x(inputnum*hiddennum+hiddennum+hiddennum*outputnum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum+outputnum);
net.iw{1,1}=reshape(w1,hiddennum,inputnum);
net.lw{2,1}=reshape(w2,outputnum,hiddennum);
net.b{1}=reshape(B1,hiddennum,1);
net.b{2}=B2';

%% BP����ѵ��
t1=clock;
%�����������
net.trainParam.epochs=10;
net.trainParam.lr=0.01;
net.trainParam.goal=0.00001;
net.trainParam.show=5;% ������ʾ֮���ѵ������
net.trainFcn = 'trainlm'; %traingdm�Ǵ��������ݶ��½�����trainlm��ָL-M�Ż��㷨��trainscg��ָ���������ݶȷ�
net=train(net,inputn,outputn);%ѵ������
net.divideParam.trainRatio = 40/100;
net.divideParam.valRatio = 30/100;
net.divideParam.testRatio = 30/100;

%����ѵ��
[net,per2]=train(net,inputn,outputn);

%% BP����Ԥ��
%���ݹ�һ��
BPoutputT=sim(net,inputn);   %�����
train_simu=mapminmax('reverse',BPoutputT,outputps); %�ѷ���õ������ݻ�ԭΪԭʼ��������
inputn_test=mapminmax('apply',input_test,inputps);
%BP������Ԥ��
BPoutput=sim(net,inputn_test);   %�����
test_simu=mapminmax('reverse',BPoutput,outputps); %�ѷ���õ������ݻ�ԭΪԭʼ��������
error=test_simu-output_test;      %Ԥ��ֵ����ʵֵ�����
% save Datas_M test_simu  train_simu 
load Datas_M%���ر���õ�����







