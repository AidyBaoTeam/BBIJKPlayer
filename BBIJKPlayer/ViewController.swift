//
//  ViewController.swift
//  BBIJKPlayer
//
//  Created by SJXC on 2021/8/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var liveAction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func live(_ sender: Any) {
        self.navigationController?.pushViewController(playerViewController(), animated: true)
    }
}

