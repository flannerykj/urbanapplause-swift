//
//  SelectPhotoViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class SelectPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
        if let image_data = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedImage = image_data
            let imageData:Data = UIImagePNGRepresentation(image_data)!
            let imageStr = imageData.base64EncodedString()
            APIClient.send(route: .upload(images: [imageStr]), success: onSuccess) { error in
                print("error")
            }
        }
        
    }
    func onSuccess(data: Data) {
        let decoder = JSONDecoder()
        do {
            let apiResponse: APIResponse<Array<String>> = try decoder.decode(APIResponse<Array<String>>.self, from: data)
            if let filename = apiResponse.data?[0] {
                print(filename)
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostForm") as? PostFormViewController {
                    vc.selectedImage = self.selectedImage
                    vc.imageName = filename
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        } catch {
            print("error trying to decode response")
            print(error)
            
        }
         print("success")
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
