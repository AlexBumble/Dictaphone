//
//  DictaphoneTabBarController.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit

// Use to set default configuration of window, in example we can create method to configure without tabBar
protocol TabBarConfiguration {
    func configurateTabBar(in: UIWindow)
}

class DictaphoneTabBarController: TabBarConfiguration {

    func configurateTabBar(in window: UIWindow) {
        let recordNavigationController = UINavigationController()
        recordNavigationController.tabBarItem = UITabBarItem(title: "Record", image: nil, selectedImage: nil)

        let tracksNavigationController = UINavigationController()
        tracksNavigationController.tabBarItem = UITabBarItem(title: "Tracks", image: nil, selectedImage: nil)

        let tabBar = UITabBarController()

        tabBar.viewControllers = [
            recordNavigationController,
            tracksNavigationController,
        ]

        window.rootViewController = tabBar

        addViewController(to: recordNavigationController, viewController: TracksViewController())
        addViewController(to: tracksNavigationController, viewController: RecordViewController())
    }

    

    func addViewController<T: UIViewController>(to navigationController: UINavigationController, viewController: T) {
        let pushedViewController = viewController
        navigationController.pushViewController(pushedViewController, animated: true)
    }
}
