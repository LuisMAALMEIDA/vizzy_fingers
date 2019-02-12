classdef Standalone < robotics.ros.Message
    %Standalone MATLAB implementation of B/Standalone
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2018 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'B/Standalone' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = 'f08990622ea009a865c519d927b4febf' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Dependent)
        IntProperty
        StringProperty
    end
    
    properties (Constant, Hidden)
        PropertyList = {'IntProperty', 'StringProperty'} % List of non-constant message properties
        ROSPropertyList = {'intProperty', 'stringProperty'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = Standalone(msg)
            %Standalone Construct the message object Standalone
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function intproperty = get.IntProperty(obj)
            %get.IntProperty Get the value for property IntProperty
            intproperty = typecast(int32(obj.JavaMessage.getIntProperty), 'uint32');
        end
        
        function set.IntProperty(obj, intproperty)
            %set.IntProperty Set the value for property IntProperty
            validateattributes(intproperty, {'numeric'}, {'nonempty', 'scalar'}, 'Standalone', 'IntProperty');
            
            obj.JavaMessage.setIntProperty(intproperty);
        end
        
        function stringproperty = get.StringProperty(obj)
            %get.StringProperty Get the value for property StringProperty
            stringproperty = char(obj.JavaMessage.getStringProperty);
        end
        
        function set.StringProperty(obj, stringproperty)
            %set.StringProperty Set the value for property StringProperty
            stringproperty = convertStringsToChars(stringproperty);
            
            validateattributes(stringproperty, {'char', 'string'}, {}, 'Standalone', 'StringProperty');
            
            obj.JavaMessage.setStringProperty(stringproperty);
        end
    end
    
    methods (Access = protected)
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.IntProperty = obj.IntProperty;
            cpObj.StringProperty = obj.StringProperty;
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.IntProperty = strObj.IntProperty;
            obj.StringProperty = strObj.StringProperty;
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.IntProperty = obj.IntProperty;
            strObj.StringProperty = obj.StringProperty;
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.B.Standalone.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.B.Standalone;
            obj.reload(strObj);
        end
    end
end
