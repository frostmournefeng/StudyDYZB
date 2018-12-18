//
//  MainViewViewController.swift
//  StudyDYZB
//
//  Created by yyk on 2018/12/14.
//  Copyright © 2018 yyk. All rights reserved.
//

import UIKit

class MainViewViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVc(storyName: "Home")
        addChildVc(storyName: "Live")
        addChildVc(storyName: "Follow")
        addChildVc(storyName: "Profile")
    }
    
    private func addChildVc(storyName : String) {
        
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateViewController(withIdentifier: storyName)
        
        addChildViewController(childVc);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
