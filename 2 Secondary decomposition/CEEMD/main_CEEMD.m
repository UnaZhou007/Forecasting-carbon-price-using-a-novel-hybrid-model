clc%%����
clear
close all
load Datas_1
% % %�Ը߸��Ӷȵ����н���CEEMD ���ηֽ�
% % Datas_HH=[];
% % Nstd = 0.2;%������׼��
% % NR = 100;%�������
% % for i=1:size(Datas_H)
% %     [modes]=ceemd(Datas_H(i,:),Nstd,NR,10);
% %     Datas_HH=[Datas_HH,modes];
% %     pl(i)=size(modes,2);
% % end
% save Datas_1ge Datas_H Datas_HH Datas_M Datas_L pl
load Datas_1ge
num=3;
Datas_HH1= Datas_HH';
[m,~]=size(Datas_HH1);
figure  %ICEEMDAN-MFE-CEEMD�ķֽ���ͼICEEMDAN-MFE-CEEMD Secondary decomposition general  result
for i=1:m
    subplot(m,1,i)
    plot(Datas_HH1(i,:))
    ylabel(['IMF' num2str(i)])
% %     if i==1
% %         title('ICEEMDAN-MFE-CEEMD Secondary decomposition general  result')
% %     end
    if i==m
        xlabel('Time')
    end
end
figure  % Secondary decomposition result (1)
for i=1:m/num
    subplot(m/num,1,i)
    plot(Datas_HH1(i,:))
    ylabel(['IMF' num2str(i)])
% %     if i==1
% %         title('Secondary decomposition result (1)')
% %     end
    if i==m/num
        xlabel('Time')
    end
end
figure  % Secondary decomposition result (2)
for i=(m/num)+1:2*m/num
    subplot(m/num,1,i-12)
    plot(Datas_HH1(i,:))
    ylabel(['IMF' num2str(i)])
% %     if i==1
% %         title('Secondary decomposition result (1)')
% %     end
    if i==2*m/num
        xlabel('Time')
    end
end
figure  % Secondary decomposition result (3)
for i=(2*m/num)+1:m
    subplot(m/num,1,i-24)
    plot(Datas_HH1(i,:))
    ylabel(['IMF' num2str(i)])
% %     if i==1
% %         title('Secondary decomposition result (3)')
% %     end
    if i==m
        xlabel('Time')
    end
end


clear%%����
load Datas_2
% % %�Ը߸��Ӷȵ����н���CEEMD ���ηֽ�
% % Datas_HH=[];
% % Nstd = 0.2;%������׼��
% % NR = 100;%�������
% % for i=1:size(Datas_H)
% %     [modes]=ceemd(Datas_H(i,:),Nstd,NR,10);
% %     Datas_HH=[Datas_HH,modes];
% %     pl(i)=size(modes,2);
% % end
%  save Datas_2ge Datas_H Datas_HH Datas_M Datas_L pl
load Datas_2ge
num=3;
Datas_HH1= Datas_HH';
[m,~]=size(Datas_HH1);
figure  %ICEEMDAN-MFE-CEEMD�ķֽ���ͼICEEMDAN-MFE-CEEMD Secondary decomposition general  result
for i=1:m
    subplot(m,1,i)
    plot(Datas_HH1(i,:))
    ylabel(['IMF' num2str(i)])
% %     if i==1
% %         title('ICEEMDAN-MFE-CEEMD Secondary decomposition general  result')
% %     end
    if i==m
        xlabel('Time')
    end
end
figure  % Secondary decomposition result (1)
for i=1:m/num
    subplot(m/num,1,i)
    plot(Datas_HH1(i,:))
    ylabel(['IMF' num2str(i)])
% %     if i==1
% %         title('Secondary decomposition result (1)')
% %     end
    if i==m/num
        xlabel('Time')
    end
end
figure  % Secondary decomposition result (2)
for i=(m/num)+1:2*m/num
    subplot(m/num,1,i-12)
    plot(Datas_HH1(i,:))
    ylabel(['IMF' num2str(i)])
% %     if i==1
% %         title('Secondary decomposition result (1)')
% %     end
    if i==2*m/num
        xlabel('Time')
    end
end
figure  % Secondary decomposition result (3)
for i=(2*m/num)+1:m
    subplot(m/num,1,i-24)
    plot(Datas_HH1(i,:))
    ylabel(['IMF' num2str(i)])
% %     if i==1
% %         title('Secondary decomposition result (3)')
% %     end
    if i==m
        xlabel('Time')
    end
end
