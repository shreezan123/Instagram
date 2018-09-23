//
//  PhotoMapViewController.swift
//  Instagram
//
//  Created by Shrijan Aryal on 9/22/18.
//  Copyright © 2018 Shrijan Aryal. All rights reserved.
//

import UIKit

class PhotoMapViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var thumbnailImage: UIImageView!
    
    @IBOutlet weak var captionTxt: UITextField!
    var postImage: UIImage! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        self.present(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        // Do something with the images (based on your use case)
        thumbnailImage.image = editedImage
        self.postImage = editedImage
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onShare(_ sender: Any) {
        Post.postUserImage(image: self.postImage, withCaption: captionTxt.text) { (success: Bool , error:Error?) in
        }
        dismiss(animated:true, completion: nil)
    }
    

}
