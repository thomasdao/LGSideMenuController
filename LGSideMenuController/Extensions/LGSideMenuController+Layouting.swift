//
// LGSideMenuController+Layouting.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

extension LGSideMenuController {

    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let size = self.view.bounds.size
        if self.isNeedsUpdateLayoutsAndStyles || self.savedSize != size {
            self.savedSize = size
            self.updateLayoutsAndStyles()
        }
        else if self.isNeedsUpdateRootViewLayoutsAndStyles {
            self.updateRootViewLayoutsAndStyles()
        }
        else if self.isNeedsUpdateLeftViewLayoutsAndStyles {
            self.updateLeftViewLayoutsAndStyles()
        }
        else if self.isNeedsUpdateRightViewLayoutsAndStyles {
            self.updateRightViewLayoutsAndStyles()
        }
    }

    /// Invalidates the current layout and triggers a layout update during the next update cycle.
    open func setNeedsUpdateLayoutsAndStyles() {
        self.isNeedsUpdateLayoutsAndStyles = true
        if self.isViewLoaded {
            self.view.setNeedsLayout()
        }
    }

    /// Invalidates the current layout and triggers a layout update during the next update cycle.
    open func setNeedsUpdateRootViewLayoutsAndStyles() {
        self.isNeedsUpdateRootViewLayoutsAndStyles = true
        if self.isViewLoaded {
            self.view.setNeedsLayout()
        }
    }

    /// Invalidates the current layout and triggers a layout update during the next update cycle.
    open func setNeedsUpdateLeftViewLayoutsAndStyles() {
        self.isNeedsUpdateLeftViewLayoutsAndStyles = true
        if self.isViewLoaded {
            self.view.setNeedsLayout()
        }
    }

    /// Invalidates the current layout and triggers a layout update during the next update cycle.
    open func setNeedsUpdateRightViewLayoutsAndStyles() {
        self.isNeedsUpdateRightViewLayoutsAndStyles = true
        if self.isViewLoaded {
            self.view.setNeedsLayout()
        }
    }

    /// Forces update layouts and styles for all views
    open func updateLayoutsAndStyles() {
        self.isNeedsUpdateLayoutsAndStyles = false
        self.isNeedsUpdateRootViewLayoutsAndStyles = false
        self.isNeedsUpdateLeftViewLayoutsAndStyles = false
        self.isNeedsUpdateRightViewLayoutsAndStyles = false

        self.validateViewsInit()
        self.validateViewsHierarchy()
        self.validateViewsFrames()
        self.validateViewsStyles()
        self.validateViewsTransforms()
        self.validateViewsVisibility()
    }

    /// Forces update layouts and styles for root views
    open func updateRootViewLayoutsAndStyles() {
        self.isNeedsUpdateRootViewLayoutsAndStyles = false

        self.validateRootViewsInit()
        self.validateViewsHierarchy() // Whole hierarchy should be validated
        self.validateRootViewsFrames()
        self.validateRootViewsStyles()
        self.validateRootViewsTransforms()
        self.validateRootViewsVisibility()
    }

    /// Forces update layouts and styles for left views
    open func updateLeftViewLayoutsAndStyles() {
        self.isNeedsUpdateLeftViewLayoutsAndStyles = false

        self.validateLeftViewsInit()
        self.validateViewsHierarchy() // Whole hierarchy should be validated
        self.validateLeftViewsFrames()
        self.validateLeftViewsStyles()
        self.validateLeftViewsTransforms()
        self.validateLeftViewsVisibility()
    }

    /// Forces update layouts and styles for right views
    open func updateRightViewLayoutsAndStyles() {
        self.isNeedsUpdateRightViewLayoutsAndStyles = false

        self.validateRightViewsInit()
        self.validateViewsHierarchy() // Whole hierarchy should be validated
        self.validateRightViewsFrames()
        self.validateRightViewsStyles()
        self.validateRightViewsTransforms()
        self.validateRightViewsVisibility()
    }

}
