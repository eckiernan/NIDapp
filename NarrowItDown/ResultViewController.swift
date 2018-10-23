//
//  ViewController.swift
//  NarrowItDown
//
//  Created by Elizabeth Kiernan on 6/30/17.
//  Copyright © 2017 Elizabeth Kiernan. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var finalChoiceTextField: UITextField!
    @IBOutlet weak var finalChoiceLabel: UILabel!
    
    @IBOutlet weak var chooseAgainButton: UIButton!
    
    var string1 = ""
    var string2 = ""
    var string3 = ""
    var string4 = ""
    var string5 = ""
    var string6 = ""
    var errorString = ""
//    var oneOptionString1 = ""
    
    
    
    var finalText = ""
    var array = Array<Any>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        finalChoiceLabel.text = finalText
        
        
    }
    
    @IBAction func buttonClicked() {
        if let nvc = navigationController {
            nvc.popViewController(animated: true)
        } else {
            // otherwise, dismiss it
            dismiss(animated: true, completion: nil)
        }
        
        array.removeAll()
        array.count == 0
        
        string1 = ""
        string2 = ""
        string3 = ""
        string4 = ""
        string5 = ""
        string6 = ""
        finalText = ""
        errorString = ""
 //       oneOptionString1 = ""
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

