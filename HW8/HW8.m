function varargout = HW8(varargin)
% HW8 MATLAB code for HW8.fig
%      HW8, by itself, creates a new HW8 or raises the existing
%      singleton*.
%
%      H = HW8 returns the handle to a new HW8 or the handle to
%      the existing singleton*.
%
%      HW8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HW8.M with the given input arguments.
%
%      HW8('Property','Value',...) creates a new HW8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HW8_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HW8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HW8

% Last Modified by GUIDE v2.5 16-Nov-2015 20:56:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HW8_OpeningFcn, ...
                   'gui_OutputFcn',  @HW8_OutputFcn, ...
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


% --- Executes just before HW8 is made visible.
function HW8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HW8 (see VARARGIN)

% Choose default command line output for HW8
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HW8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HW8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadbutton.
function loadbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loadbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load 'boiling.mat'  % load the boiling.mat file
handles.height=boiling(1,:); % put the height and temperature rows into two seperate handles
handles.temp=boiling(2,:);
% Choose default command line output for HW8
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in firstorder.
function firstorder_Callback(hObject, eventdata, handles)
% hObject    handle to firstorder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coef=polyfit(handles.height,handles.temp,1);
graph=polyval(coef,handles.height); % use the polyfit and polyval function to get the points necessary for the polynomial 
plot(handles.height,graph)
a=coef(1);
b=coef(2);
c=0;
d=0;
set(handles.polya,'string',a) % assign the polynomial coefficients to the static text boxes
set(handles.polyb,'string',b) % do this for the second and third order buttons as well
set(handles.polyc,'string',c)
set(handles.polyd,'string',d)

% --- Executes on button press in secondorder.
function secondorder_Callback(hObject, eventdata, handles)
% hObject    handle to secondorder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coef=polyfit(handles.height,handles.temp,2);
graph=polyval(coef,handles.height);
plot(handles.height,graph)
a=coef(1);
b=coef(2);
c=coef(3);
d=0;
set(handles.polya,'string',a)
set(handles.polyb,'string',b)
set(handles.polyc,'string',c)
set(handles.polyd,'string',d)
% --- Executes on button press in thirdorder.
function thirdorder_Callback(hObject, eventdata, handles)
% hObject    handle to thirdorder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coef=polyfit(handles.height,handles.temp,3);
graph=polyval(coef,handles.height);
plot(handles.height,graph)
a=coef(1);
b=coef(2);
c=coef(3);
d=coef(4);
set(handles.polya,'string',a)
set(handles.polyb,'string',b)
set(handles.polyc,'string',c)
set(handles.polyd,'string',d)
