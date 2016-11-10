//
//  ManageViewController.swift
//  Bounter
//
//  Created by airshiner on 11/10/16.
//  Copyright © 2016 airshiner. All rights reserved.
//

import UIKit

class ManageViewController: UIViewController,UIScrollViewDelegate {
    
    var acceptedViewController = SquareHomeViewController()
    var releasedViewController = SquareHomeViewController()
    
    let navigationBarHeight = CGFloat(64.0*(sHeight/667))
    let BottomBGColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
    let baseTopBtnTag = 988
    var currentButton = UIButton()
    let topBackView = UIView()
    
    let normalTextColor = UIColor(red: 155/255.0, green: 155/255.0, blue: 155/255.0, alpha: 1.0)
    let selectedTextColor = UIColor(red: 46/255.0, green: 169/255.0, blue: 223/255.0, alpha: 1.0)
    
    let btnHeight: CGFloat = 40//segment按钮的高
    let bottomHeight: CGFloat = 2//灰色底条的高度
    let sliderHeight: CGFloat = 2//下边滑动条的高度
    
    let sliderView = UIView()
    var mainScrollView = UIScrollView()
    var currentOffset = CGPoint()
    let backViewHeight: CGFloat = 42
    
    var panGesture:UIPanGestureRecognizer!
    var centerOffset:CGPoint!
    
    var titleArray = [String](){
        didSet{
            setBtnAndSplitLineWithTitleArray(titleArray)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MainScrollView", bundle: nil)
//        mainScrollView = nib.
        setTopView()
        setBtnBottomLine()
        setupMainScrollView()
        setChildVC()
        titleArray = ["已接受","已发布"]
//        gestureInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainScrollView.contentOffset = currentOffset
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        currentOffset = mainScrollView.contentOffset
    }
    
    /*滑出侧边栏*/
    /*----------------------------------------------------------------------------------------*/

    func setTopView() {
        currentOffset = CGPoint(x: 0, y: 0)
        centerOffset = currentOffset
        topBackView.frame = CGRect(x: 0, y: navigationBarHeight, width: sWidth, height: backViewHeight)
        topBackView.backgroundColor = UIColor.clear
        topBackView.isUserInteractionEnabled = true
        view.addSubview(topBackView)
    }
    
    func setBtnBottomLine() {
        let bottomLine = UIView(frame: CGRect(x: 0, y: backViewHeight + navigationBarHeight - bottomHeight, width: sWidth, height: bottomHeight))
        bottomLine.backgroundColor = BottomBGColor
        topBackView.addSubview(bottomLine)
    }
    
    func setupMainScrollView(){
        mainScrollView = UIScrollView(frame: CGRect(x: 0, y: backViewHeight + navigationBarHeight, width: sWidth, height: sHeight - backViewHeight - navigationBarHeight))
        mainScrollView.isPagingEnabled = true;
        mainScrollView.delegate = self;
        mainScrollView.showsHorizontalScrollIndicator = false;
        mainScrollView.showsVerticalScrollIndicator = false;
        mainScrollView.contentOffset = currentOffset;
        view.addSubview(mainScrollView)
    }
    
    //设置segmentView坐标
    func setChildVC(){
        acceptedViewController.view.frame = CGRect(x: 0, y: 0, width: sWidth, height: mainScrollView.frame.size.height)
        addChildViewController(acceptedViewController)
        mainScrollView.addSubview(acceptedViewController.view)
        
        releasedViewController.view.frame = CGRect(x: sWidth, y: 0, width: sWidth, height: mainScrollView.frame.size.height)
        addChildViewController(releasedViewController)
        mainScrollView.addSubview(releasedViewController.view)
    }
    
    //设置按钮坐标与功能
    func setBtnAndSplitLineWithTitleArray(_ titlesArray: [String]) {
        let btnWidth = sWidth/2
        sliderView.backgroundColor = selectedTextColor
        for i in 0 ..< 2 {
            let iButton = setBtnWithIndex(i, btnWidth: btnWidth,titlesArray: titlesArray)
            if i == 0{
                iButton.isSelected = true
                currentButton = iButton
                sliderView.frame = CGRect(x: 0, y: backViewHeight - sliderHeight, width: btnWidth, height: sliderHeight)
                topBackView.addSubview(sliderView)
            }
            topBackView.addSubview(iButton)
        }
        mainScrollView.contentSize = CGSize(width: CGFloat(2) * sWidth, height: 0)
    }
    
    //创建选项按钮
    func setBtnWithIndex(_ i: Int,btnWidth: CGFloat,titlesArray: [String]) ->UIButton {
        let btnFrame = CGRect(x: CGFloat(i)*btnWidth, y: 0, width: btnWidth, height: backViewHeight - sliderHeight)
        let tempButton = UIButton(type: UIButtonType.custom)
        tempButton.frame = btnFrame
        tempButton.backgroundColor = UIColor.clear
        tempButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        tempButton.setTitle(titlesArray[i] , for: UIControlState())
        tempButton.setTitleColor(normalTextColor, for: UIControlState())
        tempButton.setTitleColor(selectedTextColor, for: UIControlState.selected)
        tempButton.tag = i + baseTopBtnTag//设置一个tag标记，记录这是第几个button
        tempButton.addTarget(self, action: #selector(ManageViewController.slideBtnClick(_:)), for: UIControlEvents.touchUpInside)
        return tempButton
    }
    
    //按钮点击事件
    func slideBtnClick(_ sender: UIButton){
        if sender == currentButton{
            return
        }else{
            currentButton.isSelected = false;
            sender.isSelected = !sender.isSelected;
            currentButton = sender;
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.mainScrollView.contentOffset=CGPoint(x: CGFloat(sender.tag - self.baseTopBtnTag) * sWidth, y: 0);
                self.sliderView.center.x = self.currentButton.center.x
            })
        }
    }
    
    /*----------------------------------------------------------------------------------------*/
    
    /*
    
    func gestureInit() {
        panGestureLeft?.addTarget(self, action: #selector(ManageViewController.leftPan(_:)))
        releasedViewController.view.addGestureRecognizer(panGestureRight!)
    }
 
    */
    
    /*
    func leftPan(_ recongnizer: UIPanGestureRecognizer) {
        
        let panDistance = recongnizer.translation(in: self.view).x
        
        mainScrollView.contentOffset = CGPoint(x: CGFloat(centerOffset.x + panDistance), y: 0)
        
        if recongnizer.state == UIGestureRecognizerState.ended {
            
            if centerOffset.x + panDistance > 0.3 * sWidth {
                
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.mainScrollView.contentOffset=CGPoint(x: CGFloat(1) * sWidth, y: 0);
                    //self.sliderView.center.x = self.currentButton.center.x
                })
                
            }
            
            centerOffset = mainScrollView.contentOffset
            
        }
        
    }
    
    func rightPan(_ recongnizer: UIPanGestureRecognizer) {
        
        let panDistance = recongnizer.translation(in: self.view).x
        
        mainScrollView.contentOffset = CGPoint(x: CGFloat(centerOffset.x + panDistance), y: 0)
        
        if recongnizer.state == UIGestureRecognizerState.ended {
            
            if centerOffset.x + panDistance < -0.3 * sWidth {
                
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.mainScrollView.contentOffset=CGPoint(x: 0, y: 0);
                    //self.sliderView.center.x = self.currentButton.center.x
                })
                
            }
            
            centerOffset = mainScrollView.contentOffset
            
        }
        
    }
    
    */
    


}
