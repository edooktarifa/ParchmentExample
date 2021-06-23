//
//  ViewController.swift
//  ParchmentExample
//
//  Created by Edo Oktarifa on 23/06/21.
//

import UIKit
import Parchment

class ViewController: UIViewController {

    @IBOutlet weak var contentHeaderView: UIView!
    
    fileprivate let titleTab = ["Podcast","Favorites", "Subscriber", "Subcription", "About"]
    let neonColor = UIColor(red: 0, green: 233, blue: 180, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupParchment()
    }

    func setupParchment(){
        let pagingViewController = PagingViewController()
        pagingViewController.dataSource = self
        pagingViewController.menuBackgroundColor = .clear
        pagingViewController.textColor = .lightGray
        pagingViewController.selectedTextColor = .black
        pagingViewController.indicatorColor = neonColor
        pagingViewController.borderOptions = .hidden
        
        addChild(pagingViewController)
        self.contentHeaderView.addSubview(pagingViewController.view)
        
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pagingViewController.view.topAnchor.constraint(equalTo: contentHeaderView.topAnchor),
            pagingViewController.view.bottomAnchor.constraint(equalTo: contentHeaderView.bottomAnchor),
            pagingViewController.view.leadingAnchor.constraint(equalTo: contentHeaderView.leadingAnchor),
            pagingViewController.view.trailingAnchor.constraint(equalTo: contentHeaderView.trailingAnchor)
        ])
        
        pagingViewController.didMove(toParent: self)
    }
}

extension ViewController: PagingViewControllerDataSource{
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return titleTab.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        switch index {
        case 0:
            let podcast = PodcastViewController()
            return podcast
        case 1:
            let favourite = FavouritesViewController()
            return favourite
        default:
            return UIViewController()
        }
    }
    
    func pagingViewController<T>(_: PagingViewController, pagingItemAt index: Int) -> T {
        return PagingIndexItem(index: index, title: titleTab[index]) as! T
    }
    
    
//    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
//        return PagingIndexItem(index: index, title: titleTab[index])
//    }
    
}

