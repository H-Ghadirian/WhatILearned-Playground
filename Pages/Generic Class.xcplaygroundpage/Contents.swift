//: [Previous](@previous)

import Foundation

struct Company<Industry> {
    var industry: Industry
    
    init(industry: Industry) {
        self.industry = industry
    }
}

struct InformationTechnology {
    let industryName = "InformationTechnology"
}

struct RealEstate {
    let industryName = "RealEstate"
}

let itCompany = Company<InformationTechnology>(industry: InformationTechnology())
let realEstateCompany = Company<RealEstate>(industry: RealEstate())

print(itCompany.industry.industryName) //InformationTechnology
print(realEstateCompany.industry.industryName) //RealEstate

//: [Next](@next)
