function error=fun(x,inputnum,hiddennum,outputnum,net,inputn,outputn)
%��ȡ
w1=x(1:inputnum*hiddennum);
B1=x(inputnum*hiddennum+1:inputnum*hiddennum+hiddennum);
w2=x(inputnum*hiddennum+hiddennum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum);
B2=x(inputnum*hiddennum+hiddennum+hiddennum*outputnum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum+outputnum);
%����Ȩֵ��ֵ
W1=reshape(w1,hiddennum,inputnum);
W2=reshape(w2,outputnum,hiddennum);
B1=reshape(B1,hiddennum,1);
B2=reshape(B2,outputnum,1);
[m n]=size(inputn);
A1=tansig(W1*inputn+repmat(B1,1,n)); %����main�����м������ͬ
A2=purelin(W2*A1+repmat(B2,1,n)); %����main�����м������ͬ 
error=sumsqr(outputn-A2);

