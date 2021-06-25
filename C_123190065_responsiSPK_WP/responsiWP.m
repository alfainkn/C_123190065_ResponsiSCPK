
data1 = xlsread('Real estate valuation data set.xlsx','C2:E51'); %mengambil data hous age, distance mrt, dan stor baris 1-50
data2 = xlsread('Real estate valuation data set.xlsx','H2:H51'); %mengambil data house price of unit area baris 1-50.

dataX = [data1 data2];

k = [1,1,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrributkeuntungan, dan 0= atribut biaya
w = [3,5,4,1];%Nilai bobot tiap kriteria

%tahapan pertama, perbaikan bobot
[m n]=size (dataX); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(dataX(i,:).^w);
end;

V= S/sum(S);
v = transpose(V);

disp(v);