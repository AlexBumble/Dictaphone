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

    static var current: Theme = setTheme()

    static var backgroundColor: UIColor {
        switch current {
        case .light: return .white
        case .dark: return .black
        }
    }

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

    static var fontColor: UIColor {
        switch current {
        case .light: return .black
        case .dark: return .white
        }
    }

    static func setTheme() -> Theme {
        let appDelegate = AppDelegate.shared()
        let interfaceStyle = appDelegate.window?.traitCollection.userInterfaceStyle
        switch interfaceStyle {
        case .light, .unspecified: return .light
        default: return .dark
        }
    }
}
