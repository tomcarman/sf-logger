# A logging framework for Salesforce using Platform Events

## Why?

Most Salesforce orgs require some form of logging to overcome the limitations of the standard debug logs which do not persist. Logging frameworks often become some of your lowest level code, so its imperative that they are non-blocking to normal code - and equally that failures in the main execution can't block the DML of the logs.

## How?

* Utility class to create logs
* Log structure encapsulated in class, with subclasses to handle different types of logs (or indeed create different types of Platform Events)
* Platform Events are published for any logs created
* A Trigger on the Platform Event listens for events and persists them to a Custom Object


## Installation

### Existing Org
* Deploy metadata using your normal methods

### Scratch Org

1. Clone the repo 
```
git clone https://github.com/tomcarman/logger.git
```

2. Create a new scratch org
```
sfdx force:org:create -f config/project-scratch-def.json -a logger-demo
```

3. Push source to the org
```
sfdx force:source:push -u logger-demo
```

4. Open the org
```
sfdx force:org:open -u logger-demo
```

5. Change to the App 'Logger Demo' and switch the List View to 'All'

<img width="362" alt="app" src="https://user-images.githubusercontent.com/1554713/104477024-b9886800-55b8-11eb-82df-0e43474631b5.png">

<img width="480" alt="view" src="https://user-images.githubusercontent.com/1554713/104477354-e8064300-55b8-11eb-8ee9-7413ecd73bb4.png">

6. View some logs (you'll need to create some first - see Usage)

<img width="1210" alt="loglist" src="https://user-images.githubusercontent.com/1554713/104477537-21d74980-55b9-11eb-9fe8-7c634af506ef.png">

<img width="705" alt="logdetail" src="https://user-images.githubusercontent.com/1554713/104477568-2ac81b00-55b9-11eb-86fa-a2497708501e.png">



# Usage

```
// Create & immediately publish a simple log
Logger.get().publish('Hello world');

// Also accepts Exceptions or DMLExceptions eg.
try {  
	insert new Account();
} catch(DMLException dmlEx) {
    Logger.get().publish(dmlEx);  
}


// If you know you are going to create many logs in quick succession, they
// can be stored on the stack before publishing

Logger.get().add('Starting awesome code');
// Awesome code
// ..
// ..
Logger.get().add('Something went wrong');

// Dont forget to publish the logs!
Logger.get().publish();

```


# Sources

This project is heavily inspired by the following - 

* The recent CodeLive by @codefriar
 

