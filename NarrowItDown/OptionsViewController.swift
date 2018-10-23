//
//  ViewController.swift
//  NarrowItDown
//
//  Created by Elizabeth Kiernan on 6/30/17.
//  Copyright © 2017 Elizabeth Kiernan. All rights reserved.
//

import UIKit


class OptionsViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Propertie
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var backToSelectionButton: UIButton!
    @IBOutlet weak var optionTextField1: UITextField!
    @IBOutlet weak var optionTextField2: UITextField!
    @IBOutlet weak var optionTextField3: UITextField!
    @IBOutlet weak var optionTextField4: UITextField!
    @IBOutlet weak var optionTextField5: UITextField!
    @IBOutlet weak var optionTextField6: UITextField!
    @IBOutlet weak var finalChoiceTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    

    @IBOutlet weak var finalChoiceLabel: UILabel!
    var string1 = ""
    var string2 = ""
    var string3 = ""
    var string4 = ""
    var string5 = ""
    var string6 = ""
    var finalText = ""
    
    var userOptions = NSMutableArray()

    let errorString = "Oops..please enter at least 2 options."
//    let oneOptionString1 = "Well, you didn't leave me much of a choice."
//    let oneOptionString2 = "That choice seems pretty obvious."
//    var string8 = "Oops..please enter at least 2 options"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        optionTextField1.delegate = self
        optionTextField2.delegate = self
        optionTextField3.delegate = self
        optionTextField4.delegate = self
        optionTextField5.delegate = self
        optionTextField6.delegate = self

    }

//    func keypadReturn(_ textField: UITextField) -> Bool {
//        let nextTag = textField.tag+1
//        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder!
//
//        if nextResponder != nil {
//            nextResponder?.becomeFirstResponder()
//        } else {
//            textField.resignFirstResponder()
//        }
//        return false
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Keyboard Shows
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField: optionTextField1, moveDistance: -95, up: true)
    }
    
    // Keyboard Hidden
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField: optionTextField1, moveDistance: -95, up: false)
        
    // Assigns strings to text fields
        switch textField.tag {
        case 1:
            string1 = optionTextField1.text!
            break
        case 2:
            string2 = optionTextField2.text!
            break
        case 3:
            string3 = optionTextField3.text!
            break
        case 4:
            string4 = optionTextField4.text!
            break
        case 5:
            string5 = optionTextField5.text!
            break
        case 6:
            string6 = optionTextField6.text!
            break
        default: break
            
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    //MARK: Actions
    
    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    // Add strings to array
    @IBAction func buttonClicked() {

            if !string1.isEmpty {
            userOptions.add(string1)
            }
            if !string2.isEmpty {
            userOptions.add(string2)
            }
            if !string3.isEmpty {
            userOptions.add(string3)
            }
            if !string4.isEmpty {
            userOptions.add(string4)
            }
            if !string5.isEmpty {
            userOptions.add(string5)
            }
            if !string6.isEmpty {
            userOptions.add(string6)
            }
            if (userOptions.count == 1) {
            NSLog("array has 1 option")
            userOptions.removeAllObjects()
//            userOptions.add(oneOptionString1)
//            userOptions.add(oneOptionString2)
            }
            if (userOptions.count == 0) {
            NSLog("array has 0 options");
            userOptions.add(errorString)
            }
        
        // Randomize strings in array
        let rand = Int(arc4random_uniform(UInt32(userOptions.count)))
        finalText = String(describing: userOptions[rand])

        
        // Pass to next screen
        performSegue(withIdentifier: "ResultViewController", sender: nil)
    }
    
    // Clear array
    @ IBAction func clearButtonClicked () {

        userOptions.removeAllObjects()

        NSLog("Array cleared")
        
        optionTextField1.text = ""
        optionTextField2.text = ""
        optionTextField3.text = ""
        optionTextField4.text = ""
        optionTextField5.text = ""
        optionTextField6.text = ""
        
        string1 = ""
        string2 = ""
        string3 = ""
        string4 = ""
        string5 = ""
        string6 = ""
        finalText = ""
    }
    
    // Allow strings to be seen by ResultViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ResultViewController {
            vc.finalText = finalText
            vc.array = userOptions as! [Any]
            vc.string1 = string1
            vc.string2 = string2
            vc.string3 = string3
            vc.string4 = string4
            vc.string5 = string5
            vc.string6 = string6
            vc.errorString = errorString
        }
    }

 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}

