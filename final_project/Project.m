function varargout = Project(varargin)
% PROJECT MATLAB code for Project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project

% Last Modified by GUIDE v2.5 07-Dec-2015 23:01:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_OutputFcn, ...
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


% --- Executes just before Project is made visible.
function Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project (see VARARGIN)

% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load1.
function load1_Callback(hObject, eventdata, handles)
% hObject    handle to load1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in load2.
function load2_Callback(hObject, eventdata, handles)
% hObject    handle to load2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sample=uigetfile(...
    {'*.wav;*.mp3;*.mp4;*.m4a;*.au', ...
    'Audio Files (*.wav,*.mp3, *.mp4, *.m4a, *.au)';...
    '*.*', 'All Files (*.*)'},'choose an audio file');
[handles.y, handles.fs] = audioread(sample);
handles.w = 0;
handles.left = handles.y(:,1);
handles.right = handles.y(:,2);
handles.current_data = audioplayer(handles.y,handles.fs);

% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in load3.
function load3_Callback(hObject, eventdata, handles)
% hObject    handle to load3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in load4.
function load4_Callback(hObject, eventdata, handles)
% hObject    handle to load4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in load5.
function load5_Callback(hObject, eventdata, handles)
% hObject    handle to load5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in load6.
function load6_Callback(hObject, eventdata, handles)
% hObject    handle to load6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in sample4.
function sample4_Callback(hObject, eventdata, handles)
% hObject    handle to sample4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sample5.
function sample5_Callback(hObject, eventdata, handles)
% hObject    handle to sample5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sample6.
function sample6_Callback(hObject, eventdata, handles)
% hObject    handle to sample6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sample1.
function sample1_Callback(hObject, eventdata, handles)
% hObject    handle to sample1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sample2.
function sample2_Callback(hObject, eventdata, handles)
% hObject    handle to sample2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sample3.
function sample3_Callback(hObject, eventdata, handles)
% hObject    handle to sample3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in load7.
function load7_Callback(hObject, eventdata, handles)
% hObject    handle to load7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in load8.
function load8_Callback(hObject, eventdata, handles)
% hObject    handle to load8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in load9.
function load9_Callback(hObject, eventdata, handles)
% hObject    handle to load9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in sample7.
function sample7_Callback(hObject, eventdata, handles)
% hObject    handle to sample7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sample8.
function sample8_Callback(hObject, eventdata, handles)
% hObject    handle to sample8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sample9.
function sample9_Callback(hObject, eventdata, handles)
% hObject    handle to sample9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
play(handles.current_data)

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.current_data)

% --- Executes on selection change in effects.
function effects_Callback(hObject, eventdata, handles)
% hObject    handle to effects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns effects contents as cell array
%        contents{get(hObject,'Value')} returns selected item from effects


% --- Executes during object creation, after setting all properties.
function effects_CreateFcn(hObject, eventdata, handles)
% hObject    handle to effects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Determine the selected data set.
str = get(hObject,'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val};
    case 'Sample Reversal' 
        y = flipud(handles.y); %Flips the sound to reverse
        handles.current_data = audioplayer(y,handles.fs);
    case 'Delay'
        leftout = handles.y;
        N = 10000;  % Sets the delay length where 44100 = 1 second
        for n=N+1:length(left)
           leftout(n)=handles.left(n)+handles.left(n-N); 
        end
        delay = audioplayer(leftout,handles.fs);
        handles.current_data = delay;
    case 'Tone Control (High)' 
        out = handles.y;
        for n=2:length(handles.y)
           out(n,1)=handles.y(n,1)-handles.y(n-1,1); % left
           out(n,2)=handles.y(n,2)-handles.y(n-1,2); % right
        end
        tch = audioplayer(out,handles.fs);
        handles.current_data = tch;
    case 'Tone Control (Low)'
        out = handles.y;
        for n=2:length(handles.y)
           out(n,1)=.9*out(n-1,1)+handles.y(n,1); % left
           out(n,2)=.9*out(n-1,2)+handles.y(n,2); % right
        end
        tcl = audioplayer(out,handles.fs);
        handles.current_data = tcl;    
    case 'Speed Up'
        speedup = audioplayer(handles.y,handles.fs*1.5); %Value multiplied by fs changes speed
        handles.current_data = speedup;
    case 'Voice Removal'
        vocalrem = audioplayer(handles.left-handles.right,handles.fs); 
        handles.current_data = vocalrem;
end
    
    


% Save the handles structure.
guidata(hObject,handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
