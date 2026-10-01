//
// LGSideMenuController+StatusBarHandler.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

extension LGSideMenuController {

    open override var prefersStatusBarHidden: Bool {
        if self.rootView != nil && (self.state == .rootViewIsShowing || self.state == .leftViewWillHide || self.state == .rightViewWillHide) {
            return self.isRootViewStatusBarHidden
        }
        else if self.leftView != nil && self.isLeftViewVisible && !self.isLeftViewAlwaysVisible {
            return self.isLeftViewStatusBarHidden
        }
        else if self.rightView != nil && self.isRightViewVisible && !self.isRightViewAlwaysVisible {
            return self.isRightViewStatusBarHidden
        }

        return super.prefersStatusBarHidden
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if self.rootView != nil && (self.state == .rootViewIsShowing || self.state == .leftViewWillHide || self.state == .rightViewWillHide) {
            return self.rootViewStatusBarStyle
        }
        else if self.leftView != nil && self.isLeftViewVisible && !self.isLeftViewAlwaysVisible {
            return self.leftViewStatusBarStyle
        }
        else if self.rightView != nil && self.isRightViewVisible && !self.isRightViewAlwaysVisible {
            return self.rightViewStatusBarStyle
        }

        return super.preferredStatusBarStyle
    }

    open override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        if self.rootView != nil && self.state == .rootViewIsShowing {
            return self.rootViewStatusBarUpdateAnimation
        }
        else if self.leftView != nil && self.isLeftViewVisible && !self.isLeftViewAlwaysVisible {
            return self.leftViewStatusBarUpdateAnimation
        }
        else if self.rightView != nil && self.isRightViewVisible && !self.isRightViewAlwaysVisible {
            return self.rightViewStatusBarUpdateAnimation
        }

        return super.preferredStatusBarUpdateAnimation
    }

}
