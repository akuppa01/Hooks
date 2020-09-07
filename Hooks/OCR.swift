//
//  OCR.swift
//  Hooks
//
//  Created by Aditya Kuppa on 7/2/20.
//  Copyright © 2020 Aditya Kuppa. All rights reserved.
//

import Foundation
import SwiftyTesseract

class OCR {
    
    func getText(image: UIImage) -> String {
         let tesseract = SwiftyTesseract(
             language: .english,
             dataSource: Bundle.main,
             engineMode: .lstmOnly
         )
         let result: Result<String, Error> = tesseract.performOCR(on: image)
         do {
             return try result.get()
         } catch {
             return "Error Occured"
         }
    }
    
}
