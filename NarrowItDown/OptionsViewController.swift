//
//  ViewController.swift
//  NarrowItDown
//
//  Created by Elizabeth Kiernan on 6/30/17.
//  Copyright © 2017 Elizabeth Kiernan. All rights reserved.
//

import UIKit


class OptionsViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var backToSelectionButton: UIButton!
    @IBOutlet weak var optionTextField1: UITextField!

    @IBOutlet weak var finalChoiceTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    

    @IBOutlet weak var finalChoiceLabel: UILabel!
    var string1 = ""
    var finalText = ""
    
    var userOptions = NSMutableArray()

    let errorString = "Oops..please enter at least 2 options."
//    let oneOptionString1 = "Well, you didn't leave me much of a choice."
//    let oneOptionString2 = "That choice seems pretty obvious."
//    var string8 = "Oops..please enter at least 2 options"
    
    func addField() {
        userOptions.add("")
        optionNumber = userOptions.Length - 1
        AddFieldToPage(optionNumber) // optionNumber0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        optionTextField1.delegate = self //?????????????
        
        addField()

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
        
        userOptions[currentOptionIndex] = optionTextField[currentOptionIndex]!
            
        }
    }

    //  func hitReturnWhenEditing(_ textField: UITextField) {  // fires when Return is hit
    //    textFieldDidEndEditing(textField);
    //}
    
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
        
        string1 = ""

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

