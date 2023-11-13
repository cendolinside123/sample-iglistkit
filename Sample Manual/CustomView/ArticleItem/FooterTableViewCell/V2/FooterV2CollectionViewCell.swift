//
//  FooterV2CollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 27/09/23.
//

import UIKit

class FooterV2CollectionViewCell: UICollectionViewCell {
    
    private let lblParagraph: UITextView = {
        let label = UITextView()
        label.backgroundColor = .white
        label.isEditable = false
        label.isScrollEnabled = false
        label.textAlignment = .center
        label.font = UIFont(name: Constant.FontName.questrial,
                            size: CGFloat(Constant.FontType.fontSedang))
        label.attributedText = "<div style='text-align: center;'>This is footer, just for testing <a href=\"/\">Media</a></div>".toHtmlPlaint()
        label.sizeToFit()
        return label
    }()

    private let emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        lblParagraph.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.contentView.addSubview(lblParagraph)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["lblParagraph": lblParagraph]
        var constraints: [NSLayoutConstraint] = []
        
        lblParagraph.translatesAutoresizingMaskIntoConstraints = false
        let v_lblParagraph = "V:|-0-[lblParagraph]"
        let h_lblParagraph = "H:|-5-[lblParagraph]-5-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_lblParagraph, options: .alignAllLeading, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_lblParagraph, options: .alignAllTop, metrics: [:], views: views)
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupSize(width: CGFloat) -> CGRect {
        let size = "<div style='text-align: center;'>This is footer, just for testing <a href=\"/\">Media</a></div>".toHtmlPlaint()?.getSize(width: width)
        return CGRect(x: 0, y: 0, width: size?.width ?? 0, height: ((size?.height ?? 0) + CGFloat(Constant.FontType.fontSedang * 2)))
    }
}
