//
//  ViewController.swift
//  Friendly Library
//
//  Created by SJ Porter on 2/3/21.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var imagePreview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cameraButtonWasClicked(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(
        _ imagePicker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        if let handler = try? ImageHandler(master_image: image) {
            handler.sendImage()
            imagePreview?.image = image
            imagePicker.dismiss(animated: true)
        }
    }
    
}

