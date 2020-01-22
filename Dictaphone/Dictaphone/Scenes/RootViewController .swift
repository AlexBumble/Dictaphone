//
//  RootViewController .swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit

protocol RootControllerInitialization {
    func initFromTabBar() -> UIWindow
}

final class RootViewController: RootControllerInitialization {

    func initFromTabBar() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let controller: TabBarConfiguration = DictaphoneTabBarController()
        controller.configurateTabBar(in: window)
        return window
    }
}
