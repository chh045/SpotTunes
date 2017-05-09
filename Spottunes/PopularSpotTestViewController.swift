//
//  PopularSpotTestViewController.swift
//  Spottunes
//
//  Created by Huang Edison on 5/7/17.
//  Copyright © 2017 ___Spottunes___. All rights reserved.
//

import UIKit

class PopularSpotTestViewController: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapOnLeftImage(_ sender: Any) {
        print("left image tapped")
        let vc = SpotDetailViewController(nibName: "SpotDetailViewController", bundle: nil)
//        let storyBoard = UIStoryboard(name: "Spot", bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: "TransitionTestViewController") as! TransitionTestViewController
        vc.transitioningDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func tapOnRightImage(_ sender: Any) {
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension PopularSpotTestViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        let transitFrame = (presented as! SpotDetailViewController).spotImageView.frame
        
        let animator = PopAnimation(imageView: leftImageView, frame: transitFrame, UIColor.gray)
        animator.originFrame = leftImageView.superview!.convert(leftImageView.frame, to: nil)
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
