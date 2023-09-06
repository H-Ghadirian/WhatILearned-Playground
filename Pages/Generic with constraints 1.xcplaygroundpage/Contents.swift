//: [Previous](@previous)

import Foundation

protocol IndustryIdentity {
    var industryName: String { get }
}
struct Company<Industry: IndustryIdentity> { // 👈 Adding constraints for Industry such that it must comnfirm IndustryIdentity protocol
    var industry: Industry
    init(industry: Industry) {
        self.industry = industry
    }
}
struct InformationTechnology: IndustryIdentity {
    let industryName = "InformationTechnology"
}
struct RealEstate: IndustryIdentity {
    let industryName = "RealEstate"
}
struct Health: IndustryIdentity {
    let industryName = "Health"
}
struct Agriculture: IndustryIdentity {
    let industryName = "Agriculture"
}

let itCompany = Company<InformationTechnology>(industry: InformationTechnology())
let realEstateCompany = Company<RealEstate>(industry: RealEstate())
let healthCompany = Company<Health>(industry: Health())
let agricultureCompany = Company<Agriculture>(industry: Agriculture())
      
print(itCompany.industry.industryName) //InformationTechnology
print(realEstateCompany.industry.industryName) //RealEstate
print(healthCompany.industry.industryName) //Health
print(agricultureCompany.industry.industryName) //Agriculture

//: [Next](@next)
