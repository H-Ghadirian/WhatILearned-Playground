//: [Previous](@previous)

import Foundation

let bankAccount = BankAccount()

DispatchQueue.concurrentPerform(iterations: 1_000) { _ in
 bankAccount.deposit(150)
 bankAccount.withdraw(150)
}

print("Final Value: \(bankAccount.getBalance())")


let safeBankAccount = SafeBankAccount()

Task {
    DispatchQueue.concurrentPerform(iterations: 1_00) { iter in
        Task {
            await safeBankAccount.deposit(iter: iter, 150)
            await safeBankAccount.withdraw(iter: iter, 150)
        }
    }
    print("Final Value in safe mode: \(await safeBankAccount.getBalance())")
}

//Task {
//}

//: [Next](@next)
