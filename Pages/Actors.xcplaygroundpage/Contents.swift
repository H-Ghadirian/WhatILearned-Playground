//: [Previous](@previous)

import Foundation
//let accountHandler = AccountHandler()
//
//let account1 = BankAccount(initialBalance: 100)
//let account2 = BankAccount(initialBalance: 50)
//
//print("\nstart\n")
//
//await accountHandler.config(account1: account1, account2: account2)
//await accountHandler.update(account1: account1, account2: account2)
//await accountHandler.config(account1: account1, account2: account2)
//await accountHandler.update(account1: account1, account2: account2)
//await accountHandler.config(account1: account1, account2: account2)
//
//print("\nEnd\n")
//: [Next](@next)

//
let account = BankAccountActor(accountHolder: "Hamed", bank: "Sparkasse")
print(account.details)
