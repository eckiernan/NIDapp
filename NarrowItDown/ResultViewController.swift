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
    
    var errorString = ""
    var finalText = ""
    var array = Array<Any>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Text label gets final choice from OptionsViewController
        finalChoiceLabel.text = finalText
    }
    
    @IBAction func buttonClicked() {
        if let nvc = navigationController {
            nvc.popViewController(animated: true)
        } else {
            // otherwise, dismiss it
            dismiss(animated: true, completion: nil)
        }
        
        // Clear array when back button is clicked so old options are not stored
        array.removeAll()
        array.count == 0
        
        finalText = ""
        errorString = ""
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

