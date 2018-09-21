//
//  SelectPhotoViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class SelectPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    var selectedImage: UIImage? {
        didSet {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostForm") as?
                PostFormViewController {
                vc.selectedImage = selectedImage
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func takePhotoButton(_ sender: UIButton) {
        let imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func choosePhotoButton(_ sender: UIButton) {
        let imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
