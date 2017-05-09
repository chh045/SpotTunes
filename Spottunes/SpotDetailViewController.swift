//
//  SpotDetailViewController.swift
//  Spottunes
//
//  Created by Huang Edison on 5/7/17.
//  Copyright © 2017 ___Spottunes___. All rights reserved.
//

import UIKit
import RMPZoomTransitionAnimator


class SpotDetailViewController: UIViewController {

    @IBOutlet weak var spotImageView: UIImageView!
    
    var spotImage : UIImage?
    
    var backVC : UIViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        spotImageView.image = spotImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapBackButton(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
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

extension SpotDetailViewController : RMPZoomTransitionAnimating, RMPZoomTransitionDelegate{
    func transitionSourceImageView() -> UIImageView{
        return self.spotImageView!
    }
    
    func transitionSourceBackgroundColor() -> UIColor{
        return UIColor.gray
    }
    
    func transitionDestinationImageViewFrame() -> CGRect{
        return CGRect(x: 30, y: 467, width: 150, height: 150)
        //return self.spotImageView.frame
    }
    
}
