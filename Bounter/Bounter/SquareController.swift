//
//  ViewController.swift
//  Bounter
//
//  Created by airshiner on 11/5/16.
//  Copyright © 2016 airshiner. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController {

    var menuWidth:CGFloat!
    var bounterMenuVC = BounterMenuTableVC()
    var homeViewController:SquareHomeViewController!
    var homeNavigationController:UINavigationController!
    
    var centerOfHomeViewAtBegin:CGPoint!
    var centerOfMenu:CGPoint!
    var centerOfHomeView:CGPoint!
    
    var distanceLeftLimit:CGFloat!
    var distanceRightLimit:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        initMenu()
        gestureInit()
    }
    
    func initMenu() {
        
        menuWidth = sHeight*(210.0/667.0)
        homeNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeNavigationController") as! UINavigationController
        homeViewController = homeNavigationController.viewControllers.first as! SquareHomeViewController
        
        
        bounterMenuVC.view.frame = CGRect(x: -menuWidth, y: 30*(sHeight/667), width: menuWidth, height: sHeight)
        homeViewController.view.frame = CGRect(x: 0, y: 0, width: sWidth, height: sHeight)

        
        
        self.addChildViewController(bounterMenuVC)
        self.addChildViewController(homeNavigationController)
        self.view.addSubview(homeNavigationController.view)
        self.view.addSubview(bounterMenuVC.view)
        bounterMenuVC.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        centerOfHomeView = homeViewController.view.center
        centerOfMenu = bounterMenuVC.view.center
        centerOfHomeViewAtBegin = centerOfHomeView
        
        distanceLeftLimit = -menuWidth/2
        distanceRightLimit = menuWidth/2
        
        print(sWidth)
        print(distanceLeftLimit)
        print(distanceRightLimit)
        print(homeViewController.view.center.x)
        print(homeViewController.view.frame.width)
        
        
    }
    
    
    
    
    /*--------------------------------------------------------------------------------------*/
    /*--------------------------------------------------------------------------------------*/
    /*--------------------------------------------------------------------------------------*/
    /*--------------------------------------------------------------------------------------*/
    
    
    
    
    func gestureInit() {
        let panGesture = homeViewController.pullOutMenu
        panGesture?.addTarget(self, action: #selector(SquareViewController.pan(_:)))
        homeViewController.view.addGestureRecognizer(panGesture!)
    }
    
    func pan(_ recongnizer: UIPanGestureRecognizer) {
        
        let panDistance = recongnizer.translation(in: self.view).x
        
        if centerOfMenu.x + panDistance > distanceLeftLimit && centerOfMenu.x + panDistance < distanceRightLimit {
            bounterMenuVC.view!.center = CGPoint(x: centerOfMenu.x + panDistance, y: bounterMenuVC.view.center.y)
            homeViewController.view.center = CGPoint(x: centerOfHomeView.x + panDistance/4, y: self.view.center.y)
        }
        
        if recongnizer.state == UIGestureRecognizerState.ended {
            if centerOfMenu.x > 0 {
                centerOfMenu = bounterMenuVC.view.center
                if centerOfMenu.x > menuWidth * 0.4 {
                    showLeft()
                }else {
                    showHome()
                }
            }
            else {
                centerOfMenu = bounterMenuVC.view.center
                if centerOfMenu.x > -menuWidth * 0.4 {
                    showLeft()
                }else {
                    showHome()
                }
            }
            centerOfMenu = bounterMenuVC.view.center
            centerOfHomeView = homeViewController.view.center
        }
        
    }
    
    func showLeft() {
        doTheAnimate("left")
    }
    
    func showHome() {
        doTheAnimate("home")
    }
    
    func doTheAnimate(_ showWhat: String) {
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            
            if showWhat == "left" {
                self.bounterMenuVC.view.center = CGPoint(x: self.distanceRightLimit, y: self.bounterMenuVC.view.center.y)
                self.homeViewController.view.center = CGPoint(x: self.centerOfHomeViewAtBegin.x+self.menuWidth/4, y: self.homeViewController.view.center.y)
            }else {
                self.bounterMenuVC.view.center = CGPoint(x: self.distanceLeftLimit, y: self.bounterMenuVC.view.center.y)
                self.homeViewController.view.center = CGPoint(x: self.centerOfHomeViewAtBegin.x, y: self.homeViewController.view.center.y)
            }
            self.centerOfMenu = self.bounterMenuVC.view.center
            self.centerOfHomeView = self.homeViewController.view.center
            
            } , completion: nil)
        
    }
    
    
    
    
    /*--------------------------------------------------------------------------------------*/
    /*--------------------------------------------------------------------------------------*/
    /*--------------------------------------------------------------------------------------*/
    /*--------------------------------------------------------------------------------------*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

