//
//  PopAnimation.swift
//  Spottunes
//
//  Created by Huang Edison on 5/7/17.
//  Copyright © 2017 ___Spottunes___. All rights reserved.
//

import UIKit

class PopAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.8
    var originFrame : CGRect?
    var finalFrame : CGRect?
    var transitColor : UIColor?
    var imageView : UIImageView?
    
    init(imageView: UIImageView, frame: CGRect,_ color: UIColor = UIColor.white) {
        self.imageView = imageView
        self.originFrame = imageView.superview!.convert(imageView.frame, to: nil)
        self.finalFrame = frame
        self.transitColor = color
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromView = transitionContext.view(forKey: .from)!
        let transitionView = UIImageView(image: imageView!.image)
        transitionView.frame = originFrame!
        
        let canvasView = UIView(frame: CGRect(x: 0, y: 0, width: App.screenWidth, height: App.screenHeight))
        canvasView.backgroundColor = transitColor
        fromView.addSubview(canvasView)
        canvasView.addSubview(transitionView)
        
        let xScaleFactor = finalFrame!.width / originFrame!.width
        let yScaleFactor = finalFrame!.height / originFrame!.height
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        UIView.animate(withDuration: duration, animations: { 
            transitionView.transform = scaleTransform
            transitionView.frame = self.finalFrame!
        }) { (_) in
            let containerView = transitionContext.containerView
            let toView = transitionContext.view(forKey: .to)!
            containerView.addSubview(toView)
            toView.alpha = 0.0
            UIView.animate(withDuration: 0.6, animations: {
                toView.alpha = 1.0
            }) { (_) in
                transitionContext.completeTransition(true)
                canvasView.removeFromSuperview()
            }
        }
    }
}
