//
//  NameViewController.swift
//  HelloSystemNotification
//
//  Created by 김건우 on 2/16/24.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveName(_ sender: UIButton) {
        if let value = name.text {
            AppData.addNewName(newName: value)
        }
        name.text = ""
    }

}
