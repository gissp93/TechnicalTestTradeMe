//
//  ViewController.swift
//  TechnicalTest
//
//  Created by Gisselle Sanchez on 26/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listingsController = ListingsViewController()
        listingsController.title = "Browse"
        let listingsNav = UINavigationController(rootViewController: listingsController)
        listingsNav.tabBarItem.title = "Discover"
        listingsNav.tabBarItem.image = UIImage(named: "search")
                   
        let watchListController = WatchListViewController()
        watchListController.view.backgroundColor = UIColor.systemBackground
        watchListController.title = "Watchlist"
        let watchListNav = UINavigationController(rootViewController: watchListController)
        watchListNav.tabBarItem.title = "Watchlist"
        watchListNav.tabBarItem.image = UIImage(named: "watchlist")
        
        let myTradeMeController = MyTradeMeViewController()
        myTradeMeController.view.backgroundColor = UIColor.systemBackground
        myTradeMeController.title = "My Trade Me"
        let myTradeMeNav = UINavigationController(rootViewController: myTradeMeController)
        myTradeMeNav.tabBarItem.title = "My Trade Me"
        myTradeMeNav.tabBarItem.image = UIImage(named: "profile-16")
        
        self.tabBarController?.viewControllers = [listingsNav, watchListNav, myTradeMeNav]
        
    }
    
}

