function varargout = Laba1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Laba1_OpeningFcn, ...
    'gui_OutputFcn',  @Laba1_OutputFcn, ...
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


function Laba1_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Laba1_OutputFcn(~, ~, handles)
varargout{1} = handles.output;

function FunctEdit_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function AEdit_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function BEdit_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function NEdit_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function clear(handles)
cla
set(handles.clear, 'Enable', 'off')

function number = getNumber(handle)
number = str2double(get(handle, 'String'));

function finishDraw(handles)
set(gca, 'XGrid', 'on')
set(gca, 'YGrid', 'on')

function DevideMethod_Callback(~, ~, handles)
cla
a = getNumber(handles.a);
b = getNumber(handles.b);
epsilon = getNumber(handles.NEdit);
unaryFunction = str2func(['@(X1)' get(handles.FunctEdit, 'String')]);

x = a:epsilon:b;
y = unaryFunction(x);

[x_opt, y_opt] = Bisection(unaryFunction, a, b);
plot(x, y, x_opt, y_opt, 'bs')

finishDraw(handles)
msgbox(strcat('x =  ',  num2str(x_opt), ';', ' y = ', num2str(y_opt)))

function GaussMethod_Callback(~, ~, handles)
cla
x0 = getNumber(handles.AEdit);
y0 = getNumber(handles.BEdit);
ax = getNumber(handles.a);
bx = getNumber(handles.b);
h = getNumber(handles.StepEdit);
binaryFunction = str2func(['@(X1,X2)' get(handles.FunctEdit, 'String')]);

hold on
plot(x0, y0, 'bs')

[X, Y] = meshgrid(ax:h:bx);
[C, hh] = contour(X, Y, binaryFunction(X, Y), [0, 500, 1000, 1500, 2500, 10000, 20000, 50000]);
clabel(C, hh)
[x1, y1, x2, y2, x3, y3] = HookeJeevesWithDichotomy(binaryFunction, x0, y0, ax, bx, h);
textLabel = sprintf('xMin = %f\nyMin = %f', x3, y3);
set(handles.text20, 'String', textLabel);
hold off

finishDraw(handles)

function paramsArray = getDataFromControl(handles,type, spaceCount)
paramsArray = {};
for i=1:spaceCount
    string = strcat(type, num2str(i));
    paramsArray{end+1} = str2double(get(ha5ndles.(string), 'String'));
end

function ClearButton_Callback(~, ~, handles)

cla
x0 = getNumber(handles.AEdit);
y0 = getNumber(handles.BEdit);
ax = getNumber(handles.a);
bx = getNumber(handles.b);
h = getNumber(handles.StepEdit);
binaryFunction = str2func(['@(X1,X2)' get(handles.FunctEdit, 'String')]);

hold on
plot(x0, y0, 'bs')

[X, Y] = meshgrid(ax:h:bx);
[C, hh] = contour(X, Y, binaryFunction(X, Y), [0, 500, 1000, 1500, 2500, 10000, 20000, 50000]);
clabel(C, hh)
[x1, y1, x2, y2, x3, y3] = HookeJeevesWithCubicInterolation(binaryFunction, x0, y0, ax, bx, h);

textLabel = sprintf('xMin = %f\nyMin = %f', x3, y3);
set(handles.text20, 'String', textLabel);
hold off

finishDraw(handles)

function pushbuttonRandomSearch_Callback(~, ~, handles)
CubicInterpolationGUI()

function editSpaceCount_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function prepareTable(handles, ~)
spaceCount = str2double(get(handles.editSpaceCount, 'String'));
newRow = [{[-2]}, {[2]}, {[2]}, false];
for i=1:spaceCount-1
    newRow = [newRow; [{[-2]}, {[2]}, {[2]}, false]];
end
set(handles.tableParams,'Data',newRow);

function [params, checks] = getParams(handles)
table = get(handles.tableParams,'Data');
params = cell2mat(table(:, 1:end-1));
checks = cell2mat(table(:, end))';

function matx = getMatxs(params, spaceCount, check)
X = params(1, :);
[M, ~] = meshgrid(X(1):0.2:X(2));
matx = {};
matx{end + 1} = M;
count = size(M(1, :), 2) - 1;
for i=2:spaceCount
    X = params(i, :);
    countNums = X(2) - X(1);
    step = countNums / count;
    [M, ~] = meshgrid(X(1):step:X(2));
    if i == check(2)
        M = M';
    end
    matx{end + 1} = M;
end

function pushbuttonGenerateSpaces_Callback(hObject, ~, handles)
prepareTable(handles, hObject);

function stepEdit_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function FunctEdit_Callback(hObject, eventdata, handles)



function Result_Callback(hObject, eventdata, handles)
% hObject    handle to Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Result as text
%        str2double(get(hObject,'String')) returns contents of Result as a double


% --- Executes during object creation, after setting all properties.
function Result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StepEdit_Callback(hObject, eventdata, handles)
% hObject    handle to StepEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StepEdit as text
%        str2double(get(hObject,'String')) returns contents of StepEdit as a double


% --- Executes during object creation, after setting all properties.
function StepEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StepEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xmin_Callback(hObject, eventdata, handles)
% hObject    handle to xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmin as text
%        str2double(get(hObject,'String')) returns contents of xmin as a double


% --- Executes during object creation, after setting all properties.
function xmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
