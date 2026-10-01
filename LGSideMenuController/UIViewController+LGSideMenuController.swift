//
// UIViewController+LGSideMenuController.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

extension UIViewController {

    /// If the view controller or one of its ancestors is a child of a LGSideMenuController, this property contains the owning LGSideMenuController.
    /// This property is nil if the view controller is not embedded inside a LGSideMenuController.
    weak open var sideMenuController: LGSideMenuController? {
        if let controller = self as? LGSideMenuController {
            return controller
        }
        if let controller = LGSideMenuHelper.getSideMenuController(from: self) {
            return controller
        }
        if let controller = self.parent?.sideMenuController {
            return controller
        }
        return nil
    }

}
