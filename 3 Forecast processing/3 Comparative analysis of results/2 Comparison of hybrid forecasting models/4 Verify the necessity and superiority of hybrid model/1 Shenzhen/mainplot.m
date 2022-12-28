%% ��������
clc
clear
close all
load real_value
load RF
load BP
load ELM
load SSARF
load CSBP
load WOAELM
load ICEEMDAN_SSARF
load ICEEMDAN_CSBP
load ICEEMDAN_WOAELM
load ICEEMDAN_MFE_EMD_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_EEMD_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_CEEMDAN_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_ICEEMDAN_SSARF_CSBP_WOAELM
load EMD_MFE_CEEMD_SSARF_CSBP_WOAELM
load EEMD_MFE_CEEMD_SSARF_CSBP_WOAELM
load CEEMD_MFE_CEEMD_SSARF_CSBP_WOAELM
load CEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM_EC


%% ��֤���ģ�ͱ�Ҫ��
figure
plot(ICEEMDAN_SSARF-real_value,'r--')
hold on
plot(ICEEMDAN_CSBP-real_value,'g.--')
hold on
plot(ICEEMDAN_WOAELM-real_value,'b-')
hold on
plot(ICEEMDAN_MFE_SSARF_CSBP_WOAELM'-real_value,'c.-')
legend('ICEEMDAN-SSARF','ICEEMDAN-CSBP','ICEEMDAN-WOAELM','ICEEMDAN-MFE-SSARF-CSBP-WOAELM')%����ֵ Ԥ��ֵ
xlabel('Test sample')%��������
ylabel('Forecasting errors')%���
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0])