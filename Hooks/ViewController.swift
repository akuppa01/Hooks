//
//  ViewController.swift
//  Hooks
//
//  Created by Aditya Kuppa on 6/28/20.
//  Copyright © 2020 Aditya Kuppa. All rights reserved.
//

import UIKit
import PhotosUI


class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageArray = PhotoFetcher().getPhotos()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}

//extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    @IBAction func onClickPickImage(_ sender: Any) {
//          var imagePicker = UIImagePickerController()
//          imagePicker.delegate = self
//
//          imagePicker.sourceType = .photoLibrary
//
//          self.present(imagePicker, animated: true, completion: nil)
//      }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//           let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//
//           self.dismiss(animated: true, completion: nil)
//       }
//}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("You tapped image!")
        let image = imageArray[indexPath.row]
        let text = OCR().getText(image: image)
        let vc = storyboard?.instantiateViewController(identifier: "ImageDetailsVC") as! ImageDetailsVC
        vc.config(image: image, text: text)
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
}
    
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCVCell", for: indexPath) as! GalleryCVCell
        cell.setImage(image: imageArray[indexPath.row])
        return cell
    }

}
    
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imgPerRow = 4
        let frameWidth = collectionView.frame.width
        let width = (Int(frameWidth) / imgPerRow) - 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}



 


