//
//  FirstViewController.swift
//  SimpleSpendingTracker
//
//  Created by rajbak on 17/11/2017.
//  Copyright © 2017 rajbak. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        if textField != amountTextField {
            return true;
        }
        
        let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        return StringHelper.isNumeric(prospectiveText)
    }
}

