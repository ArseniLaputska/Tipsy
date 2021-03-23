//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Arseni Laputska on 01/12/2020.

import UIKit

class ResultsViewController: UIViewController {
    
    var totalForPerson: String?
    var amountOfPersons: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalForPerson
        settingsLabel.text = amountOfPersons
        
    }
    
    @IBAction func recalculatedPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
