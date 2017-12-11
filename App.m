classdef App < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure       matlab.ui.Figure            % UI Figure
        Label          matlab.ui.control.Label     % Поиск безусловного мин...
        LabelEditField matlab.ui.control.Label     % f(x) = 
        EditField      matlab.ui.control.EditField % x^2*sin(x)
        UIAxes         matlab.ui.control.UIAxes    % Title
        Button         matlab.ui.control.Button    % Найти минимум
        Label2         matlab.ui.control.Label     % Ответ:
        Label3         matlab.ui.control.Label    
    end

    
    properties (Access = private)
        
    end

    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
        end

        % Button button pushed function
        function onBtnFindClicked(app)
            s = app.EditField.Value;                                            % Not Vectorized (Illustration Only)
            s_funv = str2func(['@(x)' vectorize(s)]);                           % Vectorized
            x = linspace(0, 10, 25);
            plot(app.UIAxes, x, s_funv(x))
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 353];
            app.UIFigure.Name = 'UI Figure';
            setAutoResize(app, app.UIFigure, true)

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.HorizontalAlignment = 'center';
            app.Label.VerticalAlignment = 'center';
            app.Label.Position = [0 245 640 108];
            app.Label.Text = 'Поиск безусловного минимума методом кубической интерполяции';

            % Create LabelEditField
            app.LabelEditField = uilabel(app.UIFigure);
            app.LabelEditField.HorizontalAlignment = 'right';
            app.LabelEditField.Position = [20 146 30 15];
            app.LabelEditField.Text = 'f(x) = ';

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'text');
            app.EditField.Position = [49 144 216 20];
            app.EditField.Value = 'x^2*sin(x)';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title');
            xlabel(app.UIAxes, 'X');
            ylabel(app.UIAxes, 'Y');
            app.UIAxes.Box = 'on';
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [320 61 300 185];

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @onBtnFindClicked);
            app.Button.Position = [107 102 100 22];
            app.Button.Text = 'Найти минимум';

            % Create Label2
            app.Label2 = uilabel(app.UIFigure);
            app.Label2.HorizontalAlignment = 'right';
            app.Label2.VerticalAlignment = 'center';
            app.Label2.Position = [20 4 286 58];
            app.Label2.Text = 'Ответ:';

            % Create Label3
            app.Label3 = uilabel(app.UIFigure);
            app.Label3.VerticalAlignment = 'center';
            app.Label3.Position = [329 4 311 58];
            app.Label3.Text = '...';
        end
    end

    methods (Access = public)

        % Construct app
        function app = App()

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end

