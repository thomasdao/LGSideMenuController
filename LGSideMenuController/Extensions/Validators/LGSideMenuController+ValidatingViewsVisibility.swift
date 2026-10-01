//
// LGSideMenuController+ValidatingViewsVisibility.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

internal extension LGSideMenuController {

    func validateViewsVisibility() {
        self.validateRootViewsVisibility()
        self.validateLeftViewsVisibility()
        self.validateRightViewsVisibility()
    }

    func validateRootViewsVisibility() {
        guard self.shouldUpdateVisibility == true,
              let backgroundDecorationView = self.rootViewBackgroundDecorationView,
              let coverView = self.rootViewCoverView else { return }

        backgroundDecorationView.isHidden = self.isRootViewShowing && !self.isLeftViewAlwaysVisible && !self.isRightViewAlwaysVisible
        coverView.isHidden = self.isRootViewShowing
    }

    func validateLeftViewsVisibility() {
        guard self.shouldUpdateVisibility == true,
              let containerView = self.leftContainerView,
              let coverView = self.leftViewCoverView,
              let statusBarBackgroundView = self.leftViewStatusBarBackgroundView else { return }

        containerView.isHidden = !self.isLeftViewVisibleToUser
        coverView.isHidden = self.isLeftViewShowing || (self.isLeftViewAlwaysVisible && !self.isRightViewVisible)

        statusBarBackgroundView.isHidden =
            self.isLeftViewStatusBarBackgroundHidden ||
            self.isLeftViewStatusBarHidden ||
            self.isNavigationBarVisible() ||
            !self.isViewLocatedUnderStatusBar
    }

    func validateRightViewsVisibility() {
        guard self.shouldUpdateVisibility == true,
              let containerView = self.rightContainerView,
              let coverView = self.rightViewCoverView,
              let statusBarBackgroundView = self.rightViewStatusBarBackgroundView else { return }

        containerView.isHidden = !self.isRightViewVisibleToUser
        coverView.isHidden = self.isRightViewShowing || (self.isRightViewAlwaysVisible && !self.isLeftViewVisible)

        statusBarBackgroundView.isHidden =
            self.isRightViewStatusBarBackgroundHidden ||
            self.isRightViewStatusBarHidden ||
            self.isNavigationBarVisible() ||
            !self.isViewLocatedUnderStatusBar
    }

    private func isNavigationBarVisible() -> Bool {
        guard let navigationController = navigationController else { return false }
        return !navigationController.isNavigationBarHidden
    }

}
