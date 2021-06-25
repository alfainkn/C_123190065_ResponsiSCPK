function varargout = responsiSAW(varargin)
% RESPONSISAW MATLAB code for responsiSAW.fig
%      RESPONSISAW, by itself, creates a new RESPONSISAW or raises the existing
%      singleton*.
%
%      H = RESPONSISAW returns the handle to a new RESPONSISAW or the handle to
%      the existing singleton*.
%
%      RESPONSISAW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSISAW.M with the given input arguments.
%
%      RESPONSISAW('Property','Value',...) creates a new RESPONSISAW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before responsiSAW_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to responsiSAW_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help responsiSAW

% Last Modified by GUIDE v2.5 25-Jun-2021 15:00:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @responsiSAW_OpeningFcn, ...
                   'gui_OutputFcn',  @responsiSAW_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before responsiSAW is made visible.
function responsiSAW_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to responsiSAW (see VARARGIN)

% Choose default command line output for responsiSAW
handles.output = hObject;

opts = detectImportOptions('DATA RUMAH.xlsx');
opts.SelectedVariableNames = [1,3,4,5,6,7,8];
ReadData = readmatrix('DATA RUMAH.xlsx',opts);
set(handles.uitable1,'Data',ReadData);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes responsiSAW wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = responsiSAW_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in prosesData.
function prosesData_Callback(hObject, eventdata, handles)
% hObject    handle to prosesData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

opts = detectImportOptions('DATA RUMAH.xlsx');
opts.SelectedVariableNames = (3:8);
dataX = readmatrix('DATA RUMAH.xlsx', opts);

k=[0,1,1,1,1,1];%atribut tiap-tiap kriteria 1=keuntungan dan 0=biaya
w=[0.30,0.20,0.23,0.10,0.07,0.10];%bobot masing masing kriteria

[m n]=size (dataX); %matriks m x n dengan ukuran sebanyak variabel x(input)
R=zeros (m,n); %membuat matriks R, yang merupakan matriks kosong

for j=1:n,
if k(j)==1, %statement untuk kriteria dengan atribut keuntungan
    R(:,j)=dataX(:,j)./max(dataX(:,j));
else
    R(:,j)=min(dataX(:,j))./dataX(:,j);
    end;
end;
for i=1:m,
    V(i)= sum(w.*R(i,:));
end;
Preverensi = transpose(V);
xlswrite('preverensi.xlsx', Preverensi);

ReadData = xlsread('preverensi.xlsx');
set(handles.uitable2,'Data',ReadData);

dataP = xlsread('preverensi.xlsx');
P = sort(dataP,'descend');

%memilih hanya 20 nilai terbaik
for i=1:20
hasil(i) = P(i);
end

opts2 = detectImportOptions('DATA RUMAH.xlsx');
opts2.SelectedVariableNames = [2]; %memilih hanya kolom Nama Rumah

nama = readmatrix('DATA RUMAH.xlsx',opts2); %mengambil nama rumah dari file

%mencari nama rumah dari 20 nilai terbaik
for i=1:20
 for j=1:m
   if(hasil(i) == V(j))
    rekomendasi(i) = nama(j);
    break
   end
 end
end

rekomendasi = transpose(rekomendasi);

set(handles.uitable3,'Data',rekomendasi);





