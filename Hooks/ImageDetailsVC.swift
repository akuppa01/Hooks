//
//  ImageDetailsVC.swift
//  Hooks
//
//  Created by Aditya Kuppa on 7/3/20.
//  Copyright © 2020 Aditya Kuppa. All rights reserved.
//

import UIKit

class ImageDetailsVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var ocrText: UILabel!
    
    var imgVar = UIImage()
    var detailsVar = String()
    var textVar = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = imgVar
        //ocrText.numberOfLines = 0
        ocrText.text = textVar
        
        print(textVar)


    }
    
    func config(image: UIImage, text: String){//add details in future sprints
        imgVar = image
        textVar = text
    }
    


}
