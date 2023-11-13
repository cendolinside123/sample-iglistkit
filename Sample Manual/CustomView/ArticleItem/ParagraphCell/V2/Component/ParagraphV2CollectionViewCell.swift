//
//  ParagraphV2CollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit

class ParagraphV2CollectionViewCell: UICollectionViewCell {
    
    private let lblParagraph: UITextView = {
        let label = UITextView()
        label.backgroundColor = .white
        label.textColor = .black
        label.isEditable = false
        label.isScrollEnabled = false
        label.font = UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.standartFont))
        label.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        label.textContainer.lineFragmentPadding = 0
        return label
    }()
    
    var cickableURL: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
        lblParagraph.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.contentView.addSubview(lblParagraph)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["lblParagraph": lblParagraph]
        var constraints: [NSLayoutConstraint] = []
        
        lblParagraph.translatesAutoresizingMaskIntoConstraints = false
        let v_lblParagraph = "V:|-5-[lblParagraph]-5-|"
        let h_lblParagraph = "H:|-5-[lblParagraph]-5-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_lblParagraph, options: .alignAllLeading, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_lblParagraph, options: .alignAllTop, metrics: [:], views: views)
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension ParagraphV2CollectionViewCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("url: \(URL)")
        cickableURL?("\(URL)")
        return false
    }
}

extension ParagraphV2CollectionViewCell {
    func setValue(value: LineDesc) {
        if value.type == .paragraph {
            let text = value.text
            lblParagraph.attributedText = text.toHtml()
        }
    }
}

