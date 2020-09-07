//
//  PhotoFetcher.swift
//  Hooks
//
//  Created by Aditya Kuppa on 7/3/20.
//  Copyright © 2020 Aditya Kuppa. All rights reserved.
//

import Foundation
import PhotosUI

class PhotoFetcher {
    
    var imageArray = [UIImage]()

    func getPhotos() -> [UIImage] {
        grabPhotos()
        return imageArray
    }
    
    func grabPhotos() {
        let imgManager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .highQualityFormat
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        if let fetchResult : PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions) {
            
            if fetchResult.count > 0 {
                for index in 0..<fetchResult.count {
                    imgManager.requestImage(for: fetchResult.object(at: index), targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: requestOptions, resultHandler: {image, error in self.imageArray.append(image!)})
                }
            } else {
                print("You have no photos!")
                //self.collectionView?.reloadData()
            }
        }
    }
    
    

    
    
    
    
}
