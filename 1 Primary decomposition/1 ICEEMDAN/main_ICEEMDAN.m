clc
clear
close all
load Datas1
load Datas2
%% �ֽ�����
load fenjie1
modes=fenjie1;
%% �Ľ�CEEMDAN�ֽ�
% % Nstd = 0.2;%������׼��
% % NR = 100;%�������
% % MaxIter = 2000;
% % [modes its]=Iceemdan(Datas1,Nstd,NR,MaxIter,1);
[m,~]=size(modes);
figure  %ICEEMDAN�ķֽ���ͼ
for i=1:m
    subplot(m,1,i)
    plot(modes(i,:))
    ylabel(['IMF' num2str(i)])
% %     if i==1
% %         title('ICEEMDAN decomposition result')
% %     end
    if i==m
        xlabel('Time')
    end
end

load fenjie2
modes=fenjie2;
[n,m]=size(Datas2);
% % %% �Ľ�CEEMDAN�ֽ�
% % Nstd = 0.2;%������׼��
% % NR = 100;%�������
% % MaxIter = 2000;
% % [modes its]=Iceemdan(Datas2,Nstd,NR,MaxIter,1);
[m,~]=size(modes);
figure  %ICEEMDAN�ķֽ���ͼ
for i=1:m
    subplot(m,1,i)
    plot(modes(i,:))
    ylabel(['IMF' num2str(i)])
% %     if i==1
% %         title('ICEEMDAN decomposition result')
% %     end
    if i==m
        xlabel('Time')
    end
end