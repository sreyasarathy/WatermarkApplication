//
//  ImageWatermarker.swift
//  WaterMarkingApplication
//
//  Created by Sreya  Sarathy on 07/06/24.
//

import UIKit

class ImageWatermarker {
    // Function to add text watermark to an image
    func addTextWatermark(text: String, to image: UIImage) -> UIImage? {
        let textColor = UIColor.white
        let textFont = UIFont.boldSystemFont(ofSize: 40)
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attrs: [NSAttributedString.Key: Any] = [
            .font: textFont,
            .paragraphStyle: paragraphStyle,
            .foregroundColor: textColor
        ]
        
        let textSize = text.size(withAttributes: attrs)
        let textRect = CGRect(x: (image.size.width - textSize.width) / 2,
                              y: (image.size.height - textSize.height) / 2,
                              width: textSize.width,
                              height: textSize.height)
        text.draw(with: textRect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

