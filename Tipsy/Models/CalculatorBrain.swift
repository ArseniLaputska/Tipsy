//  Created by Arseni Laputska on 01/12/2020.


import UIKit

struct CalculatorBrain {
   
    var billValue: Double = 0.0
    var amountPerson: Int = 2
    var tipPercent: String? = "10%"
    
    mutating func getTipPercent(percentTips: String?) {
        tipPercent = percentTips
    }
    func getTipsPercents() -> String? {
        let finalPercents = tipPercent
        return finalPercents
    }
    
    mutating func getAmounOfPerson(currentPeople: Int) {
        amountPerson = currentPeople
    }
    func getAmountOfPersons() -> Int {
        let finalPersons = amountPerson
        return finalPersons
    }
    
    func settingsFinal() -> String {
        let finalScore = "Split between \(getAmountOfPersons()) people, with \(String(getTipsPercents()!)) tip."
        return finalScore
    }
    
    func getBillValue() -> String {
        let to2Decimal = String(format: "%.2f", billValue)
        return to2Decimal
    }
    
    mutating func calculateTotalBill(bill: Double, tips: Double, split: Double) {
        billValue = ((bill * tips) + bill) / split
    }

}
