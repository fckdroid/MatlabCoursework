classdef Coursework_Suhockii < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        CourseWork_Suhockii matlab.ui.Figure         % Coursework Suhockii
        BtnCubicInterp      matlab.ui.control.Button % Cubic interpolation
        BtnHookeJeeves      matlab.ui.control.Button % Hooke Jeeves
        BtnMultiParam       matlab.ui.control.Button % Multi Parametric
    end

    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
        end

        % BtnCubicInterp button pushed function
        function onCubicInterp(app)
            App()
        end

        % BtnHookeJeeves button pushed function
        function onHookeJeeves(app)
            fig = openfig('Laba1.fig');
    hand = guihandles(fig);
    guidata(fig, hand); 
        end

        % BtnMultiParam button pushed function
        function onMultiParam(app)
            fig = openfig('multiparametric.fig');
    hand = guihandles(fig);
    guidata(fig, hand);
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create CourseWork_Suhockii
            app.CourseWork_Suhockii = uifigure;
            app.CourseWork_Suhockii.Position = [100 100 640 210];
            app.CourseWork_Suhockii.Name = 'Coursework Suhockii';
            setAutoResize(app, app.CourseWork_Suhockii, true)

            % Create BtnCubicInterp
            app.BtnCubicInterp = uibutton(app.CourseWork_Suhockii, 'push');
            app.BtnCubicInterp.ButtonPushedFcn = createCallbackFcn(app, @onCubicInterp);
            app.BtnCubicInterp.Position = [36.5 80 178 49];
            app.BtnCubicInterp.Text = 'Cubic interpolation';

            % Create BtnHookeJeeves
            app.BtnHookeJeeves = uibutton(app.CourseWork_Suhockii, 'push');
            app.BtnHookeJeeves.ButtonPushedFcn = createCallbackFcn(app, @onHookeJeeves);
            app.BtnHookeJeeves.Position = [239.5 80 178 49];
            app.BtnHookeJeeves.Text = 'Hooke Jeeves';

            % Create BtnMultiParam
            app.BtnMultiParam = uibutton(app.CourseWork_Suhockii, 'push');
            app.BtnMultiParam.ButtonPushedFcn = createCallbackFcn(app, @onMultiParam);
            app.BtnMultiParam.Position = [439.5 80 178 49];
            app.BtnMultiParam.Text = 'Multi Parametric';
        end
    end

    methods (Access = public)

        % Construct app
        function app = Coursework_Suhockii()

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.CourseWork_Suhockii)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.CourseWork_Suhockii)
        end
    end
end

