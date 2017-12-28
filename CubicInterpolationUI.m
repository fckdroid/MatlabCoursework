classdef CubicInterpolationUI < matlab.apps.AppBase
    
    % Properties that correspond to app components
    properties (Access = public)
        UIFigure              matlab.ui.Figure                   % Cubic in...
        LabelEditField        matlab.ui.control.Label            % F(x) =
        Fx                    matlab.ui.control.EditField        % 2*x^2+16/x
        UIAxes                matlab.ui.control.UIAxes           % Graph
        BtnFindMin            matlab.ui.control.Button           % Find min
        Label4                matlab.ui.control.Label            % X  =
        X0                    matlab.ui.control.EditField        % 1
        Label5                matlab.ui.control.Label            %  =
        Delta                 matlab.ui.control.EditField        % 1
        Label6                matlab.ui.control.Label            %  =
        Eps1                  matlab.ui.control.EditField        % 0.01
        Label7                matlab.ui.control.Label            %  =
        Eps2                  matlab.ui.control.EditField        % 0.03
        LabelNumericEditField matlab.ui.control.Label            % X =
        MinX                  matlab.ui.control.NumericEditField % [-Inf Inf]
        Label9                matlab.ui.control.Label            % Y =
        MinY                  matlab.ui.control.NumericEditField % [-Inf Inf]
    end
    
    
    methods (Access = private)
                
        % BtnFindMin button pushed function
        function onBtnFindClicked(app)
            
            fun = str2func(['@(x)' vectorize(app.Fx.Value)]);
            x1 = str2double(app.X0.Value);
            delta = str2double(app.Delta.Value);
            eps1 = str2double(app.Eps1.Value);
            eps2 = str2double(app.Eps2.Value);
            
            xFinal = CubicInterpolation(fun, x1, delta, eps1, eps2);
            
            %Show answer
            app.MinX.Value = double(xFinal);
            app.MinX.Enable = 'on';
            
            yFinal = subs(fun, x, xFinal);
            app.MinY.Value = double(yFinal);
            app.MinY.Enable = 'on';
            
            axis(app.UIAxes, [-5*double(xFinal) 7*double(xFinal) -double(yFinal) 7*double(yFinal)])
            plot(app.UIAxes, xFinal,yFinal,'o')
            hold(app.UIAxes,'on')
            
            plot(app.UIAxes, fun(linspace(-200,200)))
            
            x = 0:0.01:5;
            
            plot(app.UIAxes, x, fun(x))
            
        end
    end
    
    % App initialization and construction
    methods (Access = private)
        
        % Create UIFigure and components
        function createComponents(app)
            
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 374];
            app.UIFigure.Name = 'Cubic interpolation method';
            setAutoResize(app, app.UIFigure, true)
            
            % Create LabelEditField
            app.LabelEditField = uilabel(app.UIFigure);
            app.LabelEditField.HorizontalAlignment = 'right';
            app.LabelEditField.Position = [32 301 34 15];
            app.LabelEditField.Text = 'F(x) = ';
            
            % Create Fx
            app.Fx = uieditfield(app.UIFigure, 'text');
            app.Fx.Position = [65 299 216 20];
            app.Fx.Value = '2*x^2+16/x';
            
            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Graph');
            xlabel(app.UIAxes, 'X');
            ylabel(app.UIAxes, 'Y');
            app.UIAxes.Box = 'on';
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [307 103 300 247];
            
            % Create BtnFindMin
            app.BtnFindMin = uibutton(app.UIFigure, 'push');
            app.BtnFindMin.ButtonPushedFcn = createCallbackFcn(app, @onBtnFindClicked);
            app.BtnFindMin.Position = [82 40 181 39];
            app.BtnFindMin.Text = 'Find min';
            
            % Create Label4
            app.Label4 = uilabel(app.UIFigure);
            app.Label4.HorizontalAlignment = 'right';
            app.Label4.Position = [37 265 29 15];
            app.Label4.Text = 'X  = ';
            
            % Create X0
            app.X0 = uieditfield(app.UIFigure, 'text');
            app.X0.Position = [65 263 216 20];
            app.X0.Value = '1';
            
            % Create Label5
            app.Label5 = uilabel(app.UIFigure);
            app.Label5.HorizontalAlignment = 'right';
            app.Label5.Position = [45 226 21 15];
            app.Label5.Text = ' = ';
            
            % Create Delta
            app.Delta = uieditfield(app.UIFigure, 'text');
            app.Delta.Position = [65 224 216 20];
            app.Delta.Value = '1';
            
            % Create Label6
            app.Label6 = uilabel(app.UIFigure);
            app.Label6.HorizontalAlignment = 'right';
            app.Label6.Position = [41 189 25 15];
            app.Label6.Text = ' = ';
            
            % Create Eps1
            app.Eps1 = uieditfield(app.UIFigure, 'text');
            app.Eps1.Position = [65 186 216 20];
            app.Eps1.Value = '0.01';
            
            % Create Label7
            app.Label7 = uilabel(app.UIFigure);
            app.Label7.HorizontalAlignment = 'right';
            app.Label7.Position = [41 151 25 15];
            app.Label7.Text = ' = ';
            
            % Create Eps2
            app.Eps2 = uieditfield(app.UIFigure, 'text');
            app.Eps2.Position = [65 149 216 20];
            app.Eps2.Value = '0.03';
            
            % Create LabelNumericEditField
            app.LabelNumericEditField = uilabel(app.UIFigure);
            app.LabelNumericEditField.HorizontalAlignment = 'right';
            app.LabelNumericEditField.Position = [398 64 20 15];
            app.LabelNumericEditField.Text = 'X =';
            
            % Create MinX
            app.MinX = uieditfield(app.UIFigure, 'numeric');
            app.MinX.Enable = 'off';
            app.MinX.Editable = 'off';
            app.MinX.Position = [433 60 100 22];
            
            % Create Label9
            app.Label9 = uilabel(app.UIFigure);
            app.Label9.HorizontalAlignment = 'right';
            app.Label9.Position = [398 35 20 15];
            app.Label9.Text = 'Y =';
            
            % Create MinY
            app.MinY = uieditfield(app.UIFigure, 'numeric');
            app.MinY.Enable = 'off';
            app.MinY.Editable = 'off';
            app.MinY.Position = [433 31 100 22];
        end
    end
    
    methods (Access = public)
        
        % Construct app
        function app = CubicInterpolationUI()
            
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
