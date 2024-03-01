//
//  ViewController.swift
//  ControllingActions
//
//  Created by Moltabarov Amanzhol on 28.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        if textField.hasText{
            label.text = textField.text
        }
    }
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        label.text = "Placeholder"
        textField.text = ""
    }
}

