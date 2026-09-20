//
// LGSideMenuStatusBarBackgroundView.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import CoreGraphics
import UIKit

public final class LGSideMenuStatusBarBackgroundView: UIView {

    public internal(set) var fillColor: UIColor = .clear {
        didSet {
            setNeedsDisplay()
        }
    }

    public internal(set) var shadowColor: UIColor = .clear {
        didSet {
            setNeedsDisplay()
        }
    }

    public internal(set) var shadowBlur: CGFloat = .zero {
        didSet {
            setNeedsDisplay()
        }
    }

    public init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .clear
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        // dx: 0.0, because shadow is much lighter at the corner
        let drawRect = rect.insetBy(dx: 0.0, dy: self.shadowBlur)

        let path = UIBezierPath(rect: drawRect)
        path.close()

        context.clear(rect)
        context.beginPath()
        context.addPath(path.cgPath)

        // Fill it black to draw proper shadow, then erase black internals and keep only shadow
        if shadowColor != .clear && self.shadowBlur > 0 {
            context.setShadow(offset: .zero, blur: self.shadowBlur, color: shadowColor.cgColor)
            context.setFillColor(UIColor.black.cgColor)
            context.fillPath()
            context.setShadow(offset: .zero, blur: .zero, color: nil)

            context.beginPath()
            context.addPath(path.cgPath)
            context.setFillColor(UIColor.clear.cgColor)
            context.setBlendMode(.clear)
            context.fillPath()
            context.setBlendMode(.normal)
        }

        // Fill it with proper color
        if self.fillColor != .clear {
            context.beginPath()
            context.addPath(path.cgPath)
            context.setFillColor(fillColor.cgColor)
            context.fillPath()
        }
    }

}
