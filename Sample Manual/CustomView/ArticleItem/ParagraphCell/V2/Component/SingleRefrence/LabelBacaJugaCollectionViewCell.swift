//
//  LabelBacaJugaCollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit

class LabelBacaJugaCollectionViewCell: UICollectionViewCell {
    private var lblParagraph: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .red
        label.numberOfLines = 0
        label.font = UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.standartFont))
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
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
        let v_lblParagraph = "V:|-0-[lblParagraph]-0-|"
        let h_lblParagraph = "H:|-10-[lblParagraph]-10-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_lblParagraph, options: .alignAllLeading, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_lblParagraph, options: .alignAllTop, metrics: [:], views: views)
        NSLayoutConstraint.activate(constraints)
    }
}

extension LabelBacaJugaCollectionViewCell {
    func setValue(value: LineDesc) {
        if value.type == .reference {
            if value.type == .reference {
                lblParagraph.attributedText = value.text.toHtml(style: Constant.FontName.OpenSansBold, size: FontSettings.standartFont, color: .red)
            }
        }
    }
}
