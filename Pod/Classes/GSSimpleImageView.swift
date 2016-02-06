//
//  GSSimpleImageView.swift
//  GSSimpleImage
//
//  Created by 胡秋实 on 16/1/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import MBProgressHUD
public protocol GSSimpleImageViewDelegate {
    
}

public class GSSimpleImageView: UIImageView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public var delegate: GSSimpleImageViewDelegate?
 
    var bgView: UIView!
    var bgViewController: UIViewController!
    
    public var animated: Bool = true
    
    //MARK: Life cycle
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.addTapGesture()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTapGesture()
    }
    
    //MARK: Private methods
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: "fullScreenMe")
        self.addGestureRecognizer(tap)
        self.userInteractionEnabled = true
    }
    
    func addLongPressGesture(view:UIView) {
        let longPress = UILongPressGestureRecognizer(target: self, action: "popupAlbum:")
        longPress.minimumPressDuration = 0.5
        view.addGestureRecognizer(longPress)
    }
    
    //MARK: Actions of Gestures
    func exitFullScreen () {
        bgView.removeFromSuperview()
    }

    func fullScreenMe() {
if let del = delegate as? UIViewController {
    
    
            bgViewController = UIViewController()
            
            
            
            bgView = UIView(frame: UIScreen.mainScreen().bounds)
            bgViewController.view.addSubview(bgView)
            bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "exitFullScreen"))
            self.addLongPressGesture(bgView)
            bgView.backgroundColor = UIColor.blackColor()
            let imageV = UIImageView(image: self.image)
            imageV.frame = bgView.frame
            imageV.contentMode = .ScaleAspectFit
            self.bgView.addSubview(imageV)
//            

            del.view.window?.addSubview(bgView)
//            window?.addSubview(bgView)
            
            if animated {
                var sx:CGFloat=0, sy:CGFloat=0
                if self.frame.size.width > self.frame.size.height {
                    sx = self.frame.size.width/imageV.frame.size.width
                    imageV.transform = CGAffineTransformMakeScale(sx, sx)
                }else{
                    sy = self.frame.size.height/imageV.frame.size.height
                    imageV.transform = CGAffineTransformMakeScale(sy, sy)
                }
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    imageV.transform = CGAffineTransformMakeScale(1, 1)
                })
            }
            
//            window.makeKeyAndVisible()
        }
    }
    
    func showProgressAnimation() {
        let hud = MBProgressHUD.showHUDAddedTo(self.bgViewController.view, animated: true)
        hud.mode = MBProgressHUDMode.CustomView
        hud.color = UIColor.lightGrayColor()
        hud.customView = UIImageView(image: UIImage(named:"Checkmark"))
        hud.square = true
        hud.labelText = "Done"
        hud.hide(true, afterDelay: 3)
    }
    
    func popupAlbum(longPressGesture: UILongPressGestureRecognizer) {
       
        if (longPressGesture.state == UIGestureRecognizerState.Began) {
            let window = UIWindow(frame: UIScreen.mainScreen().bounds)
            window.rootViewController = bgViewController
            window.makeKeyAndVisible()
            let alertController = UIAlertController()
            let action = UIAlertAction(title: "保存到相册", style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction) -> Void in
//                UIImageWriteToSavedPhotosAlbum(, nil, nil, nil)
                self.showProgressAnimation()
                UIImageWriteToSavedPhotosAlbum(self.image!, self, "image:didFinishSavingWithError:contextInfo:", nil)
            })
            let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(action)
            alertController.addAction(cancel)
            window.rootViewController!.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Void>) {
        if error == nil {
            MBProgressHUD.hideAllHUDsForView(self.bgViewController.view, animated: true)
            self.exitFullScreen()
        }
    }

}
