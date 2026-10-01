//
// LGSideMenuController+ValidatingUserInteraction.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

internal extension LGSideMenuController {

    func validateViewsUserInteraction() {
        self.validateRootViewsUserInteraction()
        self.validateLeftViewsUserInteraction()
        self.validateRightViewsUserInteraction()
    }

    func validateRootViewsUserInteraction() {
        guard let rootViewWrapperView = self.rootViewWrapperView else { return }
        rootViewWrapperView.isUserInteractionEnabled = self.isRootViewShowing
    }

    func validateLeftViewsUserInteraction() {
        guard let leftViewWrapperView = self.leftViewWrapperView else { return }
        leftViewWrapperView.isUserInteractionEnabled =
            (self.isLeftViewShowing || self.isLeftViewAlwaysVisible) && self.isRightViewHidden
    }

    func validateRightViewsUserInteraction() {
        guard let rightViewWrapperView = self.rightViewWrapperView else { return }
        rightViewWrapperView.isUserInteractionEnabled =
            (self.isRightViewShowing || self.isRightViewAlwaysVisible) && self.isLeftViewHidden
    }

}
