classdef UserInteractionAgent < handle
    %USERINTERACTIONAGENT 
    
    properties
        application;
    end
    
    methods
        function this = UserInteractionAgent(applicationReference)
           this.application = applicationReference;
        end
        
        %clear the graph and ask the user a set of points for a new bezier curve
        function drawNewCurve(this)
            %get graphical interface
            graphicalInterface = this.application.graphicalInterface;
            graphicalInterface.enterDrawingMode();
            %get bezier curves
            bezierCurves = this.application.bezierCurves;
            %add a curve to the list of curves
            bezierCurves(end+1) = BezierCurve;
            currentCurveIndex = length(bezierCurves);
            %initialize control point indexthisthis
            controlPointIndex=0;
            %matlab doesn't support do-while loop so first we set a true contition
            buttonClicked=1;
            %while the user had clicked the left mouse button
            while (buttonClicked==1)
                %wait for user click
                [clickX,clickY,buttonClicked]=ginput(1);
                %if the left of central mouse button is pressed
                if (buttonClicked==1) || (buttonClicked==2)
                    %if the central mouse buton is pressed
                    if buttonClicked==2
                        %set the control point equal to the first control point for closing
                        %the curve
                        clickX=bezierCurves(end).controlPoints(1,1);
                        clickY=bezierCurves(end).controlPoints(2,1);
                        %set closed curve flag to 1
                        bezierCurves(end).closedCurve=1;
                    end
                    %increse the control point index
                    controlPointIndex=controlPointIndex+1;
                    %add the point to the control point array
                    bezierCurves(end).controlPoints(1,end+1)=clickX;    
                    %the size is been already increased with latest command so only
                    %use end here
                    bezierCurves(end).controlPoints(2,end)=clickY;
                    %if the curve is not closed (in a closed curve the latest
                    %control point will not be plotted)
                    if (bezierCurves(end).closedCurve==0)
                        clickcallback = {@this.controlPointClicked,controlPointIndex,currentCurveIndex};
                        graphicalInterface.plotControlPoint(clickX,clickY,clickcallback,controlPointIndex,currentCurveIndex);
                    end
                end
            end
            
            bezierCurves(end).controlNumber=bezierCurves(end).controlNumber+controlPointIndex;
            bezierCurves(end).controlPieces(bezierCurves(end).controlNumber)=1;
            %update application bezier curves
            this.application.bezierCurves = bezierCurves;
            %draw the bezier curve
            graphicalInterface.drawBezierCurve(currentCurveIndex);
            graphicalInterface.exitDrawingMode();
            this.debugging();
        end
        
        
        function addPiece(this)
            %get graphical interface
            graphicalInterface = this.application.graphicalInterface;
            graphicalInterface.enterDrawingMode();
            %get bezier curves
            bezierCurves = this.application.bezierCurves;
            currentCurveIndex = length(bezierCurves);
            %initialize control point indexthisthis
            controlPointIndex=bezierCurves(end).controlNumber;
            %matlab doesn't support do-while loop so first we set a true contition
            buttonClicked=1;
            %while the user had clicked the left mouse button
            while (buttonClicked==1)
                %wait for user click
                [clickX,clickY,buttonClicked]=ginput(1);
                %if the left of central mouse button is pressed
                if (buttonClicked==1) || (buttonClicked==2)
                    %if the central mouse buton is pressed
                    if buttonClicked==2
                        %set the control point equal to the first control point for closing
                        %the curve
                        clickX=bezierCurves(end).controlPoints(1,1);
                        clickY=bezierCurves(end).controlPoints(2,1);
                        %set closed curve flag to 1
                        bezierCurves(end).closedCurve=1;
                    end
                    %increse the control point index
                    controlPointIndex=controlPointIndex+1;
                    %add the point to the control point array
                    bezierCurves(end).controlPoints(1,end+1)=clickX;
                    %the size is been already increased with latest command so only
                    %use end here
                    bezierCurves(end).controlPoints(2,end)=clickY;
                    %if the curve is not closed (in a closed curve the latest
                    %control point will not be plotted)
                    if (bezierCurves(end).closedCurve==0)
                        clickcallback = {@this.controlPointClicked,controlPointIndex,currentCurveIndex};
                        graphicalInterface.plotControlPoint(clickX,clickY,clickcallback,controlPointIndex,currentCurveIndex);
                    end
                end
            end
            
            bezierCurves(end).controlNumber=bezierCurves(end).controlNumber+controlPointIndex-bezierCurves(end).controlNumber;
            bezierCurves(end).controlPieces(bezierCurves(end).controlNumber)=1; 
            %update application bezier curves
            this.application.bezierCurves = bezierCurves;
            %draw the bezier curve
            graphicalInterface.drawBezierCurve(currentCurveIndex);
            graphicalInterface.exitDrawingMode();
            this.debugging();
        end
        
        
        %called upon click on control point, activates drag and drop
        function controlPointClicked(this,src,~,controlPointIndex,curveIndex)
            %get current figure handler
            fig = gcf;
            %set a listener for mouse move event
            fig.WindowButtonMotionFcn = {@this.controlPointMoved,src,controlPointIndex,curveIndex};
            %set a listener for mouse button relase event
            fig.WindowButtonUpFcn = @this.dropObject;
            %get graphical interface
            graphicalInterface = this.application.graphicalInterface;
            graphicalInterface.clearLines();
        end
        
        %called on drag of control point
        function controlPointMoved(this,figureHandler,~,object,controlPointIndex,curveIndex)
            %get the current position of the mouse
            newPos = get(figureHandler,'CurrentPoint');
            newPos = this.getAxesPosition(newPos);
            %get graphical interface
            graphicalInterface = this.application.graphicalInterface;
            %move the graphical point on the axes
            graphicalInterface.movePlotPoint(newPos,object);
            %change the point in the control point array
            this.moveCurveGeneratorsPoints(newPos,controlPointIndex,curveIndex);
            %get bezier curves
            bezierCurves=this.application.bezierCurves;
            %if we are moving the first control point and is a closed curve
            if ((controlPointIndex==1)&&(bezierCurves(curveIndex).closedCurve==1))
                %get the index of the last control point
                lastIndex = length(bezierCurves(curveIndex).controlPoints);
                %move also the last control point
                this.moveCurveGeneratorsPoints(newPos,lastIndex,curveIndex);
            end
        end
        
        function correctPosition = getAxesPosition(~,absolutePosition)
             %get current axes handler
            ax=gca;
            %get the pixel position and dimension of the axes
            axesPosition = get(ax,'Position');
            %axesPosition is an array of 4 element x,y,width and height
            width = axesPosition(3);
            height = axesPosition(4);
            %calculate pixel offset related to axes position
            absolutePosition(1) = absolutePosition(1) - axesPosition(1);
            absolutePosition(2) = absolutePosition(2) - axesPosition(2);
            %map pixel position to cartesian position
            absolutePosition(1) = absolutePosition(1)/width;
            absolutePosition(2) = absolutePosition(2)/height;
            correctPosition = absolutePosition;
        end
       
        
        function moveCurveGeneratorsPoints(this,newPos,controlPointIndex,curveIndex)
            %get bezier curves
            bezierCurves=this.application.bezierCurves;
            %update control point array
            bezierCurves(curveIndex).controlPoints(1,controlPointIndex)=newPos(1);
            bezierCurves(curveIndex).controlPoints(2,controlPointIndex)=newPos(2);
            %get graphical interface
            graphicalInterface = this.application.graphicalInterface;
            %update application bezier curves
            this.application.bezierCurves = bezierCurves;
            %re-draw bezier curve
            graphicalInterface.drawBezierCurve(curveIndex);
        end
        
        %called after clicked on a control point and relased the mouse button.
        function dropObject(~,~,~)
            %get current figure handler
            fig = gcf;
            %remove listener for mouse move event
            fig.WindowButtonMotionFcn = '';
            %remove listener for mouse button relase event
            fig.WindowButtonUpFcn = '';
        end
        
        
        function enterCurveSelectionMode(this,mode)
            %get graphical interface
            graphicalInterface = this.application.graphicalInterface;
            graphicalInterface.hideControls();
            %get bezier curve
            bezierCurves = this.application.bezierCurves;
            for i=1:length(bezierCurves)
                for i1=1:length(bezierCurves(i).controlBeziers)
                        set(bezierCurves(i).controlBeziers(i1),'ButtonDownFcn',{@this.curveClicked,mode,i,i1,length(bezierCurves(i).controlBeziers)});
                end
            end
            graphicalInterface.setInstruction(mode);
        end
       
      
        %mode=0 if user asked for tangent, 1 for normal , 2 for length,
        %       6 for save curve
        function curveClicked(this,~,~,mode,curveIndex,counter,max)
            %get the position of the click
            clickedPosition = get(gcf,'CurrentPoint');
            clickedPosition = this.getAxesPosition(clickedPosition);
            x = clickedPosition(1);
            y = clickedPosition(2);
            %get selected bezier curve
            bezierCurve = this.application.bezierCurves(curveIndex);
            switch mode
                case 0 %tangent mode
                    line = bezierCurve.getTangent(x,y,counter);
                    this.application.graphicalInterface.plotLine(line,curveIndex);
                case 1 %normal mode
                    line = bezierCurve.getNormal(x,y,counter);
                    this.application.graphicalInterface.plotLine(line,curveIndex);
                case 2 %length mode
                    [length,totalLength] = bezierCurve.getLength(counter,max);
                    (msgbox({['Length:   ',num2str(totalLength)];['Length single curve:   ',num2str(length)] }));
                case 6 %save mode
                    bezierCurve.Save(counter,max);
                    (msgbox({['Curve saved correctly'] }));
            end
        end
        
        %used to see basic information of curves in the Matlab's Command
        %Window
        function debugging(this)
            for i2=0:50 
                fprintf('\n');
            end
            bezierCurves = this.application.bezierCurves;
            i=1;
            while (i<=(length(bezierCurves)))
                i1=1;
                if (length(bezierCurves(i).controlBeziers)==1)
                    fprintf('This Bezier Curve consists of %d control points with the following coordinates:\n',length(bezierCurves(i).controlPoints));
                else
                    fprintf('This Piecewise Bezier Curve consists of %d control points with the following coordinates:\n',length(bezierCurves(i).controlPoints));
                end
                disp(bezierCurves(i).controlPoints);
%                 fprintf('Stylized form: ');
%                 while(i1 <= length(bezierCurves(i).controlPieces))
%                     if (bezierCurves(i).controlPieces(i1) == 0)
%                         fprintf('- ');
%                     else
%                         fprintf('1 ');
%                     end
%                     i1=i1+1;
%                 end
%                 fprintf('\n_____________________________________________________________\n');
                i=i+1;   
            end
        end
        
    end
        
end
    


