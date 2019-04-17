//
//  ViewController.swift
//  Testing2
//
//  Created by Alsahlani, Yassin K on 4/17/19.
//  Copyright © 2019 Alsahlani, Yassin K. All rights reserved.
//

import UIKit
import Testing
import EasyImagy

class ViewController: UIViewController {
    
    @IBOutlet weak var myImage2: UIImageView!
    
    override func viewDidLoad() {
        let myImage = Image<RGBA<UInt8>>(named: "test1.png")!
        let trimmedImg = trimInsta(instaImage: myImage)

        myImage2.image = trimmedImg
        print("Working")

        print(myCode.doSomething())
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

func trimInsta(instaImage: Image<RGBA<UInt8>>) -> UIImage {
    var start = 0
    let width = instaImage.width
    let height = instaImage.height
    let distToBookmark = 28
    
    for y in 0 ..< height {
        if(instaImage[0, y].green < 240){
            print("We are at:", instaImage[0, y], y)
            start = y
            break
        }
    }
    
    start = start + 10
    for y in start ..< height {
        if(instaImage[0, y].green < 250){
            print("this is the start:", y)
            start = y
            break
        }
    }
    
    
    //END
    
    var end = start + 553
    let sizes = [553, 615, 828, 1035]
    for size in (0 ..< sizes.count).reversed() {
        var white = true
        end = start + sizes[size]
        for y in (end + 3) ... (end + 10){
            if(instaImage[760, y].green < 250){
                print("Not white")
                white = false
                break
            }
            
            if(!white){
                continue
            }
            print("yes")
            for y in (end + 10) ..< (end + distToBookmark + 3){
                if(instaImage[760, y].green < 50){
                    print("Start:", start, "End", end)
                    let slice: ImageSlice<RGBA<UInt8>> = instaImage[0 ..< width, start ..< end]
                    let cropped = Image<RGBA<UInt8>>(slice)
                    print((instaImage[460,2]).green)
                    print(instaImage.count)
                    return cropped.uiImage
                }
            }
        }
    }
    
    let slice: ImageSlice<RGBA<UInt8>> = instaImage[0 ..< width, start ..< end]
    let cropped = Image<RGBA<UInt8>>(slice)
    print((instaImage[460,2]).green)
    print(instaImage.count)
    return cropped.uiImage
}


