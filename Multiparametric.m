function varargout = multiparametric(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @multiparametric_OpeningFcn, ...
                   'gui_OutputFcn',  @multiparametric_OutputFcn, ...
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


% --- Executes just before multiparametric is made visible.
function multiparametric_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
set(handles.textValueOfParameters,'String',get(handles.sliderNumberOfParameters, 'Value'));
set(handles.textValueOfFunctions,'String',get(handles.sliderNumberOfFunctions, 'Value'));
clearData(handles);

% --- Outputs from this function are returned to the command line.
function varargout = multiparametric_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function sliderNumberOfParameters_Callback(hObject, eventdata, handles)
set(handles.textValueOfParameters, 'String', num2str(get(hObject, 'Value')));
clearData(handles);

% --- Executes during object creation, after setting all properties.
function sliderNumberOfParameters_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'Max', 5, 'Min', 1, 'Value', 1, 'SliderStep', [1/4 1/4]);

function sliderNumberOfFunctions_Callback(hObject, eventdata, handles)
set(handles.textValueOfFunctions, 'String', num2str(get(hObject, 'Value')));
clearData(handles);

% --- Executes during object creation, after setting all properties.
function sliderNumberOfFunctions_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'Max', 5, 'Min', 1, 'Value', 1, 'SliderStep', [1/4 1/4]);

function editMinX1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editMinX1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editMaxX1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editMaxX1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editMinX2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editMinX2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editMaxX2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editMaxX2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editMinX3_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editMinX3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editMaxX3_Callback(hObject, eventdata, handles)

function editMaxX3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editMinX4_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editMinX4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editMaxX4_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editMaxX4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editMinX5_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editMinX5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editMaxX5_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editMaxX5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editF1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editF1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editF2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editF2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editF3_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editF3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editF4_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editF4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editF5_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editF5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editNumberOfSolutions_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editNumberOfSolutions_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editL1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editL1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editL2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editL2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editL3_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editL3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editL4_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editL4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editL5_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editL5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editDirectionF1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editDirectionF1_CreateFcn(hObject, eventdata, handles)
     See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editDirectionF2_Callback(hObject, eventdata, handles)  

% --- Executes during object creation, after setting all properties.
function editDirectionF2_CreateFcn(hObject, eventdata, handles)
      See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editDirectionF3_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editDirectionF3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editDirectionF5_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editDirectionF5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editDirectionF4_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function editDirectionF4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
    
function prepareEdits(handles, count, type)
for i=1:5
    s = strcat('edit', type, num2str(i));
    set(handles.(s), 'Enable', 'off');
    if(i <= count)
    set(handles.(s), 'Enable', 'on');
    end
end

function generateColunmName(handles, count, type)
allNames = get(handles.table, 'columnname');
columnFormat = {};
newNames = {};
if type == 'X'
    [newNames, columnFormat] =  addNewNames(newNames, type, count, columnFormat);
    [newNames, columnFormat] = addOldNames(newNames,allNames, type, columnFormat);
else
    [newNames, columnFormat] = addOldNames(newNames,allNames, type, columnFormat);
    [newNames, columnFormat] =  addNewNames(newNames, type, count, columnFormat);
end
set(handles.table, 'columnname', newNames, 'columnformat', columnFormat);

function [newNames, columnFormat] = addNewNames(newNames, type, count, columnFormat) 
for i=1:count
    newNames{end+1} = strcat(type, num2str(i));
    columnFormat{end+1} = 'numeric';
end

function [newNames, columnFormat] = addOldNames(newNames, allNames, type, columnFormat) 
count  = numel(allNames);
for i=1:count
    bool = isempty(strfind(allNames{i}, type));
    if bool == 1
        newNames{end+1}  = allNames{i};
        columnFormat{end+1} = 'numeric';
    end
end

% --- Executes on button press in pushbuttonGetStartPoints.
function pushbuttonGetStartPoints_Callback(hObject, eventdata, handles)
clearData(handles);
[numberOfSolutions, numberOfParameters] = getDefaultData(handles);
tableData = getStartPoints(numberOfSolutions, numberOfParameters, handles);
disp(class(tableData(1,1)));
set(handles.table,'data', tableData);
set(handles.pushbuttonGetFunctionsValue, 'Enable', 'on');

function tableData = getStartPoints(numberOfSolutions, numberOfParameters, handles)
tableData = [];
for i=1:numberOfSolutions
    newRow = [];
    arrayOfMin = getDataFromEdit(handles, numberOfParameters, 'editMinX');
    arrayOfMax = getDataFromEdit(handles, numberOfParameters, 'editMaxX');
    for j=1:numberOfParameters
        newRow = [newRow, {randi([str2num(arrayOfMin{j}), str2num(arrayOfMax{j})])}];
    end
    tableData = [tableData; newRow];
end


% --- Executes on button press in pushbuttonGetFunctionsValue.
function pushbuttonGetFunctionsValue_Callback(hObject, eventdata, handles)
tableData = get(handles.table, 'Data');
tableData = getFunctionsValue(tableData, handles);

set(handles.table, 'Data', tableData);
set(handles.pushbuttonGetPoretoPoints, 'Enable', 'on');

function tableData = getFunctionsValue(tableData, handles)
[numberOfSolutions, numberOfParameters, numberOfFunctions] = getDefaultData(handles);
for i=1:numberOfSolutions
    for j=1:numberOfFunctions
        [funct, countOfInpuntParameters] = getFunction(handles, j);
        if(numberOfParameters < countOfInpuntParameters)
            msgbox('Error! Count of parameters should not be less than count of input parameters.');
            return;
        end
        arrayOfParameters = getParameters(cell2mat(tableData(i, 1:numberOfParameters)), countOfInpuntParameters);
        value = getValueOfFunction(countOfInpuntParameters, funct, arrayOfParameters);
        tableData(i,numberOfParameters + j) = {value};
    end    
end

function arrayOfParameters = getParameters(currRow, count)
arrayOfParameters = [];
for i=1:count
    arrayOfParameters = [arrayOfParameters, currRow(i)];
end

function [funct, countOfInpuntParameters] = getFunction(handles, which)
funstr=get(handles.(strcat('editF', num2str(which))), 'String');
funct=inline(funstr);
countOfInpuntParameters = nargin(funct);

function value = getValueOfFunction(numberOfImpuntParameters, funct, arrayOfParameters)
switch numberOfImpuntParameters
    case 1
        value = funct(arrayOfParameters(1));
    case 2
        value = funct(arrayOfParameters(1),arrayOfParameters(2));
    case 3
        value = funct(arrayOfParameters(1),arrayOfParameters(2),arrayOfParameters(3));
    case 4 
        value = funct(arrayOfParameters(1),arrayOfParameters(2),arrayOfParameters(3),arrayOfParameters(4));
    case 5
        value = funct(arrayOfParameters(1),arrayOfParameters(2),arrayOfParameters(3),arrayOfParameters(4),arrayOfParameters(5));
end

% --- Executes on button press in pushbuttonGetPoretoPoints.
function pushbuttonGetPoretoPoints_Callback(hObject, eventdata, handles)
tableData = get(handles.table, 'Data');
tableData = getPoretoPoints(tableData, handles);
set(handles.table, 'Data', tableData);
set(handles.pushbuttonNormalizePoints, 'Enable', 'on');

function tableData = getPoretoPoints(tableData, handles)
rowCount = addColumnNames(handles, {'Poreto Points', 'Power'});
[numberOfSolutions, numberOfParameters, numberOfFunctions] = getDefaultData(handles);
tableData = setDefaultRange(tableData, numberOfSolutions, rowCount);
directionOfFunctions = getDataFromButtonGroups(handles, numberOfFunctions, 'uipanelFunction');
for i=1:numberOfSolutions
    for j=i+1:numberOfSolutions
        rowOne = cell2mat(tableData(i, numberOfParameters + 1 : rowCount));
        rowTwo = cell2mat((tableData(j, numberOfParameters + 1 : rowCount)));
        string = compareRow(rowOne, rowTwo, numberOfFunctions, directionOfFunctions);  
        tableData = setPoretoPoints(tableData, rowCount, string, i, j);
    end
end
indexInColumn = indexOfMax(cell2mat(tableData(:, numberOfParameters + numberOfFunctions + 2)));
point = num2str(cell2mat(tableData(indexInColumn, numberOfParameters + numberOfFunctions + 2)));
tableData(indexInColumn, numberOfParameters + numberOfFunctions + 2) = {markBest(point)};

function tableData = setDefaultRange(tableData, numberOfSolutions, rowCount)
for i=1:numberOfSolutions
    tableData(i, rowCount + 1) = {'K'};
    tableData(i, rowCount + 2) = {'0'};
end

function string = compareRow(rowOne, rowTwo, numberOfFunctions, directionOfFunctions)
compareArray = {};
for i=1:numberOfFunctions
    compareArray{end+1} = compareTwoValue(rowOne(i),rowTwo(i), directionOfFunctions{i});
end
if checkOnBool(compareArray, true)
   string = 'isBetter';
elseif checkOnBool(compareArray, false)
    string = 'isWorse';
else 
    string = 'areEqual';
end

function bool = compareTwoValue(a, b, type)
if strcmp(type, 'UP')
    if a > b 
        bool = true;
    elseif a < b
        bool = false;
    elseif a == b 
        bool = '';
    end
else strcmp(type, 'DOWN')
   if a < b 
        bool = true;
    elseif a > b
        bool = false;
    elseif a == b 
        bool = '';
    end 
end

function bool = checkOnBool(array, type)
bool = true;
for i=1:numel(array)
    if array{i} == ''
        continue;
    elseif array{i} ~= type;
        bool = false;
        return;
    end
end

function tableData = setPoretoPoints(tableData, rowCount, string, i, j)
if strcmp(string,'isBetter')
    if ~strcmp(tableData(i, rowCount + 1), 'C')
        tableData(i, rowCount + 1) = {'K'};
    end
    value = str2num(char(tableData(i, rowCount + 2))) + 1;
    tableData(i, rowCount + 2) = {num2str(value)};
    tableData(j, rowCount + 1) = {'C'} ;
elseif strcmp(string,'isWorse')
    if ~strcmp(tableData(i, rowCount + 1), 'C') 
        tableData(j, rowCount + 1) = {'K'}; 
    end
    tableData(i, rowCount + 1) = {'C'} ;
    value = str2num(char(tableData(j, rowCount + 2))) + 1;
    tableData(j, rowCount + 2) = {num2str(value)};           
end

% --- Executes on button press in pushbuttonNormalizePoints.
function pushbuttonNormalizePoints_Callback(hObject, eventdata, handles)
tableData = get(handles.table, 'Data');
[numberOfSolutions, numberOfParameters, numberOfFunctions, totalDirection] = getDefaultData(handles);
if ~checkForContinue(tableData, numberOfSolutions, numberOfParameters, numberOfFunctions)
    msgbox('Error! Next calculating is not make sense.');
    return;
end 
directionOfFunctions = getDataFromButtonGroups(handles, numberOfFunctions, 'uipanelFunction');
[tableData, columnNames] = sortPoints(tableData, numberOfSolutions, numberOfFunctions, numberOfParameters, directionOfFunctions, totalDirection);
addColumnNames(handles, columnNames);
[tableData, columnNames] = normalizePoints(tableData, numberOfSolutions, numberOfFunctions, numberOfParameters);
addColumnNames(handles, columnNames);
set(handles.table, 'Data', tableData);
set(handles.pushbuttonPerfectPointMethod, 'Enable', 'on');
set(handles.pushbuttonAdaptiveMethod, 'Enable', 'on');

function [tableData, columnNames]  = sortPoints(tableData, numberOfSolutions, numberOfFunctions, numberOfParameters, directionOfFunctions, totalDirection)
columnNames = {};
for p=1:numberOfFunctions
    columnNames{end+1} = strcat('UP F', num2str(p));
end
for i=1:numberOfSolutions
    if ~strcmp(tableData(i, numberOfParameters + numberOfFunctions + 1), 'C')
        for j=1:numberOfFunctions      
            if strcmp(directionOfFunctions{j}, totalDirection) 
                value = cell2mat(tableData(i, numberOfParameters + j));
                tableData(i, numberOfParameters + numberOfFunctions + 2 + j) = num2cell(value);
            else 
                value = cell2mat(tableData(i, numberOfParameters + j)) * (-1);
                tableData(i, numberOfParameters + numberOfFunctions + 2 + j) = num2cell(value);
            end
        end  
    end 
end


function [tableData, columnNames]  = normalizePoints(tableData, numberOfSolutions, numberOfFunctions, numberOfParameters)
arrayOfMin = {};
arrayOfDivider = {};
columnNames = {};
for p=1:numberOfFunctions
    column = cell2mat(tableData( : , numberOfParameters + numberOfFunctions + 2 + p));
    arrayOfMin{end+1} = min(column);
    arrayOfDivider{end+1} = max(column) - min(column);
    columnNames{end+1} = strcat('KN-', num2str(p));
end
for i=1:numberOfSolutions
    if ~strcmp(tableData(i, numberOfParameters + numberOfFunctions + 1), 'C')  
        for j=1:numberOfFunctions
                value = (cell2mat(tableData(i, numberOfParameters + numberOfFunctions + 2 + j)) - arrayOfMin{j}) / arrayOfDivider{j};
                tableData(i, numberOfParameters + numberOfFunctions*2 + 2 + j) = num2cell(value);
        end 
    end
end

function isContinue = checkForContinue(tableData, numberOfSolutions, numberOfParameters, numberOfFunctions)
count = 0;
for i=1:numberOfSolutions
    if strcmp(tableData(i, numberOfParameters + numberOfFunctions + 1), 'K')
        count = count + 1;
    end
end
isContinue = count > 1; 

function [numberOfSolutions, numberOfParameters, numberOfFunctions, totalDirection] = getDefaultData(handles)
numberOfFunctions = get(handles.sliderNumberOfFunctions, 'Value');
numberOfParameters = get(handles.sliderNumberOfParameters, 'Value');
numberOfSolutions = str2num(get(handles.editNumberOfSolutions, 'String'));
totalDirection = get(get(handles.uipanelTotalDirection, 'SelectedObject'), 'String');

% --- Executes on button press in pushbuttonPerfectPointMethod.
function pushbuttonPerfectPointMethod_Callback(hObject, eventdata, handles)
tableData = get(handles.table, 'Data');
rowCount = addColumnNames(handles, {'Perfect Point'});
[numberOfSolutions, numberOfParameters, numberOfFunctions] = getDefaultData(handles);
perfectPoint = [1, 1, 1, 1, 1];
for i=1:numberOfSolutions
     if ~strcmp(tableData(i, numberOfParameters + numberOfFunctions + 1), 'C')  
        currPoint = cell2mat(tableData(i, numberOfParameters + numberOfFunctions * 2 + 3 : numberOfParameters + numberOfFunctions*3 + 2));
        tableData(i, rowCount + 1) = {getDistanceBetweenPoint(currPoint, perfectPoint, numberOfFunctions)};
     end
end
column = getDataFromColumn(tableData(:, rowCount + 1), intmax('int32'));
indexInColumn = indexOfMin(column);
point = num2str(cell2mat(tableData(indexInColumn, rowCount + 1)));
tableData(indexInColumn,  rowCount + 1) = {markBest(point)};
set(handles.table, 'Data', tableData);

function distance = getDistanceBetweenPoint(firstPoint, secondPoint, count)
distance = 0;
for i=1:count
    distance = distance + (firstPoint(i) - secondPoint(i)).^2;
end
distanse = sqrt(distance);


% --- Executes on button press in pushbuttonAdaptiveMethod.
function pushbuttonAdaptiveMethod_Callback(hObject, eventdata, handles)
tableData = get(handles.table, 'Data');

[numberOfSolutions, numberOfParameters, numberOfFunctions, totalDirection] = getDefaultData(handles);
arrayOfLambda = [];
sum = 0;
for j=1:numberOfFunctions
    currLambda = str2num(get(handles.(strcat('editL', num2str(j))), 'String'));
    arrayOfLambda = [arrayOfLambda, currLambda]; 
    sum = sum + currLambda;
end
if sum ~= 1 
    msgbox('Error! Sum of lambds should be equal 1');
    return;
end
rowCount = addColumnNames(handles, {'Adaptive'});
for i=1:numberOfSolutions
    if ~strcmp(tableData(i, numberOfParameters + numberOfFunctions + 1), 'C')
        currPoint = cell2mat(tableData(i, numberOfParameters + numberOfFunctions*2 + 3 : numberOfParameters + numberOfFunctions*3 + 2));
        tableData(i, rowCount + 1) =  {getAdaptiveMethodValue(currPoint, numberOfFunctions, arrayOfLambda)};
    end
end
if strcmp(totalDirection, 'UP')
    column = getDataFromColumn(tableData(:, rowCount + 1), intmin('int32'));
    indexInColumn = indexOfMax(column);
else
    column = getDataFromColumn(tableData(:, rowCount + 1), intmax('int32'));
    indexInColumn = indexOfMin(column);
end
point = num2str(cell2mat(tableData(indexInColumn, rowCount + 1)));
tableData(indexInColumn,  rowCount + 1) = {markBest(point)};
set(handles.table, 'Data', tableData);

function value = getAdaptiveMethodValue(currPoint, numberOfFunctions, arrayOfLambda)
value = 0;
for i=1:numberOfFunctions
    value = value + currPoint(i) * arrayOfLambda(i);
end

function min = markBestPoint(column)
min = 0;
for i=1:numel(column)
    if column(i) > column(i+1)
        min = i;
    end    
end

% --- Executes on button press in pushbuttonClear.
function pushbuttonClear_Callback(hObject, eventdata, handles)
clearData(handles);

function dataArray = getDataFromEdit(handles, count, type)
dataArray = {};
for i=1:count
     dataArray{end+1} =  get(handles.(strcat(type, num2str(i))), 'String');
end

function dataArray = getDataFromButtonGroups(handles, count, type)
dataArray = {};
for i=1:count
     dataArray{end+1} = get(get(handles.(strcat(type,num2str(i))), 'SelectedObject'), 'String');
end

function rowCount = addColumnNames(handles, arrayOfNames)
columnNames = get(handles.table, 'columnname');
rowCount = numel(columnNames);
for i=1:numel(arrayOfNames)
    columnNames{end+1} = arrayOfNames{i};
end
set(handles.table, 'columnname', columnNames);

function clearData(handles) 
set(handles.table, 'Data', [[];[]]);
set(handles.table, 'columnname', []);
[numberOfSolutions, numberOfParameters, numberOfFunctions] = getDefaultData(handles);
prepareEdits(handles, numberOfParameters, 'MaxX');
prepareEdits(handles, numberOfParameters, 'MinX');
prepareEdits(handles, numberOfFunctions, 'F');
prepareEdits(handles, numberOfFunctions, 'L');
generateColunmName(handles, numberOfParameters, 'X');
generateColunmName(handles,numberOfFunctions , 'F');
set(handles.pushbuttonGetFunctionsValue, 'Enable', 'off');
set(handles.pushbuttonGetPoretoPoints, 'Enable', 'off');
set(handles.pushbuttonNormalizePoints, 'Enable', 'off');
set(handles.pushbuttonPerfectPointMethod, 'Enable', 'off');
set(handles.pushbuttonAdaptiveMethod, 'Enable', 'off');

function indexOfMin = indexOfMin(column)
[value, index] = min(column);
indexOfMin = index;

function indexOfMax = indexOfMax(column)
[value, index] = max(column);
indexOfMax = index;

function point = markBest(value)
point = strcat(...
    '<html><span style="color: #FF0000; font-weight: bold;">', ...
    value, ...
    '</span></html>');

function array = getDataFromColumn(column, emptyValue)
array = [];
for i=1:numel(column)
    value = cell2mat(column(i));
    if isempty(value)
        array = [array emptyValue];
    end
    array = [array value];
end

% --- Executes when selected cell(s) is changed in table.
function table_CellSelectionCallback(hObject, eventdata, handles)
direction = get(get(handles.uipanelSortDirection, 'SelectedObject'), 'String');
tableData = get(handles.table, 'Data');
if numel(eventdata.Indices) == 0 
    return;
end
if strcmp(direction, 'ascend')
    emptyValue = intmax('int32');
else
    emptyValue = intmin('int32');
end
column = getDataFromColumn(tableData(:, eventdata.Indices(2)),emptyValue);
if strcmp(class(column), 'cell')
    column = char(cell2mat(column));
end
[~,idx] = sort(column, direction);
disp(idx);
try
    tableData = tableData(idx, :);
catch
     msgbox('Error! It''s impossible to sort by this column');
end
numberOfSolutions = numel(tableData(:,1));
set(handles.editNumberOfSolutions, 'string', numberOfSolutions);
set(handles.table, 'Data', tableData);
