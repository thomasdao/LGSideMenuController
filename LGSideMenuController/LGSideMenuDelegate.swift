//
// LGSideMenuDelegate.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import QuartzCore
import UIKit

/// Delegate protocol to observe behaviour of LGSideMenuController
public protocol LGSideMenuDelegate {

    func willShowLeftView(sideMenuController: LGSideMenuController)
    func didShowLeftView(sideMenuController: LGSideMenuController)

    func willHideLeftView(sideMenuController: LGSideMenuController)
    func didHideLeftView(sideMenuController: LGSideMenuController)

    func willShowRightView(sideMenuController: LGSideMenuController)
    func didShowRightView(sideMenuController: LGSideMenuController)

    func willHideRightView(sideMenuController: LGSideMenuController)
    func didHideRightView(sideMenuController: LGSideMenuController)

    /// This method is executed inside animation block for showing left view.
    /// Use it to add some custom animations.
    func showAnimationsForLeftView(sideMenuController: LGSideMenuController,
                                   duration: TimeInterval,
                                   timingFunction: CAMediaTimingFunction)

    /// This method is executed inside animation block for hiding left view.
    /// Use it to add some custom animations.
    func hideAnimationsForLeftView(sideMenuController: LGSideMenuController,
                                   duration: TimeInterval,
                                   timingFunction: CAMediaTimingFunction)

    /// This method is executed inside animation block for showing right view.
    /// Use it to add some custom animations.
    func showAnimationsForRightView(sideMenuController: LGSideMenuController,
                                    duration: TimeInterval,
                                    timingFunction: CAMediaTimingFunction)

    /// This method is executed inside animation block for hiding right view.
    /// Use it to add some custom animations.
    func hideAnimationsForRightView(sideMenuController: LGSideMenuController,
                                    duration: TimeInterval,
                                    timingFunction: CAMediaTimingFunction)

    /// This method is executed on every transformation of root view during showing/hiding of side views
    /// You can retrieve percentage between `0.0` and `1.0` from userInfo dictionary, where
    ///  - `0.0` - view is fully shown
    ///  - `1.0` - view is fully hidden
    func didTransformRootView(sideMenuController: LGSideMenuController, percentage: CGFloat)

    /// This method is executed on every transformation of left view during showing/hiding
    /// You can retrieve percentage between `0.0` and `1.0` from userInfo dictionary, where
    ///  - `0.0` - view is fully hidden
    ///  - `1.0` - view is fully shown
    func didTransformLeftView(sideMenuController: LGSideMenuController, percentage: CGFloat)

    /// This method is executed on every transformation of right view during showing/hiding
    /// You can retrieve percentage between `0.0` and `1.0` from userInfo dictionary, where
    ///  - `0.0` - view is fully hidden
    ///  - `1.0` - view is fully shown
    func didTransformRightView(sideMenuController: LGSideMenuController, percentage: CGFloat)
}

// As swift doesn't support optional methods,
// we use this extension with default empty implementations for delegate methods
public extension LGSideMenuDelegate {

    func willShowLeftView(sideMenuController: LGSideMenuController) {}
    func didShowLeftView(sideMenuController: LGSideMenuController) {}

    func willHideLeftView(sideMenuController: LGSideMenuController) {}
    func didHideLeftView(sideMenuController: LGSideMenuController) {}

    func willShowRightView(sideMenuController: LGSideMenuController) {}
    func didShowRightView(sideMenuController: LGSideMenuController) {}

    func willHideRightView(sideMenuController: LGSideMenuController) {}
    func didHideRightView(sideMenuController: LGSideMenuController) {}

    func showAnimationsForLeftView(sideMenuController: LGSideMenuController,
                                   duration: TimeInterval,
                                   timingFunction: CAMediaTimingFunction) {}

    func hideAnimationsForLeftView(sideMenuController: LGSideMenuController,
                                   duration: TimeInterval,
                                   timingFunction: CAMediaTimingFunction) {}

    func showAnimationsForRightView(sideMenuController: LGSideMenuController,
                                    duration: TimeInterval,
                                    timingFunction: CAMediaTimingFunction) {}

    func hideAnimationsForRightView(sideMenuController: LGSideMenuController,
                                    duration: TimeInterval,
                                    timingFunction: CAMediaTimingFunction) {}

    func rootViewIsTransforming(sideMenuController: LGSideMenuController, percentage: CGFloat) {}
    func leftViewIsTransforming(sideMenuController: LGSideMenuController, percentage: CGFloat) {}
    func rightViewIsTransforming(sideMenuController: LGSideMenuController, percentage: CGFloat) {}

}
