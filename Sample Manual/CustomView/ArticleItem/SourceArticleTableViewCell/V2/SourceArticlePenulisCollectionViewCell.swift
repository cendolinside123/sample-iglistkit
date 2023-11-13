//
//  SourceArticlePenulisCollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 27/09/23.
//

import UIKit

class SourceArticlePenulisCollectionViewCell: UICollectionViewCell {
    private let lblPenulis: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(white: 1, alpha: 0.001)
        label.numberOfLines = 1
        label.font = UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.smallFont))
        label.text = "Penulis:"
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    private let lblNamaPenulis: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(white: 1, alpha: 0.001)
        label.numberOfLines = 0
        label.font = UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.smallFont))
        label.textColor = .black
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
        lblPenulis.font = UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.smallFont))
        lblNamaPenulis.font = UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.smallFont))
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.contentView.addSubview(hStackComponen)
        hStackComponen.addArrangedSubview(lblPenulis)
        hStackComponen.addArrangedSubview(lblNamaPenulis)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["hStackComponen": hStackComponen]
        var constraints: [NSLayoutConstraint] = []
        
        hStackComponen.translatesAutoresizingMaskIntoConstraints = false
        let h_hStackComponen = "H:|-10-[hStackComponen]-10-|"
        let v_hStackComponen = "V:|-[hStackComponen]-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_hStackComponen, options: .alignAllTop, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_hStackComponen, options: .alignAllLeading, metrics: nil, views: views)
        
        lblPenulis.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: lblPenulis, attribute: .width, relatedBy: .equal, toItem: lblNamaPenulis, attribute: .width, multiplier: 2.5/9, constant: 0)]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension SourceArticlePenulisCollectionViewCell {
    func setValue(namaPenulis: String) {
        lblNamaPenulis.text = namaPenulis
    }
}

