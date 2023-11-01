import Foundation

public class AccountHandler {
    public init() {}
    public func transfer(amount: Int, from: BankAccount, to: BankAccount) async throws {
        let available = await from.withdraw(amount: amount)
        await to.deposit(amount: available)
    }

    public func update(account1: BankAccount, account2: BankAccount) async {
        Task {
            try await transfer(amount: 75, from: account2, to: account1)
            print("Transfer complete :: account2 => account1: 75 ")
        }

        Task {
            try await transfer(amount: 50, from: account1, to: account2)
            print("Transfer complete :: account1 => account2 : 50 ")
        }
    }

    public func config(account1: BankAccount, account2: BankAccount) async {
        Task {
            let balance1 = await account1.balanceConfig() // actor method
            let balance2 = await account2.balanceConfig() // actor method
            
            print("account1 balance1 = \(balance1) , account2 balance2 = \(balance2)")
        }
    }
}
