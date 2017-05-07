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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return UIColor.green
    }
    
    func transitionDestinationImageViewFrame() -> CGRect{
        return self.spotImageView.frame
    }
}
