
function varargout = project(varargin)
% PROJECT MATLAB code for project.fig
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
%      applied to the GUI before project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 13-Dec-2021 13:14:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
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


% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project (see VARARGIN)

% Choose default command line output for project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input_f_Callback(hObject, eventdata, handles)
% hObject    handle to input_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_f as text
%        str2double(get(hObject,'String')) returns contents of input_f as a double


% --- Executes during object creation, after setting all properties.
function input_f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_plot.
function button_plot_Callback(hObject, eventdata, handles)

f = inline(get(handles.input_f,'string'),'t');
t = eval(get(handles.input_t,'string'));
axes(handles.axes1);
plot(t , f(t))
xlabel("t");
ylabel("f(t)");
title("graph f(t)");
grid;

a = str2double(get(handles.input_a , 'string'));
b = str2double(get(handles.input_b , 'string'));
c = str2double(get(handles.input_c , 'string'));
axes(handles.axes2);
plot(t , c*f(a*t+b))
xlabel("t");
ylabel("cf(at+b)");
title("graph cf(at+b)");
gride;



% --- Executes on button press in button_con.
function button_con_Callback(hObject, eventdata, handles)

f = inline(get(handles.input_f,'string'),'t');
t = eval(get(handles.input_t,'string'));
axes(handles.axes1);
plot(t , f(t))
xlabel("t");
ylabel("f(t)");
title("graph f(t)");
grid;

h = inline(get(handles.input_f , 'string'),'t');
t = eval(get(handles.input_t , 'string'));
t_f = 2*t(1,1);
t_e = 2*t(end);
r =t(1,2) - t(1,1);
T = t_f:r:t_e;
x = inline('hardlim(t+1)-hardlim(t-1)','t');
y = conv(x(t),h(t));
axes(handles.axes2);
plot(T ,y)
xlabel("t");
ylabel("f(t)");
title("graph convolution f(t)");



function input_a_Callback(hObject, eventdata, handles)
% hObject    handle to input_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_a as text
%        str2double(get(hObject,'String')) returns contents of input_a as a double


% --- Executes during object creation, after setting all properties.
function input_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input_b_Callback(hObject, eventdata, handles)
% hObject    handle to input_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_b as text
%        str2double(get(hObject,'String')) returns contents of input_b as a double


% --- Executes during object creation, after setting all properties.
function input_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input_c_Callback(hObject, eventdata, handles)
% hObject    handle to input_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_c as text
%        str2double(get(hObject,'String')) returns contents of input_c as a double


% --- Executes during object creation, after setting all properties.
function input_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input_t_Callback(hObject, eventdata, handles)
% hObject    handle to input_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_t as text
%        str2double(get(hObject,'String')) returns contents of input_t as a double


% --- Executes during object creation, after setting all properties.
function input_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
