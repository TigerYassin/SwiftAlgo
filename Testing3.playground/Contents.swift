import UIKit
import Testing
import Simplifier
import EasyImagy

extension UIImage {
    
    public func pixelColor(for point: CGPoint) -> UIColor {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(point.y)) + Int(point.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
}



print(myCode.doSomething())
let image = UIImage(named: "dogs.jpg")!


print(image.pixelColor(for: CGPoint(x: 10, y: 10)))

var str = "Hello, playground"

//let image3 = Image(named: "test1")!



//let image2 = Image(width: 640, height: 480, pixel: .min) // a black grayscale image


