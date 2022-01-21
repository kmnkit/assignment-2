//
//  ViewController.swift
//  assignment-2
//
//  Created by Sungwoong Kang on 2022/01/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet private weak var numberTextField1: UITextField!
    @IBOutlet private weak var numberTextField2: UITextField!
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
        
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let textFields: [UITextField] = [numberTextField1, numberTextField2]
        textFields.forEach { textField in
            textField.keyboardType = .numberPad
            textField.delegate = self
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil
    }
    
    @IBAction func tapCalculateButton(_ sender: UIButton) {
        let number1 = Double(numberTextField1.text ?? "") ?? 0
        let number2 = Double(numberTextField2.text ?? "") ?? 0
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            resultLabel.text = "\(number1 + number2)"
        case 1:
            resultLabel.text = "\(number1 - number2)"
        case 2:
            resultLabel.text = "\(number1 * number2)"
        case 3:
            if number2 == 0 {
                resultLabel.text = "割る数には0以外を入力して下さい"
            } else {
                resultLabel.text = "\(number1 / number2)"
            }
        default:
            return
        }
    }
}

