//
//  MealViewController.swift
//  hello-ios
//
//  Created by TenTen on 2/22/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var lastImage: UIImage? = nil
    var defaultImage = #imageLiteral(resourceName: "defaultPhoto")
    var meal: Dictionary<String, Any>?

    @IBAction func onProfilePhotoClick(_ sender: UITapGestureRecognizer) {
        textTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setLastImage(_ sender: UIButton) {
        if lastImage != nil {
            print("lastImage type: \(type(of:lastImage))")
            profilePhoto.image = lastImage
        }
    }
    
    @IBAction func clearText(_ sender: UIButton) {
        textTextField.text = ""
        textLabel.text = ""
        
        profilePhoto.image = defaultImage
    }

    @IBAction func onTextFieldChange(_ sender: UITextField) {
        textLabel.text = sender.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        lastImage = selectedImage
        profilePhoto.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textTextField.delegate = self
        print("defaultPhoto type: \(type(of:defaultImage))")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        meal = ["name": textTextField.text ?? "", "image": profilePhoto.image ?? ""]
    }
}

