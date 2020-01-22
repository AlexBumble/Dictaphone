//
//  UIView + SnapKit.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 22.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    
    func layout<T: UIView>(
        _ subview: T,
        _ closure: (ConstraintMaker) -> Void) -> T
    {
        self.addSubview(subview)
        subview.snp.makeConstraints(closure)
        return subview
    }

    var top: SnapKit.ConstraintItem {
        return snp.top
    }

    var bottom: SnapKit.ConstraintItem {
        return snp.bottom
    }

    var leading: SnapKit.ConstraintItem {
        return snp.leading
    }

    var trailing: SnapKit.ConstraintItem {
        return snp.trailing
    }
}
