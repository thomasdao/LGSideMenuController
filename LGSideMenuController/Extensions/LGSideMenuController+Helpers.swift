//
// LGSideMenuController+Helpers.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

internal extension LGSideMenuController {

    func disableRootViewLayouting() {
        guard self.isRootViewLayoutingEnabled == true,
              let wrapperView = self.rootViewWrapperView else { return }

        wrapperView.canLayoutSubviews = false
        self.isRootViewLayoutingEnabled = false
    }

    func enableRootViewLayouting() {
        guard self.isRootViewLayoutingEnabled == false,
              let wrapperView = self.rootViewWrapperView else { return }

        wrapperView.canLayoutSubviews = true
        self.isRootViewLayoutingEnabled = true
    }

    func disableRootViewControllerLayouting() {
        guard self.isRootViewControllerLayoutingEnabled == true,
              let viewController = self.rootViewController else { return }

        viewController.willMove(toParent: nil)
        viewController.removeFromParent()
        self.isRootViewControllerLayoutingEnabled = false
    }

    func enableRootViewControllerLayouting() {
        guard self.isRootViewControllerLayoutingEnabled == false,
              let viewController = self.rootViewController else { return }

        self.addChild(viewController)
        viewController.didMove(toParent: self)
        self.isRootViewControllerLayoutingEnabled = true
    }

    var leftViewWidthTotal: CGFloat {
        self.leftViewWidth + self.leftViewLayerBorderWidth
    }

    var rightViewWidthTotal: CGFloat {
        self.rightViewWidth + self.rightViewLayerBorderWidth
    }

    var rootViewOffsetTotalForLeftView: CGPoint {
        var result = self.rootViewOffsetWhenHiddenForLeftView
        if self.leftViewPresentationStyle.shouldRootViewMove {
            result.x += self.leftViewWidthTotal + self.rootViewLayerBorderWidthForLeftView
        }
        return result
    }

    var rootViewOffsetTotalForLeftViewWhenAlwaysVisible: CGFloat {
        return
            self.rootViewOffsetWhenHiddenForLeftView.x +
            self.leftViewWidthTotal +
            self.rootViewLayerBorderWidthForLeftView
    }

    var rootViewOffsetTotalForRightView: CGPoint {
        var result = CGPoint(x: -self.rootViewOffsetWhenHiddenForRightView.x,
                             y: self.rootViewOffsetWhenHiddenForRightView.y)
        if self.rightViewPresentationStyle.shouldRootViewMove {
            result.x += self.rightViewWidthTotal + self.rootViewLayerBorderWidthForRightView
        }
        return result
    }

    var rootViewOffsetTotalForRightViewWhenAlwaysVisible: CGFloat {
        return
            -self.rootViewOffsetWhenHiddenForRightView.x +
            self.rightViewWidthTotal +
            self.rootViewLayerBorderWidthForRightView
    }

    // MARK: - Cancel Animations -

    func cancelRootViewAnimations() {
        guard let containerView = self.rootContainerView,
              let wrapperView = self.rootViewWrapperView,
              let coverView = self.rootViewCoverView else { return }

        CATransaction.begin()
        containerView.layer.removeAllAnimations()
        wrapperView.layer.removeAllAnimations()
        coverView.layer.removeAllAnimations()
        CATransaction.commit()
    }

    func cancelLeftViewAnimations() {
        guard let containerView = self.leftContainerView,
              let backgroundDecorationView = self.leftViewBackgroundDecorationView,
              let wrapperView = self.leftViewWrapperView,
              let coverView = self.leftViewCoverView else { return }

        CATransaction.begin()
        containerView.layer.removeAllAnimations()
        backgroundDecorationView.layer.removeAllAnimations()
        wrapperView.layer.removeAllAnimations()
        coverView.layer.removeAllAnimations()
        CATransaction.commit()
    }

    func cancelRightViewAnimations() {
        guard let containerView = self.rightContainerView,
              let backgroundDecorationView = self.rightViewBackgroundDecorationView,
              let wrapperView = self.rightViewWrapperView,
              let coverView = self.rightViewCoverView else { return }

        CATransaction.begin()
        containerView.layer.removeAllAnimations()
        backgroundDecorationView.layer.removeAllAnimations()
        wrapperView.layer.removeAllAnimations()
        coverView.layer.removeAllAnimations()
        CATransaction.commit()
    }

    // MARK: - Status Bar -

    var isViewLocatedUnderStatusBar: Bool {
        guard let keyWindow = LGSideMenuHelper.getKeyWindow() else { return false }
        let statusBarOrigin = keyWindow.convert(LGSideMenuHelper.getStatusBarFrame().origin, to: self.view)
        return statusBarOrigin == .zero
    }

}
