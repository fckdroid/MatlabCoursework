function varargout = Main(varargin)
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @main_OpeningFcn, ...
                       'gui_OutputFcn',  @main_OutputFcn, ...
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

function main_OpeningFcn(hObject, ~, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);

function varargout = main_OutputFcn(~, ~, handles) 
    varargout{1} = handles.output;

function pushbutton1_Callback(~, ~, ~)
    fig = openfig('OneParametric.fig');
    hand = guihandles(fig);
    guidata(fig, hand); 

function pushbutton2_Callback(~, ~, ~)
    fig = openfig('MultiParametric.fig');
    hand = guihandles(fig);
    guidata(fig, hand);
