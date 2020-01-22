//
//  Theme.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit

enum Theme {

    case light
    case dark

    static var current: Theme = .dark

    static var startButton: UIImage? {
        switch current {
        case .light: return UIImage(named: "startBlack")
        case .dark: return UIImage(named: "startWhite")
        }
    }

    static var stopRecordButton: UIImage? {
        switch current {
        case .light: return UIImage(named: "stopBlack")
        case .dark: return UIImage(named: "stopWhite")
        }
    }

    static var pauseRecordButton: UIImage? {
        switch current {
        case .light: return UIImage(named: "pauseBlack")
        case .dark: return UIImage(named: "pauseWhite")
        }
    }

    static var addRecord: UIImage? {
        switch current {
        case .light: return UIImage(named: "addRecordBlack")
        case .dark: return UIImage(named: "addRecordWhite")
        }
    }

    static func setTheme(interfaceStyle: UIUserInterfaceStyle?) {
        switch interfaceStyle {
        case .light, .unspecified: Theme.current = .light
        default: Theme.current = .dark
        }
    }

}
