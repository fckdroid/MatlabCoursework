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

function DevideMethod_Callback(~, ~, handles)
    a=str2double(get(handles.AEdit,'String'));
    b=str2double(get(handles.BEdit,'String'));
    n=str2double(get(handles.NEdit,'String'));
    strFunc=get(handles.FunctEdit,'String');
    func = str2func(['@(X1,X2)' strFunc]);
    v = [a, b];
    [x, y] = devide(func,a,b,a,b,n,v);
    xx = a:0.5:b;
    f = func(xx,y);
    min = func(x,y);
    disp(min);
    plot(xx,f,x,min,'rs');
    if get(handles.XGrid,'Value')
        set(gca,'XGrid','on')
    else
        set(gca,'XGrid','off')
    end
    if get(handles.YGrid,'Value')
        set(gca,'YGrid','on')
    else
        set(gca,'YGrid','off')
    end

function GaussMethod_Callback(~, ~, handles)
    a=str2double(get(handles.AEdit,'String'));
    b=str2double(get(handles.BEdit,'String'));
    n=str2double(get(handles.NEdit,'String'));
    strFunc=get(handles.FunctEdit,'String');
    func = str2func(['@(X1,X2)' strFunc]);
    [X,Y] = meshgrid(a:.2:b);
    Z=func(X,Y);
    [C,h]= contour(X,Y,Z,[10,100,1000,5000]);
    clabel(C,h); 
    v = [b, a];     
        for i = 1 : 20
             [x, y] = devide(func,a,b,a,b,n,v);
             line([v(1), x],[v(2),y],'Color','r','LineWidth',3); 
             v = [x , y];
        end
    if get(handles.XGrid,'Value')
        set(gca,'XGrid','on')
    else
        set(gca,'XGrid','off')
    end
    if get(handles.YGrid,'Value')
        set(gca,'YGrid','on')
    else
        set(gca,'YGrid','off')
    end

function paramsArray = getDataFromControl(handles,type, spaceCount)
    paramsArray = {};
    for i=1:spaceCount
        string = strcat(type, num2str(i));
        paramsArray{end+1} = str2double(get(handles.(string), 'String'));
    end

function pushbuttonRandomSearch_Callback(~, ~, handles)
    spaceCount = str2double(get(handles.editSpaceCount, 'String'));
    stepCount = str2double(get(handles.stepEdit, 'String'));
    eps = str2double(get(handles.NEdit, 'String'));
    str = get(handles.FunctEdit, 'string');
    [paramsArr, checks] = getParams(handles);
    check = [];
    for i=1:size(checks, 2)
        if checks(i) == 1
            check(end+1) = i;
        end 
    end;
    params = paramsArr(:,end)';
    num = size(params,2);
    vars = 'X1';
    for i=2:num
        vars = [vars ',X' num2str(i)];
    end
    func_handle = str2func(['@(' vars ')' str]);
    
    P = getMatxs(paramsArr, spaceCount, check);
    Z = func_handle(P{:});
    [C,h]= contour(P{check(1)},P{check(2)},Z,[1,50,100,500]);
    clabel(C,h);    
    steps = newton(func_handle,params,eps,stepCount);
    
    num = size(steps);
    prev = steps(1,:);
    for i=1:num
        curr = steps(i,:);
        line([prev(check(1)), curr(check(1))], [prev(check(2)), curr(check(2))],'Color','g','LineWidth', 3);
        prev = steps(i,:);
    end

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
