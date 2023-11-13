//
//  TagsHeaderCollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 07/02/23.
//

import UIKit

class TagsHeaderCollectionViewCell: UICollectionViewCell {
    
    private let imgTags: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "smallTag")
        image.backgroundColor = UIColor(white: 1, alpha: 0.01)
        image.tintColor = .black
        return image
    }()
    
    private let lblTags: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.FontName.OpenSansBold, size: CGFloat(FontSettings.standartFont))
        label.backgroundColor = UIColor(white: 1, alpha: 0.01)
        label.textColor = .black
        label.text = "Tags"
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    private let hStackComponen: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        lblTags.font = UIFont(name: Constant.FontName.OpenSansBold, size: CGFloat(FontSettings.standartFont))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.contentView.backgroundColor = UIColor(white: 1, alpha: 0.001)
        self.backgroundColor = UIColor(white: 1, alpha: 0.001)
        self.contentView.addSubview(hStackComponen)
        self.hStackComponen.addArrangedSubview(imgTags)
        self.hStackComponen.addArrangedSubview(lblTags)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["hStackComponen": hStackComponen]
        
        var constraints: [NSLayoutConstraint] = []
        
        hStackComponen.translatesAutoresizingMaskIntoConstraints = false
        let v_hStackComponen = "V:|-1-[hStackComponen]-1-|"
        let h_hStackComponen = "H:|-0-[hStackComponen]-0-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_hStackComponen, options: .alignAllLeading, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_hStackComponen, options: .alignAllTop, metrics: nil, views: views)
        imgTags.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: imgTags, attribute: .width, relatedBy: .equal, toItem: lblTags, attribute: .width, multiplier: 1/2, constant: 0)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
