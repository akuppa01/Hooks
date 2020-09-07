//
//  GalleryCVCell.swift
//  Hooks
//
//  Created by Aditya Kuppa on 7/3/20.
//  Copyright © 2020 Aditya Kuppa. All rights reserved.
//

import UIKit

class GalleryCVCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    func setImage(image: UIImage) {
        img.image = image
    }
    
    
}
