//
//  PopAnimation.swift
//  Spottunes
//
//  Created by Huang Edison on 5/7/17.
//  Copyright © 2017 ___Spottunes___. All rights reserved.
//

import UIKit

class PopAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0
    var originFrame = CGRect.zero
    var imageView : UIImageView?
    var finalFrame : CGRect?
    var transitColor : UIColor?
    
    init(imageView: UIImageView, frame: CGRect,_ color: UIColor = UIColor.black) {
        self.imageView = imageView
        self.finalFrame = frame
        self.transitColor = color
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromView = transitionContext.view(forKey: .from)!
        let transitionView = imageView!
        
        let xScaleFactor = finalFrame!.width / originFrame.width
        let yScaleFactor = finalFrame!.height / originFrame.height
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        UIView.animate(withDuration: duration, animations: { 
            transitionView.transform = scaleTransform
            transitionView.frame = self.finalFrame!
            //fromView.alpha = 0.0
        }) { (_) in
            let containerView = transitionContext.containerView
            let toView = transitionContext.view(forKey: .to)!
            fromView.backgroundColor = self.transitColor!
            containerView.addSubview(toView)
            toView.alpha = 0.0
            UIView.animate(withDuration: self.duration, animations: {
                toView.alpha = 1.0
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        }
    }
}
