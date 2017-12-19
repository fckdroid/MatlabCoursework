classdef App < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure       matlab.ui.Figure            % Cubic interpolation me...
        LabelEditField matlab.ui.control.Label     % F(x) = 
        Fx             matlab.ui.control.EditField % 127/4*x^2-61/4*x+2
        UIAxes         matlab.ui.control.UIAxes    % Title
        BtnFindMin     matlab.ui.control.Button    % Find min
        Label2         matlab.ui.control.Label     % Answer:
        Label3         matlab.ui.control.Label    
        Label4         matlab.ui.control.Label     % X  = 
        X0             matlab.ui.control.EditField % 0.5
        Label5         matlab.ui.control.Label     %  = 
        Delta          matlab.ui.control.EditField % 0.25
        Label6         matlab.ui.control.Label     %  = 
        Eps1           matlab.ui.control.EditField % 0.02
        Label7         matlab.ui.control.Label     %  = 
        Eps2           matlab.ui.control.EditField % 0.05
    end

    
    properties (Access = private)
        
    end

    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
        end

        % BtnFindMin button pushed function
        function onBtnFindClicked(app)
            
            syms x
            fun = str2func(['@(x)' vectorize(app.Fx.Value)]);
            
            % 2) Find derivative of fun at X
            dx = diff(fun(x), 'x');
            x1 = str2double(app.X0.Value);
            
            
            % 3) Check devirative sign and find M
            delta = str2double(app.Delta.Value);
            M = 0;
            while true
                dx0 = subs(dx, x, x1);
                if dx0 < 0
                    x2 = x1 + 2.^M * delta;
                else
                    x2 = x1 - 2.^M * delta;
                end
                
                dx1 = subs(dx, x, x2);
                M = M + 1;
                if dx0 * dx1 <= 0
                    break
                else
                    x1 = x2;
                end
            end
            
            % 4) Find f1 f2 dx0 dx1
            f1 = subs(fun, x, x1);
            f2 = subs(fun, x, x2);
            
            % 5) Find min of cubic polynom
            z = 3 * (f1 - f2) / (x2 - x1) + dx0 + dx1;
            w = (z^2 - dx0 * dx1)^(1/2);
            if x1 > x2
                w = -w;
            end
            mu = (dx1 + w - z) / (dx1 - dx0 + 2*w);
            if mu < 0
                xFinal = x2;
            elseif (mu >= 0 && mu <= 1)
                xFinal = x2 - mu * (x2 - x1);
            else
                xFinal = x1;
            end
            fxFinal = subs(fun, x, xFinal);
            
            plot(app.UIAxes, fun(linspace(0,1)))
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

            % Create Fx
            app.Fx = uieditfield(app.UIFigure, 'text');
            app.Fx.Position = [65 258 216 20];
            app.Fx.Value = '127/4*x^2-61/4*x+2';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title');
            xlabel(app.UIAxes, 'X');
            ylabel(app.UIAxes, 'Y');
            app.UIAxes.Box = 'on';
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [307 60 300 247];

            % Create BtnFindMin
            app.BtnFindMin = uibutton(app.UIFigure, 'push');
            app.BtnFindMin.ButtonPushedFcn = createCallbackFcn(app, @onBtnFindClicked);
            app.BtnFindMin.Position = [107 60 100 22];
            app.BtnFindMin.Text = 'Find min';

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

            % Create X0
            app.X0 = uieditfield(app.UIFigure, 'text');
            app.X0.Position = [65 215 216 20];
            app.X0.Value = '0.5';

            % Create Label5
            app.Label5 = uilabel(app.UIFigure);
            app.Label5.HorizontalAlignment = 'right';
            app.Label5.Position = [45 179 21 15];
            app.Label5.Text = ' = ';

            % Create Delta
            app.Delta = uieditfield(app.UIFigure, 'text');
            app.Delta.Position = [65 177 216 20];
            app.Delta.Value = '0.25';

            % Create Label6
            app.Label6 = uilabel(app.UIFigure);
            app.Label6.HorizontalAlignment = 'right';
            app.Label6.Position = [41 142 25 15];
            app.Label6.Text = ' = ';

            % Create Eps1
            app.Eps1 = uieditfield(app.UIFigure, 'text');
            app.Eps1.Position = [65 140 216 20];
            app.Eps1.Value = '0.02';

            % Create Label7
            app.Label7 = uilabel(app.UIFigure);
            app.Label7.HorizontalAlignment = 'right';
            app.Label7.Position = [41 103 25 15];
            app.Label7.Text = ' = ';

            % Create Eps2
            app.Eps2 = uieditfield(app.UIFigure, 'text');
            app.Eps2.Position = [65 101 216 20];
            app.Eps2.Value = '0.05';
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

