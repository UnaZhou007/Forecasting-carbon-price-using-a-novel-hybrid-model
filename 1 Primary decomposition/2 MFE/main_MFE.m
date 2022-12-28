clc
clear
close all
load fenjie1
modes=fenjie1;
%% �����߶�ģ����
m=3;%����ά��
scale=3;%%�߶�ϵ��
for i=1:size(modes,1)
    r=std(modes(i,:));
    MFE(i)=sum(MultiscaleFuzzyEntropy(modes(i,:),m,r,scale));%��߶�ģ����
end
figure%����IMF��MFEֵThe value of ICEEMDAN-MFE
plot(1:i,MFE,'b*')
ylabel('The value of MFE')
xlabel('IMFs')
%����ֵ���й�һ��
MFE=mapminmax(MFE,0,1);
figure%��һ����ĸ���IMF��MFEֵThe normalized value of MFE
plot(1:i,MFE,'bo')
ylabel('The normalized value of MFE')
xlabel('IMFs')
% ���е͸��ӶȰ���3��3��4����
num=round(size(modes,1)*0.3);
[~,index]=sort(MFE,'descend');%��MFE���н�������
Datas_H=modes(index(1:num),:);%�߸��Ӷȷ���
Datas_M=modes(index(num+1:2*num),:);%�и��Ӷȷ���
Datas_L=modes(index(2*num+1:end),:);%�͸��Ӷȷ���
% save Datas_1 Datas_H Datas_M Datas_L%�洢����
clear
load fenjie2
modes=fenjie2;
%% �����߶�ģ����
m=3;%����ά��
scale=3;%%�߶�ϵ��
for i=1:size(modes,1)
    r=std(modes(i,:));
    MFE(i)=sum(MultiscaleFuzzyEntropy(modes(i,:),m,r,scale));%��߶�ģ����
end
figure%����IMF��MFEֵThe value of ICEEMDAN-MFE
plot(1:i,MFE,'b*')
ylabel('The value of MFE')
xlabel('IMFs')
%����ֵ���й�һ��
MFE=mapminmax(MFE,0,1);
figure%��һ����ĸ���IMF��MFEֵThe normalized value of MFE
plot(1:i,MFE,'bo')
ylabel('The normalized value of MFE')
xlabel('IMFs')
% ���е͸��ӶȰ���3��3��3����
num=round(size(modes,1)*0.3);
[~,index]=sort(MFE,'descend');%��MFE���н�������
Datas_H=modes(index(1:num),:);%�߸��Ӷȷ���
Datas_M=modes(index(num+1:2*num),:);%�и��Ӷȷ���
Datas_L=modes(index(2*num+1:end),:);%�͸��Ӷȷ���
% save Datas_2 Datas_H Datas_M Datas_L%�洢����

