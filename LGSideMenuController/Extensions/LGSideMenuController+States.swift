//
// LGSideMenuController+States.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

extension LGSideMenuController {

    /// Is root view fully opened
    open var isRootViewShowing: Bool {
        return self.state == .rootViewIsShowing
    }

    /// Is left view fully opened
    open var isLeftViewShowing: Bool {
        return self.state == .leftViewIsShowing
    }

    /// Is right view fully opened
    open var isRightViewShowing: Bool {
        return self.state == .rightViewIsShowing
    }

    /// Is either left or right view fully opened
    open var isSideViewShowing: Bool {
        return self.isLeftViewShowing || self.isRightViewShowing
    }

    /// Is left view showing or will show or will hide right now
    open var isLeftViewVisible: Bool {
        return self.state.isLeftViewVisible
    }

    /// Is right view showing or will show or will hide right now
    open var isRightViewVisible: Bool {
        return self.state.isRightViewVisible
    }

    /// Is either left or right view showing or will show or will hide right now
    open var isSideViewVisible: Bool {
        return self.isLeftViewVisible || self.isRightViewVisible
    }

    /// Is left view fully closed
    open var isRootViewHidden: Bool {
        return self.state.isRootViewHidden
    }

    /// Is left view fully closed
    open var isLeftViewHidden: Bool {
        return self.state.isLeftViewHidden
    }

    /// Is right view fully closed
    open var isRightViewHidden: Bool {
        return self.state.isRightViewHidden
    }

    /// Is either left or right view fully closed
    open var isSideViewHidden: Bool {
        return self.isLeftViewHidden || self.isRightViewHidden
    }

    /// Is left view currently will show or hide
    open var isLeftViewVisibilityChanging: Bool {
        return self.state == .leftViewWillShow || self.state == .leftViewWillHide
    }

    /// Is right view currently will show or hide
    open var isRightViewVisibilityChanging: Bool {
        return self.state == .rightViewWillShow || self.state == .rightViewWillHide
    }

    /// Is either left or right view currently will show or hide
    open var isSideViewVisibilityChanging: Bool {
        return self.isLeftViewVisibilityChanging || self.isRightViewVisibilityChanging
    }

    /// Is left view currently fully open or close
    open var isLeftViewVisibilityStable: Bool {
        return self.state != .leftViewWillShow && self.state != .leftViewWillHide
    }

    /// Is right view currently fully open or close
    open var isRightViewVisibilityStable: Bool {
        return self.state != .rightViewWillShow && self.state != .rightViewWillHide
    }

    /// Is either left or right view currently fully open or close
    open var isSideViewVisibilityStable: Bool {
        return self.isLeftViewVisibilityStable || self.isRightViewVisibilityStable
    }

    /// Is left view suppose to be "always visible" for current orientation
    open var isLeftViewAlwaysVisible: Bool {
        return self.leftViewAlwaysVisibleOptions.isVisible(sizeClass: self.traitCollection.horizontalSizeClass)
    }

    /// Is right view suppose to be "always visible" for current orientation
    open var isRightViewAlwaysVisible: Bool {
        return self.rightViewAlwaysVisibleOptions.isVisible(sizeClass: self.traitCollection.horizontalSizeClass)
    }

    /// Is left view suppose to be "always visible" for specified orientation
    open func isLeftViewAlwaysVisible(orientation: UIInterfaceOrientation) -> Bool {
        return self.leftViewAlwaysVisibleOptions.isVisible(orientation: orientation,
                                                             sizeClass: self.traitCollection.horizontalSizeClass)
    }

    /// Is right view suppose to be "always visible" for specified orientation
    open func isRightViewAlwaysVisible(orientation: UIInterfaceOrientation) -> Bool {
        return self.rightViewAlwaysVisibleOptions.isVisible(orientation: orientation,
                                                              sizeClass: self.traitCollection.horizontalSizeClass)
    }

    /// Is any of side views suppose to be "always visible" for current orientation
    open var isSideViewAlwaysVisible: Bool {
        return self.isLeftViewAlwaysVisible || self.isRightViewAlwaysVisible
    }

    /// Is left view showing or always showing or will show or will hide right now
    open var isLeftViewVisibleToUser: Bool {
        return self.isLeftViewVisible || self.isLeftViewAlwaysVisible
    }

    /// Is right view showing or always showing or will show or will hide right now
    open var isRightViewVisibleToUser: Bool {
        return self.isRightViewVisible || self.isRightViewAlwaysVisible
    }

}
