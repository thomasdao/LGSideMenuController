//
// LGSideMenuBackgroundDecorationView.swift
// LGSideMenuController
//
// SPDX-License-Identifier: MIT
// Copyright (c) 2015 Grigorii Lutkov <grigorii@lutkov.dev>
//

import Foundation
import CoreGraphics
import UIKit

public final class LGSideMenuBackgroundDecorationView: UIView {

    public internal(set) var strokeColor: UIColor = .clear {
        didSet {
            setNeedsDisplay()
        }
    }

    public internal(set) var strokeWidth: CGFloat = .zero {
        didSet {
            setNeedsDisplay()
        }
    }

    public internal(set) var fillColor: UIColor = .clear {
        didSet {
            setNeedsDisplay()
        }
    }

    public init() {
        super.init(frame: .zero)
        backgroundColor = .clear
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.clear(rect)

        let path = UIBezierPath(rect: rect)
        path.close()

        // To have inner stroke we need to fill rect and erase smaller rect from inside of it
        if self.strokeColor != .clear && self.strokeWidth > 0 {
            context.beginPath()
            context.addPath(path.cgPath)
            context.setFillColor(strokeColor.cgColor)
            context.fillPath()

            let strokePath = getStrokedPath(rect: rect)
            strokePath.close()

            context.beginPath()
            context.addPath(strokePath.cgPath)
            context.setFillColor(UIColor.clear.cgColor)
            context.setBlendMode(.clear)
            context.fillPath()
            context.setBlendMode(.normal)
        }

        // Fill smaller rect
        if self.fillColor != .clear {
            let strokePath = getStrokedPath(rect: rect)
            strokePath.close()

            context.beginPath()
            context.addPath(strokePath.cgPath)
            context.setFillColor(fillColor.cgColor)
            context.fillPath()
        }
    }

    private func getStrokedPath(rect: CGRect) -> UIBezierPath {
        return UIBezierPath(rect: rect.insetBy(dx: self.strokeWidth, dy: self.strokeWidth))
    }

}
