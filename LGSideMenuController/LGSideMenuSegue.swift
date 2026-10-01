//
// LGSideMenuSegue.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

public final class LGSideMenuSegue: UIStoryboardSegue {

    public struct Identifier {
        public static let root  = "root"
        public static let left  = "left"
        public static let right = "right"
    }

    public override func perform() {
        guard let sideMenuController = self.source as? LGSideMenuController else {
            assert(false, "LGSideMenuSegue must have source as LGSideMenuController")
            return
        }

        switch identifier {
        case Identifier.root:
            sideMenuController.rootViewController = destination
        case Identifier.left:
            sideMenuController.leftViewController = destination
        case Identifier.right:
            sideMenuController.rightViewController = destination
        default:
            assert(false, "LGSideMenuSegue must have identifier either \"root\", \"left\" or \"right\"")
        }
    }

}
