//
//  UploadViewController.swift
//  AWS S3 Example
//
//  Created by Ameenah Burhan on 9/3/17.
//  Copyright © 2017 Ameenah Burhan. All rights reserved.
//

import UIKit
import AWSS3

class UploadViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    let picker = UIImagePickerController()
    let transfermanager = AWSS3TransferManager.default()
    let S3BucketName = "ADD YOUR BUCKET NAME HERE"

    var localPath: URL!
    var selectedImage: UIImage!{
        didSet{
            saveButton.isEnabled = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         picker.delegate = self
    }
    @IBAction func photoLibrary(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    @IBAction func saveButton(_ sender: Any) {
        guard let image = imageView.image else {return}
        let data = UIImagePNGRepresentation(image)
        let remoteName = "test.png"
        let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(remoteName)
        do {
            try data?.write(to: fileURL)
            localPath = fileURL
            let uploadRequest = AWSS3TransferManagerUploadRequest()
            uploadRequest?.body = fileURL
            uploadRequest?.key = ProcessInfo.processInfo.globallyUniqueString + ".png"
            uploadRequest?.bucket = S3BucketName
            uploadRequest?.contentType = "image/png"
            
            let transferManager = AWSS3TransferManager.default()
            transferManager.upload(uploadRequest!).continueWith { (task) -> AnyObject! in
                if let error = task.error {
                    print("Upload failed (\(error))")
                }
                return nil
            }
        }
        catch {
            print("File not save failed")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
        if let image = (info[UIImagePickerControllerOriginalImage] as? UIImage){
            selectedImage = image
            imageView.image = selectedImage
        }
        dismiss(animated:true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
}
