//: [Previous](@previous)

import Foundation

actor BankAccount {
    private var balance: Int

    init(initialBalance: Int) {
        balance = initialBalance
    }

    func deposit(amount: Int) {
        balance += amount
    }

    func withdraw(amount: Int) -> Int {
        if balance >= amount {
            balance -= amount
            return amount
        } else {
            let available = balance
            balance = 0
            return available
        }
    }

    func balanceConfig() -> Int {
        return self.balance
    }
}

func transfer(amount: Int, from: BankAccount, to: BankAccount) async throws {
    let available = await from.withdraw(amount: amount)
    await to.deposit(amount: available)
}

let account1 = BankAccount(initialBalance: 100)
let account2 = BankAccount(initialBalance: 50)

func update() async {
    Task {
        try await transfer(amount: 75, from: account2, to: account1)
        print("Transfer complete :: account2 => account1: 75 ")
    }

    Task {
        try await transfer(amount: 50, from: account1, to: account2)
        print("Transfer complete :: account1 => account2 : 50 ")
    }
}

func config() async {
    Task {
        let balance1 = await account1.balanceConfig() // actor method
        let balance2 = await account2.balanceConfig() // actor method
        
        print("account1 balance1 = \(balance1) , account2 balance2 = \(balance2)")
    }
}

print("start")
await update()
await config()

//: [Next](@next)
