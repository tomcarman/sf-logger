public with sharing class FlowException extends Exception {

    public String flowName;
    public String failingActionName;

    public FlowException( String faultMessage, String flowName, String failingActionName ) {
        
        this(faultMessage,flowName);
        this.failingActionName = failingActionName;
        
    }
    public FlowException(String faultMessage,String flowName) {
        
        this.flowName = flowName;
        setMessage(faultMessage);
        
    }
}