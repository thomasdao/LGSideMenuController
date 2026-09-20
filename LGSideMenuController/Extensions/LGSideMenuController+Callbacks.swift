//
// LGSideMenuController+Callbacks.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

internal extension LGSideMenuController {

    // MARK: - Root View -

    func didTransformRootViewCallbacks(percentage: CGFloat) {
        NotificationCenter.default.post(name: Notification.didTransformRootView,
                                        object: self,
                                        userInfo: [Notification.Key.percentage: percentage])

        if let callback = self.didTransformRootView {
            callback(self, percentage)
        }

        if let delegate = self.delegate {
            delegate.didTransformRootView(sideMenuController: self, percentage: percentage)
        }
    }

    // MARK: - Left View -

    func willShowLeftViewCallbacks() {
        NotificationCenter.default.post(name: Notification.willShowLeftView, object: self)

        if let willShowLeftView = self.willShowLeftView {
            willShowLeftView(self)
        }

        if let delegate = self.delegate {
            delegate.willShowLeftView(sideMenuController: self)
        }
    }

    func didShowLeftViewCallbacks() {
        NotificationCenter.default.post(name: Notification.didShowLeftView, object: self)

        if let didShowLeftView = self.didShowLeftView {
            didShowLeftView(self)
        }

        if let delegate = self.delegate {
            delegate.didShowLeftView(sideMenuController: self)
        }
    }

    func willHideLeftViewCallbacks() {
        NotificationCenter.default.post(name: Notification.willHideLeftView, object: self)

        if let willHideLeftView = self.willHideLeftView {
            willHideLeftView(self)
        }

        if let delegate = self.delegate {
            delegate.willHideLeftView(sideMenuController: self)
        }
    }

    func didHideLeftViewCallbacks() {
        NotificationCenter.default.post(name: Notification.didHideLeftView, object: self)

        if let didHideLeftView = self.didHideLeftView {
            didHideLeftView(self)
        }

        if let delegate = self.delegate {
            delegate.didHideLeftView(sideMenuController: self)
        }
    }

    func showAnimationsForLeftViewCallbacks(duration: TimeInterval, timingFunction: CAMediaTimingFunction) {
        NotificationCenter.default.post(name: Notification.showAnimationsForLeftView,
                                        object: self,
                                        userInfo: [Notification.Key.duration: duration,
                                                   Notification.Key.timigFunction: timingFunction])

        if let callback = self.showAnimationsForLeftView {
            callback(self, duration, timingFunction)
        }

        if let delegate = self.delegate {
            delegate.showAnimationsForLeftView(sideMenuController: self,
                                               duration: duration,
                                               timingFunction: timingFunction)
        }
    }

    func hideAnimationsForLeftViewCallbacks(duration: TimeInterval, timingFunction: CAMediaTimingFunction) {
        NotificationCenter.default.post(name: Notification.hideAnimationsForLeftView,
                                        object: self,
                                        userInfo: [Notification.Key.duration: duration,
                                                   Notification.Key.timigFunction: timingFunction])

        if let callback = self.hideAnimationsForLeftView {
            callback(self, duration, timingFunction)
        }

        if let delegate = self.delegate {
            delegate.hideAnimationsForLeftView(sideMenuController: self,
                                               duration: duration,
                                               timingFunction: timingFunction)
        }
    }

    func didTransformLeftViewCallbacks(percentage: CGFloat) {
        NotificationCenter.default.post(name: Notification.didTransformLeftView,
                                        object: self,
                                        userInfo: [Notification.Key.percentage: percentage])

        if let callback = self.didTransformLeftView {
            callback(self, percentage)
        }

        if let delegate = self.delegate {
            delegate.didTransformLeftView(sideMenuController: self, percentage: percentage)
        }
    }

    // MARK: - Right View -

    func willShowRightViewCallbacks() {
        NotificationCenter.default.post(name: Notification.willShowRightView, object: self)

        if let willShowRightView = self.willShowRightView {
            willShowRightView(self)
        }

        if let delegate = self.delegate {
            delegate.willShowRightView(sideMenuController: self)
        }
    }

    func didShowRightViewCallbacks() {
        NotificationCenter.default.post(name: Notification.didShowRightView, object: self)

        if let didShowRightView = self.didShowRightView {
            didShowRightView(self)
        }

        if let delegate = self.delegate {
            delegate.didShowRightView(sideMenuController: self)
        }
    }

    func willHideRightViewCallbacks() {
        NotificationCenter.default.post(name: Notification.willHideRightView, object: self)

        if let willHideRightView = self.willHideRightView {
            willHideRightView(self)
        }

        if let delegate = self.delegate {
            delegate.willHideRightView(sideMenuController: self)
        }
    }

    func didHideRightViewCallbacks() {
        NotificationCenter.default.post(name: Notification.didHideRightView, object: self)

        if let didHideRightView = self.didHideRightView {
            didHideRightView(self)
        }

        if let delegate = self.delegate {
            delegate.didHideRightView(sideMenuController: self)
        }
    }

    func showAnimationsForRightViewCallbacks(duration: TimeInterval, timingFunction: CAMediaTimingFunction) {
        NotificationCenter.default.post(name: Notification.showAnimationsForRightView,
                                        object: self,
                                        userInfo: [Notification.Key.duration: duration,
                                                   Notification.Key.timigFunction: timingFunction])

        if let callback = self.showAnimationsForRightView {
            callback(self, duration, timingFunction)
        }

        if let delegate = self.delegate {
            delegate.showAnimationsForRightView(sideMenuController: self,
                                                duration: duration,
                                                timingFunction: timingFunction)
        }
    }

    func hideAnimationsForRightViewCallbacks(duration: TimeInterval, timingFunction: CAMediaTimingFunction) {
        NotificationCenter.default.post(name: Notification.hideAnimationsForRightView,
                                        object: self,
                                        userInfo: [Notification.Key.duration: duration,
                                                   Notification.Key.timigFunction: timingFunction])

        if let callback = self.hideAnimationsForRightView {
            callback(self, duration, timingFunction)
        }

        if let delegate = self.delegate {
            delegate.hideAnimationsForRightView(sideMenuController: self,
                                                duration: duration,
                                                timingFunction: timingFunction)
        }
    }

    func didTransformRightViewCallbacks(percentage: CGFloat) {
        NotificationCenter.default.post(name: Notification.didTransformRightView,
                                        object: self,
                                        userInfo: [Notification.Key.percentage: percentage])

        if let callback = self.didTransformRightView {
            callback(self, percentage)
        }

        if let delegate = self.delegate {
            delegate.didTransformRightView(sideMenuController: self, percentage: percentage)
        }
    }

}
