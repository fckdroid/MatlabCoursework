classdef App < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure       matlab.ui.Figure            % Cubic interpolation me...
        LabelEditField matlab.ui.control.Label     % F(x) = 
        EditField      matlab.ui.control.EditField % 2*x^2+16/x
        UIAxes         matlab.ui.control.UIAxes    % Title
        Button         matlab.ui.control.Button    % Find min
        Label2         matlab.ui.control.Label     % Answer:
        Label3         matlab.ui.control.Label    
        Label4         matlab.ui.control.Label     % X  = 
        EditField2     matlab.ui.control.EditField % 1
        Label5         matlab.ui.control.Label     %  = 
        EditField3     matlab.ui.control.EditField % 1
        Label6         matlab.ui.control.Label     %  = 
        EditField4     matlab.ui.control.EditField % 0.01
        Label7         matlab.ui.control.Label     %  = 
        EditField5     matlab.ui.control.EditField % 0.03
    end

    
    properties (Access = private)
        
    end

    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
        end

        % Button button pushed function
        function onBtnFindClicked(app)
            
            x = linspace(0, 10, 25);
            fun = str2func(['@(x)' vectorize(app.EditField.Value)]);
            z = diff(fun(x));
            plot(app.UIAxes, z)
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 331];
            app.UIFigure.Name = 'Cubic interpolation method';
            setAutoResize(app, app.UIFigure, true)

            % Create LabelEditField
            app.LabelEditField = uilabel(app.UIFigure);
            app.LabelEditField.HorizontalAlignment = 'right';
            app.LabelEditField.Position = [32 260 34 15];
            app.LabelEditField.Text = 'F(x) = ';

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'text');
            app.EditField.Position = [65 258 216 20];
            app.EditField.Value = '2*x^2+16/x';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title');
            xlabel(app.UIAxes, 'X');
            ylabel(app.UIAxes, 'Y');
            app.UIAxes.Box = 'on';
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [307 60 300 247];

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @onBtnFindClicked);
            app.Button.Position = [107 60 100 22];
            app.Button.Text = 'Find min';

            % Create Label2
            app.Label2 = uilabel(app.UIFigure);
            app.Label2.HorizontalAlignment = 'right';
            app.Label2.VerticalAlignment = 'center';
            app.Label2.Position = [264 25 44 15];
            app.Label2.Text = 'Answer:';

            % Create Label3
            app.Label3 = uilabel(app.UIFigure);
            app.Label3.VerticalAlignment = 'center';
            app.Label3.Position = [329 25 20 15];
            app.Label3.Text = '...';

            % Create Label4
            app.Label4 = uilabel(app.UIFigure);
            app.Label4.HorizontalAlignment = 'right';
            app.Label4.Position = [37 217 29 15];
            app.Label4.Text = 'X  = ';

            % Create EditField2
            app.EditField2 = uieditfield(app.UIFigure, 'text');
            app.EditField2.Position = [65 215 216 20];
            app.EditField2.Value = '1';

            % Create Label5
            app.Label5 = uilabel(app.UIFigure);
            app.Label5.HorizontalAlignment = 'right';
            app.Label5.Position = [45 179 21 15];
            app.Label5.Text = ' = ';

            % Create EditField3
            app.EditField3 = uieditfield(app.UIFigure, 'text');
            app.EditField3.Position = [65 177 216 20];
            app.EditField3.Value = '1';

            % Create Label6
            app.Label6 = uilabel(app.UIFigure);
            app.Label6.HorizontalAlignment = 'right';
            app.Label6.Position = [41 142 25 15];
            app.Label6.Text = ' = ';

            % Create EditField4
            app.EditField4 = uieditfield(app.UIFigure, 'text');
            app.EditField4.Position = [65 140 216 20];
            app.EditField4.Value = '0.01';

            % Create Label7
            app.Label7 = uilabel(app.UIFigure);
            app.Label7.HorizontalAlignment = 'right';
            app.Label7.Position = [41 103 25 15];
            app.Label7.Text = ' = ';

            % Create EditField5
            app.EditField5 = uieditfield(app.UIFigure, 'text');
            app.EditField5.Position = [65 101 216 20];
            app.EditField5.Value = '0.03';
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

