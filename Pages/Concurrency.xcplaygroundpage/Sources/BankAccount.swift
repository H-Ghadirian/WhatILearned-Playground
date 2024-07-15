import Foundation

public class BankAccount {
    public init(totalMoney: Double = 0) {
        self.totalMoney = totalMoney
    }

    private var totalMoney: Double = 0

    public func deposit(_ amount: Double) {
        self.totalMoney += amount
    }

    public func withdraw(_ amount: Double) {
        self.totalMoney -= amount
    }

    public func getBalance() -> Double {
        return self.totalMoney
    }
}

public actor SafeBankAccount {
    private var totalMoney: Double = 0
    public init(totalMoney: Double = 0) {
        self.totalMoney = totalMoney
    }

    public func deposit(iter: Int, _ amount: Double) {
        print(iter)
        self.totalMoney += amount
    }

    public func withdraw(iter: Int,_ amount: Double) {
        print(iter)
        self.totalMoney -= amount
    }

    public func getBalance() -> Double {
        return self.totalMoney
    }
}
