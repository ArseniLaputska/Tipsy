//
//  ViewController.swift
//  Tipsy
//
//  Created by Arseni Laputska on 01/12/2020.

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        //Deselect all tip buttons via IBOutlets
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //Make the button that triggered the IBAction selected.
        sender.isSelected = true
        
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        let percentTips = buttonTitle
        calculatorBrain.getTipPercent(percentTips: percentTips)
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        let currentPeople = Int(sender.value)
        calculatorBrain.getAmounOfPerson(currentPeople: currentPeople)
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        let bill = Double(billTextField.text!)!
        let tips = tip
        let split = Double(splitNumberLabel.text!)!
        
        calculatorBrain.calculateTotalBill(bill: bill, tips: tips, split: split)
        print(calculatorBrain.getBillValue())
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalForPerson = calculatorBrain.getBillValue()
            destinationVC.amountOfPersons = calculatorBrain.settingsFinal()
        }
    }
}
