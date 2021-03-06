//
//  InitViewController.swift
//  Spottunes
//
//  Created by Xie kesong on 4/19/17.
//  Copyright © 2017 ___Spottunes___. All rights reserved.
//

import UIKit

fileprivate let loginEmbedSegueIden = "LoginEmbedSegue"
fileprivate let homeEmbedSegueIden = "HomeWrapperEmbedSegue"

protocol InitViewControllerDelegate: class {
    func homeInit()
}

class InitViewController: UIViewController {
    
    
    //container view
    @IBOutlet weak var loginContainerView: UIView!
    @IBOutlet weak var homeContainerView: UIView!
    
    
    //embed view controller
    var loginViewController: LogInViewController?{
        didSet{
            self.loginViewController?.delegate = self
        }
    }
    var homeWrapperViewController: HomeWrapperViewController?{
        didSet{
            self.delegate = homeWrapperViewController
        }
    }
    
    var statusBarShouldHidden = true{
        didSet{
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    var statusBarStyle: UIStatusBarStyle = .lightContent{
        didSet{
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    weak var delegate: InitViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpotifyClient.updateSession { (session) in
            if session != nil{
                print("session exsited")
                self.statusBarShouldHidden = false
                self.statusBarStyle = .default
                self.view.bringSubview(toFront: self.homeContainerView)
            }else{
                print("GO TO LOGIN PAGE")
                self.statusBarShouldHidden = true
            }
            self.setNeedsStatusBarAppearanceUpdate()
        }
       
    }

    override var prefersStatusBarHidden: Bool{
        return self.statusBarShouldHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return self.statusBarStyle
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let iden = segue.identifier{
            switch iden {
            case loginEmbedSegueIden:
                if let loginVC = segue.destination as? LogInViewController{
                    self.loginViewController = loginVC
                }
            case homeEmbedSegueIden:
                if let homeWrapperVC = segue.destination as? HomeWrapperViewController{
                    self.homeWrapperViewController = homeWrapperVC
                }
            default:
                break
            }
        }
    }
    

    
}

extension InitViewController: LogInViewControllerDelegate {
    func finishedLogin() {
        
        //bring home to the front
        self.statusBarShouldHidden = false
        self.statusBarStyle = .lightContent
        self.delegate?.homeInit()
        self.view.bringSubview(toFront: self.homeContainerView)
    }
}
