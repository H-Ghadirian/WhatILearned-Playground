import Foundation

public actor BankAccount {
    private var balance: Int

    public init(initialBalance: Int) {
        balance = initialBalance
    }

    public func deposit(amount: Int) {
        balance += amount
    }

    public func withdraw(amount: Int) -> Int {
        if balance >= amount {
            balance -= amount
            return amount
        } else {
            let available = balance
            balance = 0
            return available
        }
    }

    public func balanceConfig() -> Int {
        return self.balance
    }
}
