//
// LGSideMenuController+Rotating.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

extension LGSideMenuController {

    open override var shouldAutorotate: Bool {
        if let rootViewController = self.rootViewController {
            return rootViewController.shouldAutorotate
        }
        return super.shouldAutorotate
    }

    open override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)

        if !self.isRootViewShowing {
            self.isRotationInvalidatedLayout = true
        }
    }

    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        // We need to do this, because current orientation is already changed to a new one
        guard let previousOrientation = LGSideMenuHelper.getOppositeInterfaceOrientation() else { return }

        self.cancelRootViewAnimations()
        self.cancelLeftViewAnimations()
        self.cancelRightViewAnimations()

        if (self.leftView != nil && self.isLeftViewAlwaysVisible(orientation: previousOrientation)) ||
            (self.rightView != nil && self.isRightViewAlwaysVisible(orientation: previousOrientation)) {
            self.shouldUpdateVisibility = false
        }

        if self.state == .leftViewWillShow {
            if self.isLeftViewAlwaysVisible {
                self.showLeftViewDone()
            }
        }
        else if self.state == .leftViewWillHide {
            self.hideLeftViewDone(updateStatusBar: true)
        }

        if self.state == .rightViewWillShow {
            if self.isRightViewAlwaysVisible {
                self.showRightViewDone()
            }
        }
        else if self.state == .rightViewWillHide {
            self.hideRightViewDone(updateStatusBar: true)
        }

        coordinator.animate(alongsideTransition: { [weak self] (context: UIViewControllerTransitionCoordinatorContext) in
            guard let self = self else { return }

            if self.isLeftViewAlwaysVisible && !self.isLeftViewHidden {
                self.hideLeftViewPrepare()
                self.hideLeftViewActions(animated: true, duration: context.transitionDuration)
            }

            if self.isRightViewAlwaysVisible && !self.isRightViewHidden {
                self.hideRightViewPrepare()
                self.hideRightViewActions(animated: true, duration: context.transitionDuration)
            }
        }, completion: { [weak self] (context: UIViewControllerTransitionCoordinatorContext) in
            guard let self = self else { return }

            if !self.shouldUpdateVisibility {
                self.shouldUpdateVisibility = true
                self.validateLeftViewsVisibility()
                self.validateRightViewsVisibility()
            }

            self.validateViewsUserInteraction()
        })
    }

}
