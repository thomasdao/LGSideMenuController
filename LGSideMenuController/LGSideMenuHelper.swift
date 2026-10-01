//
// LGSideMenuHelper.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import ObjectiveC
import QuartzCore
import UIKit

internal struct LGSideMenuHelper {
    private struct Keys {
        static var sideMenuController = "sideMenuController"
    }

    static func animate(duration: TimeInterval, timingFunction: CAMediaTimingFunction, animations: @escaping () -> Void, completion: @escaping () -> Void) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        CATransaction.setAnimationTimingFunction(timingFunction)
        animations()
        CATransaction.commit()
        UIView.commitAnimations()
    }

    static func statusBarAppearanceUpdate(viewController: UIViewController, duration: TimeInterval, animations: (() -> Void)?) {
        if viewController.preferredStatusBarUpdateAnimation == .none || duration == .zero {
            if let animations = animations {
                animations()
            }
            viewController.setNeedsStatusBarAppearanceUpdate()
        }
        else {
            UIView.animate(withDuration: duration, animations: {
                if let animations = animations {
                    animations()
                }
                viewController.setNeedsStatusBarAppearanceUpdate()
            })
        }
    }

    static func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

    static func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    static func getKeyWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        } else {
            return UIApplication.shared.keyWindow
        }
    }

    static func getStatusBarFrame() -> CGRect {
        if #available(iOS 13.0, *) {
            return getKeyWindow()?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
        } else {
            return UIApplication.shared.statusBarFrame
        }
    }

    static func getInterfaceOrientation() -> UIInterfaceOrientation? {
        if #available(iOS 13.0, *) {
            return getKeyWindow()?.windowScene?.interfaceOrientation
        } else {
            return UIApplication.shared.statusBarOrientation
        }
    }

    static func getOppositeInterfaceOrientation() -> UIInterfaceOrientation? {
        guard let orientation = getInterfaceOrientation() else { return nil }

        if (orientation.isLandscape) {
            return .portrait
        } else {
            return .landscapeLeft
        }
    }

    static func isPortrait() -> Bool {
        return getInterfaceOrientation()?.isPortrait ?? true
    }

    static func isLandscape() -> Bool {
        return getInterfaceOrientation()?.isLandscape ?? false
    }

    static func setSideMenuController(_ sideMenuController: LGSideMenuController?, to viewController: UIViewController) {
        objc_setAssociatedObject(viewController, &Keys.sideMenuController, sideMenuController, .OBJC_ASSOCIATION_ASSIGN)
    }

    static func getSideMenuController(from viewController: UIViewController) -> LGSideMenuController? {
        return objc_getAssociatedObject(viewController, &Keys.sideMenuController) as? LGSideMenuController
    }

    static func canPerformSegue(_ viewController: UIViewController, withIdentifier identifier: String) -> Bool {
        guard let identifiers = viewController.value(forKey: "storyboardSegueTemplates") as? [NSObject] else { return false }
        return identifiers.contains { (object: NSObject) -> Bool in
            if let id = object.value(forKey: "_identifier") as? String {
                return id == identifier
            } else {
                return false
            }
        }
    }

}
