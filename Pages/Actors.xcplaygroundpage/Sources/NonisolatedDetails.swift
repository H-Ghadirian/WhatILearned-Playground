import Foundation

public actor BankAccountActor {

    public init(
        accountHolder: String,
        bank: String
    ) {
        self.accountHolder = accountHolder
        self.bank = bank
    }

    let accountHolder: String
    let bank: String

    public nonisolated var details: String {
        "Bank: \(bank) - Account holder: \(accountHolder)"
    }
}
