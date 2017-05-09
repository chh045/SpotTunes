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
    
    var selectedImageView : UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapOnLeftImage(_ sender: Any) {
        selectedImageView = leftImageView
        let vc = SpotDetailViewController(nibName: "SpotDetailViewController", bundle: nil)
        vc.transitioningDelegate = self
        vc.spotImage = selectedImageView!.image
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func tapOnRightImage(_ sender: Any) {
        selectedImageView = rightImageView
        let vc = SpotDetailViewController(nibName: "SpotDetailViewController", bundle: nil)
        vc.transitioningDelegate = self
        vc.spotImage = selectedImageView!.image
        present(vc, animated: true, completion: nil)
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
        let animator = PopAnimation(imageView: selectedImageView!, frame: transitFrame)
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let imageView = (dismissed as! SpotDetailViewController).spotImageView
        let animator = PopAnimation(imageView: imageView!, frame: selectedImageView!.frame)
        return animator
    }
}
