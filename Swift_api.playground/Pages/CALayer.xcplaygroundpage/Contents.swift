//: [Previous](@previous)

import Foundation
import UIKit
var str = "Hello, playground"

//: [Next](@next)

class MyCALayer: UIView {
    func addShadow() {
        let grayCover = CALayer()
        grayCover.backgroundColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.addSublayer(grayCover)
    }
}



/*
- (UIImage*)cropImageWithRect:(CGRect)cropRect { 
    CGRect drawRect = CGRectMake(-cropRect.origin.x , -cropRect.origin.y, self.size.width * self.scale, self.size.height * self.scale); UIGraphicsBeginImageContext(cropRect.size); 
 
    CGContextRef context = UIGraphicsGetCurrentContext(); 
    CGContextClearRect(context, CGRectMake(0, 0, cropRect.size.width, cropRect.size.height)); 
    [self drawInRect:drawRect]; 
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
 }
 */

extension UIImage {
    func cropImage(with cropRect: CGRect) -> UIImage? {
        let drawRect = CGRect(x: -cropRect.origin.x, y: -cropRect.origin.y, width: self.size.width * self.scale, height: self.size.height * self.scale)
        UIGraphicsBeginImageContext(drawRect.size)
        let context = UIGraphicsGetCurrentContext();
        context?.clear(CGRect(x: 0, y: 0, width: cropRect.size.width, height: cropRect.size.height))
        self.draw(in: drawRect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

//let bundle = Bundle.main.resourcePath
var image = UIImage(named: "amd.jpg")

let rect = CGRect(x: 100, y: 100, width: 400, height: 300)
var image2 = image?.cropImage(with: rect)


