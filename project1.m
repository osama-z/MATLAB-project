function varargout = project1(varargin)
% PROJECT1 MATLAB code for project1.fig
%      PROJECT1, by itself, creates a new PROJECT1 or raises the existing
%      singleton*.
%
%      H = PROJECT1 returns the handle to a new PROJECT1 or the handle to
%      the existing singleton*.
%
%      PROJECT1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT1.M with the given input arguments.
%
%      PROJECT1('Property','Value',...) creates a new PROJECT1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project1

% Last Modified by GUIDE v2.5 15-Dec-2021 17:32:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project1_OpeningFcn, ...
                   'gui_OutputFcn',  @project1_OutputFcn, ...
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


% --- Executes just before project1 is made visible.
function project1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project1 (see VARARGIN)

% Choose default command line output for project1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project1_OutputFcn(hObject, eventdata, handles) 
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
plot(t , f(t),'linewidth' , 2,'color',[0.3010, 0.7450, 0.9330])
set(gca,'color' , 'k')
grid on
grid minor;
ax = gca;
ax.GridColor = [0.75, 0.75, 0];
ax.XColor = 'w'; 
ax.YColor = 'w'; 
ax.GridAlpha = 0.5;
xlabel("t");
ylabel("f(t)");
title("graph f(t)");

a = str2double(get(handles.input_a , 'string'));
b = str2double(get(handles.input_b , 'string'));
c = str2double(get(handles.input_c , 'string'));
axes(handles.axes2);
plot(t , c*f(a*t+b))
plot(t , f(t),'linewidth' , 2,'color',[0, 0.75, 0.75])
set(gca,'color' , 'k')
grid on
grid minor;
ax = gca;
ax.GridColor = [0.75, 0.75, 0];
ax.XColor = 'w'; 
ax.YColor = 'w'; 
ax.GridAlpha = 0.5;
xlabel("t");
ylabel("cf(at+b)");
title("graph cf(at+b)");


% --- Executes on button press in button_conv.
function button_conv_Callback(hObject, eventdata, handles)

f = inline(get(handles.input_f,'string'),'t');
t = eval(get(handles.input_t,'string'));
axes(handles.axes1);
plot(t , f(t),'linewidth' , 2,'color',[0.3010, 0.7450, 0.9330])
set(gca,'color' , 'k')
grid on
grid minor;
ax = gca;
ax.GridColor = [0.75, 0.75, 0];
ax.XColor = 'w'; 
ax.YColor = 'w'; 
ax.GridAlpha = 0.5;
xlabel("t");
ylabel("f(t)");
title("graph f(t)");

h = inline(get(handles.input_f , 'string'),'t');
t = eval(get(handles.input_t , 'string'));
t_f = 2*t(1,1);
t_e = 2*t(end);
r =t(1,2) - t(1,1);
T = t_f:r:t_e;
t_r = -1:r:1;
x = ones(1,length(t_r));
y= conv(x,h(t))*r;
yx = (1:length(y)).*r + t_r(1);
axes(handles.axes2);
plot(yx ,y,'linewidth' , 2 ,'color',[0, 0.75, 0.75])
set(gca,'color' , 'k')
grid on
grid minor;
ax = gca;
ax.GridColor = [0.75, 0.75, 0];
ax.XColor = 'w'; 
ax.YColor = 'w'; 
ax.GridAlpha = 0.5;
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
