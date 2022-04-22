public with sharing class LogFlowExceptions {

      public class MethodInput {

        @InvocableVariable(required=true)
        public String faultMessage;

        @InvocableVariable(required=true)
        public String flowName;

        @InvocableVariable(required=false)
        public String failing_action_name;

      }
    
    @InvocableMethod( label = 'Log flow exception') 
    public static void LogExceptions(List<MethodInput> methodInputs) {
        
        Logger exceptionLogger = Logger.get();
        
        for (MethodInput input : methodInputs) {

            FlowException newFlowException = new FlowException( input.faultMessage,input.flowName, input.failing_action_name);
            exceptionLogger.add(newFlowException);
        
        }

        exceptionLogger.publish();
        

    }
}