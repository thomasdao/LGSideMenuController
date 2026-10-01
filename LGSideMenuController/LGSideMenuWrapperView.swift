//
// LGSideMenuWrapperView.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import UIKit

public final class LGSideMenuWrapperView: UIView {

    public var canLayoutSubviews = true

    public override func setNeedsLayout() {
        guard canLayoutSubviews else { return }
        super.setNeedsLayout()
    }

    public override func layoutIfNeeded() {
        guard canLayoutSubviews else { return }
        super.layoutIfNeeded()
    }

    public override func layoutSubviews() {
        guard canLayoutSubviews else { return }
        super.layoutSubviews()
    }

    public override func layoutSublayers(of layer: CALayer) {
        guard canLayoutSubviews else { return }
        super.layoutSublayers(of: layer)
    }

}
