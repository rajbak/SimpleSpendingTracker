//
//  FirstViewController.swift
//  SimpleSpendingTracker
//
//  Created by rajbak on 17/11/2017.
//  Copyright © 2017 rajbak. All rights reserved.
//

import UIKit
import os.log

class FirstViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.delegate = self;
       
        prepareDatePicker()
    }

    // MARK: - Private methods
    private func prepareDatePicker() {
        let today = Date()
        dateTextField.text = today.toDateString()
        dateTextField.inputView = createDataPicker(with: today)
        dateTextField.inputAccessoryView = createToolbar()
    }
    
    private func createToolbar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(FirstViewController.endEnditing))
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        return toolBar
    }

    private func createDataPicker(with date: Date) -> UIDatePicker{
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.date = date
        datePicker.addTarget(self, action: #selector(FirstViewController.dateHasChanged), for: .valueChanged)
        
        return datePicker
    }
    
    @objc private func endEnditing() {
      self.view.endEditing(true)
    }
    
    @objc private func dateHasChanged(_ sender: UIDatePicker) {
        dateTextField.text = sender.date.toDateString()
    }
}

// MARK: - UITextFieldDelegate
extension FirstViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField != amountTextField {
            return true;
        }
        
        let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        return StringHelper.isNumeric(prospectiveText)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEnditing()
        return false
    }
}

