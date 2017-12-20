classdef App < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure              matlab.ui.Figure                   % Cubic in...
        LabelEditField        matlab.ui.control.Label            % F(x) = 
        Fx                    matlab.ui.control.EditField        % 127/4*x^...
        UIAxes                matlab.ui.control.UIAxes           % Title
        BtnFindMin            matlab.ui.control.Button           % Find min
        Label4                matlab.ui.control.Label            % X  = 
        X0                    matlab.ui.control.EditField        % 0.5
        Label5                matlab.ui.control.Label            %  = 
        Delta                 matlab.ui.control.EditField        % 0.25
        Label6                matlab.ui.control.Label            %  = 
        Eps1                  matlab.ui.control.EditField        % 0.02
        Label7                matlab.ui.control.Label            %  = 
        Eps2                  matlab.ui.control.EditField        % 0.05
        LabelNumericEditField matlab.ui.control.Label            % Result:
        Result                matlab.ui.control.NumericEditField % [-Inf Inf]
    end

    
    properties (Access = private)
        
    end
    
    methods (Access = private)
        
        function results = isEndCondition(app, x1, xFinal, dxFinal)
            eps1 = str2double(app.Eps1.Value);
            eps2 = str2double(app.Eps2.Value);
            cond2 = (xFinal - x1) / xFinal;
            results = abs(dxFinal) <= eps1 && abs(cond2) <= eps2;
        end
        
        function results = xMin(app, f1, f2, x1, x2, dx0, dx1)
            z = 3 * (f1 - f2) / (x2 - x1) + dx0 + dx1;
            w = (z^2 - dx0 * dx1)^(1/2);
            if x1 > x2
                w = -w;
            end
            mu = (dx1 + w - z) / (dx1 - dx0 + 2*w);
            if mu < 0
                results = x2;
            elseif (mu >= 0 && mu <= 1)
                results = x2 - mu * (x2 - x1);
            else
                results = x1;
            end
        end
        
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
            
            while true
                % 4) Find f1 f2 dx0 dx1
                f1 = subs(fun, x, x1);
                f2 = subs(fun, x, x2);
                dx0 = subs(dx, x, x1);
                dx1 = subs(dx, x, x2);
                
                % 5) Find min of cubic polynom
                xFinal = xMin(app, f1, f2, x1, x2, dx0, dx1);
                fxFinal = subs(fun, x, xFinal);
                
                % 6) Ñheck condition of decrease
                if fxFinal < f1
                    % 7) check condition of ending
                    dxFinal = subs(dx, x, xFinal);
                    if isEndCondition(app, x1, xFinal, dxFinal)
                        break;
                    else
                        if dxFinal * subs(dx, x, x1) < 0
                            x2 = x1;
                            x1 = xFinal;
                        elseif dxFinal * subs(dx, x, x2) < 0
                            x1 = xFinal;
                        end
                    end
                else
                    while true
                        xFinal = xFinal - (xFinal - x1) / 2;
                        fxFinal = subs(fun, x, xFinal);
                        if fxFinal <= f1
                            break
                        end
                    end
                end
            end
            
            app.Result.Value = double(xFinal);
            app.Result.Enable = 'on';
            
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

            % Create LabelNumericEditField
            app.LabelNumericEditField = uilabel(app.UIFigure);
            app.LabelNumericEditField.HorizontalAlignment = 'right';
            app.LabelNumericEditField.Position = [243 27 38 15];
            app.LabelNumericEditField.Text = 'Result:';

            % Create Result
            app.Result = uieditfield(app.UIFigure, 'numeric');
            app.Result.Enable = 'off';
            app.Result.Editable = 'off';
            app.Result.Position = [296 23 100 22];
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

