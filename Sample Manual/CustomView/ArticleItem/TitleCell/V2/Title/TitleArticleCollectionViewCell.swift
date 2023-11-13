//
//  TitleArticleCollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit

class TitleArticleCollectionViewCell: UICollectionViewCell {
    private let lblTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.FontName.CrimsonTextBold, size: CGFloat(FontSettings.titleFont))
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.textColor = .black
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
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        lblTitleLabel.font = UIFont(name: Constant.FontName.CrimsonTextBold, size: CGFloat(FontSettings.titleFont))
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.contentView.addSubview(lblTitleLabel)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["lblTitleLabel": lblTitleLabel]
        
        var constraints: [NSLayoutConstraint] = []
        lblTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let v_lblTitleLabel = "V:|-5-[lblTitleLabel]"
        let h_lblTitleLabel = "H:|-5-[lblTitleLabel]-5-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_lblTitleLabel, options: .alignAllLeading, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_lblTitleLabel, options: .alignAllTop, metrics: nil, views: views)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setValue(value: ArticleData?) {
        lblTitleLabel.text = value?.title ?? ""
    }
}
