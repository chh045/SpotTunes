//
//  PopularSpotViewController.swift
//  Spottunes
//
//  Created by Huang Edison on 5/4/17.
//  Copyright © 2017 ___Spottunes___. All rights reserved.
//

import UIKit
import RMPZoomTransitionAnimator

fileprivate let reuseIden = "PopularSpotCollectionViewCell"
fileprivate let cellNibName = "PopularSpotCollectionViewCell"

class PopularSpotViewController: UIViewController {
    
    var selectedImageView: UIImageView?


    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(UINib(nibName: cellNibName, bundle: nil), forCellWithReuseIdentifier: reuseIden)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 */
 

}

extension PopularSpotViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellNibName, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PopularSpotCollectionViewCell
        
        self.selectedImageView = cell.imageView
        
        let vc = SpotDetailViewController(nibName: "SpotDetailViewController", bundle: nil)
        vc.transitioningDelegate = self
        present(vc, animated: true, completion: nil)
    }
}


extension PopularSpotViewController : UIViewControllerTransitioningDelegate, RMPZoomTransitionAnimating, RMPZoomTransitionDelegate {
    

    func transitionSourceImageView() -> UIImageView{
        return self.selectedImageView!
    }
    
    func transitionSourceBackgroundColor() -> UIColor{
        return UIColor.red
    }
    
    func transitionDestinationImageViewFrame() -> CGRect{
        return self.selectedImageView!.frame
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = RMPZoomTransitionAnimator()
        animator.goingForward = true
        animator.sourceTransition = source as! RMPZoomTransitionAnimating & RMPZoomTransitionDelegate
        animator.destinationTransition = presented as! RMPZoomTransitionAnimating & RMPZoomTransitionDelegate
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = RMPZoomTransitionAnimator()
        animator.goingForward = false
        animator.sourceTransition = dismissed as! RMPZoomTransitionAnimating & RMPZoomTransitionDelegate
        animator.destinationTransition = self
        return animator
    }
    
}

extension PopularSpotViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let legnth = self.imageView.frame.size.height
        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}


