//
//  UIScreen.swift
//  Metro-Gnome
//
//  Created by Zach Eidenberger on 10/5/23.
//

import UIKit

extension UIScreen
{
#if os(watchOS)
    static let screenSize = WKInterfaceDevice.current().screenBounds.size
    static let screenWidth = screenSize.width
    static let screenHeight = screenSize.height
#elseif os(iOS) || os(tvOS)
    static let screenSize = UIScreen.main.nativeBounds.size
    static let screenWidth = screenSize.width
    static let screenHeight = screenSize.height
#elseif os(macOS)
    static let screenSize = NSScreen.main?.visibleFrame.size
    static let screenWidth = screenSize.width
    static let screenHeight = screenSize.height
#endif
    static let middleOfScreen = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
}
