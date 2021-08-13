//
//  playerViewController.swift
//  BBIJKPlayer
//
//  Created by SJXC on 2021/8/12.
//

import UIKit

class playerViewController: UIViewController {
    
    var iPlayer:IJKFFMoviePlayerController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options:IJKFFOptions = IJKFFOptions.byDefault()
//        let url:URL = URL.init(string: "rtmp://live.hkstv.hk.lxdns.com/live/hks")!
        //替换成自己的地址
        let url = URL(string: "rtmp://192.168.0.7:1935/rtmplive/room")
 
        
        self.iPlayer = IJKFFMoviePlayerController.init(contentURL: url, with: options)
        var arm1 = UIView.AutoresizingMask.init(rawValue: 0)
        arm1.insert(UIView.AutoresizingMask.flexibleWidth)
        arm1.insert(UIView.AutoresizingMask.flexibleHeight)
        self.iPlayer?.view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
//        UIView.AutoresizingMask.flexibleWidth|UIView.AutoresizingMask.flexibleHeight
        self.iPlayer?.view.backgroundColor = UIColor.white
        self.iPlayer?.view.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
        self.iPlayer?.scalingMode = .aspectFit
        self.iPlayer?.shouldAutoplay = true
        self.view.autoresizesSubviews = true
        self.view.addSubview((self.iPlayer?.view)!)
            
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.iPlayer?.prepareToPlay() //准备
        }
        
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
//            self.iPlayer?.pause()//暂停
            self.iPlayer?.shutdown() //销毁
        }

}
