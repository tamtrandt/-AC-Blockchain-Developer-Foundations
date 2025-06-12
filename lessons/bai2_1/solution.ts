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

// Lấy và in thông điệp ban đầu
console.log("Message: ", myContract.getMessage()); 

// Cập nhật thông điệp
myContract.updateMessage("Update Message! "); 

// Lấy và in thông điệp sau khi cập nhật
console.log("Message: ", myContract.getMessage()); 

// Cập nhật lại lần nữa
myContract.updateMessage("Final Message! ");
console.log("Message: ", myContract.getMessage());