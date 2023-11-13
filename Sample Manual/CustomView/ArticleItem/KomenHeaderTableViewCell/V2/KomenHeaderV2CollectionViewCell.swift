//
//  KomenHeaderV2CollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 27/09/23.
//

import UIKit

class KomenHeaderV2CollectionViewCell: UICollectionViewCell {
    
    static var height: Int {
        return 35
    }
    
    private let lblKomentar: UILabel = {
        let label = UILabel()
        label.text = "Komentar"
        label.numberOfLines = 0
        label.font = UIFont(name: Constant.FontName.CrimsonTextBold, size: CGFloat(23))
        label.backgroundColor = UIColor(white: 1, alpha: 0.001)
        label.textColor = .red
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.contentView.addSubview(lblKomentar)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["lblKomentar": lblKomentar]
        var constraints: [NSLayoutConstraint] = []
        
        lblKomentar.translatesAutoresizingMaskIntoConstraints = false
        
        let h_lblKomentar = "H:|-10-[lblKomentar]-10-|"
        let v_lblKomentar = "V:|-5-[lblKomentar]-5-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_lblKomentar, options: .alignAllTop, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_lblKomentar, options: .alignAllLeading, metrics: nil, views: views)
        
        NSLayoutConstraint.activate(constraints)
    }
}
