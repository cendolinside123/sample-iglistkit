//
//  UIString+Extension.swift
//  Jan Sebastian Tatang
//
//  Created by Jan Sebastian on 17/01/23.
//

import Foundation
import UIKit

extension String {
    func getSize(width: CGFloat, fontName: String, fontSize: Int) -> CGRect {
        
        let getSize = self.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [.font: UIFont(name: fontName, size: CGFloat(fontSize))!], context: nil)
        
        return getSize
    }
    
    func toHtml(style: String, size: Int, color: String) -> NSAttributedString? {
        
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', '\(Constant.FontName.questrial)'; font-size: \(size); color: \(color)\" >%@</span>", self)
        
        guard let data = modifiedFont.data(using: .unicode,
                                allowLossyConversion: false) else{
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey : Any]
        = [
            NSAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
            NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html
        ]
        let modifiedText = try? NSAttributedString(data: data, options: options, documentAttributes: nil)
        return modifiedText
    }
    
    func toHtml(style: String, size: Int, color: UIColor) -> NSAttributedString? {
        
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', '\(Constant.FontName.questrial)'; font-size: \(size);\" >%@</span>", self)
        
        guard let data = modifiedFont.data(using: .unicode,
                                allowLossyConversion: false) else{
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey : Any]
        = [
            NSAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
            NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html
        ]
        let modifiedText = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
        
        return modifiedText
    }
    
    func toHtml() -> NSMutableAttributedString? {
        
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', '\(Constant.FontName.questrial)'; font-size: \(FontSettings.standartFont)\">%@</span>", self)
        
        guard let data = modifiedFont.data(using: .unicode,
                                allowLossyConversion: false) else{
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey : Any]
        = [
            NSAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
            NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html
        ]
        let modifiedText = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
        
        return modifiedText
    }
    
    func toHtml(size: Int) -> NSMutableAttributedString? {
        
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', '\(Constant.FontName.questrial)'; font-size: \(size)\">%@</span>", self)
        
        guard let data = modifiedFont.data(using: .unicode,
                                allowLossyConversion: false) else{
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey : Any]
        = [
            NSAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
            NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html
        ]
        let modifiedText = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
        return modifiedText
    }
    
    func toHtml(size: Int, style: String) -> NSMutableAttributedString? {
        
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', '\(style)'; font-size: \(size)\">%@</span>", self)
        
        guard let data = modifiedFont.data(using: .unicode,
                                allowLossyConversion: false) else{
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey : Any]
        = [
            NSAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
            NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html
        ]
        let modifiedText = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
        
        return modifiedText
    }
    
    func toHtmlPlaint() -> NSMutableAttributedString? {
        
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', '\(Constant.FontName.questrial)'; font-size: \(Constant.FontType.fontSedang)\">%@</span>", self)
        
        guard let data = modifiedFont.data(using: .unicode,
                                allowLossyConversion: false) else{
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey : Any]
        = [
            NSAttributedString.DocumentReadingOptionKey.characterEncoding : String.Encoding.utf8.rawValue,
            NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html
        ]
        let modifiedText = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
        return modifiedText
    }
    
}

extension NSMutableAttributedString {

    func with(font: UIFont) -> NSMutableAttributedString {
        self.enumerateAttribute(NSAttributedString.Key.font, in: NSMakeRange(0, self.length), options: .longestEffectiveRangeNotRequired, using: { (value, range, stop) in
            let originalFont = value as! UIFont
            if let newFont = applyTraitsFromFont(originalFont, to: font) {
                self.addAttribute(NSAttributedString.Key.font, value: newFont, range: range)
            }
        })
        return self
    }

    func applyTraitsFromFont(_ f1: UIFont, to f2: UIFont) -> UIFont? {
        let originalTrait = f1.fontDescriptor.symbolicTraits

        if originalTrait.contains(.traitExpanded) {
            var traits = f2.fontDescriptor.symbolicTraits
            traits.insert(.traitExpanded)
            if let fd = f2.fontDescriptor.withSymbolicTraits(traits) {
                return UIFont.init(descriptor: fd, size: 0)
            }
        }
        if originalTrait.contains(.traitBold) {
            var traits = f2.fontDescriptor.symbolicTraits
            traits.insert(.traitBold)
            if let fd = f2.fontDescriptor.withSymbolicTraits(traits) {
                return UIFont.init(descriptor: fd, size: 0)
            }
        }
        return f2
    }
    
    func getSize(width: CGFloat) -> CGRect {
        
        let getSize = self.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), context: nil)
        
        return getSize
    }
}
