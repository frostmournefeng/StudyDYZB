//
//  HomeViewController.swift
//  StudyDYZB
//
//  Created by yyk on 2018/12/14.
//  Copyright © 2018 yyk. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

    //懒加载属性
    private lazy var pageTitleView : PageTitleView = {[weak self] in
        
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"];
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    private lazy var pageContentView : PageContentView = {[weak self] in
        
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabbarH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        for _ in 0..<3 {
            
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g:CGFloat(arc4random_uniform(255)), b:CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentVc: self)
        contentView.delegate = self
        
        return contentView
    }()
    
    //系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

extension HomeViewController {
    
    private func setupUI() {
        
        setupNavigationBar()
        view.backgroundColor = .white
        view.addSubview(pageTitleView)
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(pageContentView)
    }
    
    private func setupNavigationBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "homeLogoIcon")
        
        let size = CGSize(width: 30, height: 30)

        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "image_my_history", size: size)
        let searchItem = UIBarButtonItem(imageName: "anchor_music_search_input_search_icon", highImageName: "anchor_music_search_input_search_icon", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "btn_qr_scan_normal", highImageName: "btn_qr_scan_normal", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}

//PageTitleViewDelegate
extension HomeViewController : PageTitleViewDelegate {
    
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

extension HomeViewController : PageContentViewDelegate {
    
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
