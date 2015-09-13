	//
//  UploadImageViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit
import Parse

class UploadImageViewController: UIViewController {

    @IBOutlet weak var imageToUpload: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    var username: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    
    // MARK: - Actions
    @IBAction func selectPicturePressed(sender: AnyObject) {
        //Open a UIImagePickerController to select the picture
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func sendPressed(sender: AnyObject) {
      //  commentTextField.resignFirstResponder()
        
        //Disable the send button until we are ready
        navigationItem.rightBarButtonItem?.enabled = false
        
        loadingSpinner.startAnimating()
        
        //TODO: Upload a new picture
        let imageData = UIImagePNGRepresentation(imageToUpload.image)
        let imageFile: PFFile = PFFile(data: imageData)
        
        var userPhoto = PFObject(className: "UserImages")
        var username = PFUser.currentUser()
        userPhoto.setValue(username!, forKey: "username")
        userPhoto.setObject(imageFile, forKeyedSubscript: "imageFile") //workaround for saving
        userPhoto.save()
    }
}

extension UploadImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        //Place the image in the imageview
        imageToUpload.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}
