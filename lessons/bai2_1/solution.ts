export class SmartContract {
    private message: string;

    constructor(initialMessage: string) {
        this.message = initialMessage;
    }

    public updateMessage(newMsg: string): void {
        this.message = newMsg;
    }

    public getMessage(): string {
        return this.message;
    }
}

const myContract = new SmartContract("Hello World! ");


console.log("Message: ", myContract.getMessage()); 


myContract.updateMessage("Update Message! "); 


console.log("Message: ", myContract.getMessage()); 


myContract.updateMessage("Final Message! ");
console.log("Message: ", myContract.getMessage());