//
//  DeviceType.swift
//  Jan Sebastian Tatang
//
//  Created by Jan Sebastian on 15/01/23.
//

import Foundation
import UIKit

enum DeviceType {
    case iPhone5, iPhone6, iPhone6Plus, iPhoneX, iPhoneXR, iPhoneXSMax, iPad, unknown , iPhone12Pro ,  iPhone12ProMax, iphone14Pro, iphone14ProMax, iphone13Mini
    static var current: DeviceType {
        if UIDevice.current.userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                //"iPhone 5 or 5S or 5C"
                return .iPhone5
            case 1334:
                //"iPhone 6/6S/7/8"
                return .iPhone6
            case 1920,2208:
                //"iPhone 6+/6S+/7+/8+"
                return .iPhone6Plus
            case 2436:
                // iPhone X, XS, 11 Pro , 12 Mini
                return .iPhoneX
            case 2688:
                // iPhone XS Max, iPhone XS Max
                return .iPhoneXSMax
            case 1792:
                // iPhone XR, iPhone 11
                return .iPhoneXR
            case 2532:
                // iphone 12 Pro
                return .iPhone12Pro
            case 2778:
                // iphone 12 Pro Max
                return .iPhone12ProMax
            case 2556:
                return .iphone14Pro
            case 2796:
                return .iphone14ProMax
            case 2340:
                return .iphone13Mini
            default:
                return .unknown
            }
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            return .iPad
        } else {
            return .unknown
        }
    }
    
    var isIphoneSpecialClass: Bool {
        return self == .iPhoneX || self == .iPhoneXSMax || self == .iPhoneXR || self == .iPhone12Pro || self == .iPhone12ProMax || self == .iphone14Pro || self == .iphone14ProMax || self == .iphone13Mini
    }
    
    var isIPad: Bool {
        return self == .iPad
    }
}

