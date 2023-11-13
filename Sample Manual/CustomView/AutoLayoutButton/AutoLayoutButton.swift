//
//  AutoLayoutButton.swift
//  
//
//  Created by Jan Sebastian on 07/02/23.
//

import UIKit

class AutoLayoutButton: UIButton {
     override var intrinsicContentSize: CGSize {
         var size = titleLabel!.sizeThatFits(CGSize(width: titleLabel!.preferredMaxLayoutWidth - contentEdgeInsets.left - contentEdgeInsets.right, height: .greatestFiniteMagnitude))
         size.height += contentEdgeInsets.left + contentEdgeInsets.right
         return size
     }
     override func layoutSubviews() {
         titleLabel?.preferredMaxLayoutWidth = frame.size.width
         super.layoutSubviews()
     }
    override func setNeedsLayout() {
        super.setNeedsLayout()
    }
    
 }
