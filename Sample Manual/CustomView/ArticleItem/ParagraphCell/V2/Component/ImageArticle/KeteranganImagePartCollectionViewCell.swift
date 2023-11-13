//
//  KeteranganImagePartCollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit

class KeteranganImagePartCollectionViewCell: UICollectionViewCell {
    private var lblCaption: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.numberOfLines = 0
        if !DeviceType.current.isIPad {
            label.font = UIFont.italicSystemFont(ofSize: 12)
        } else {
            label.font = UIFont.italicSystemFont(ofSize: 20)
        }
        
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
        self.contentView.addSubview(lblCaption)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["lblCaption": lblCaption]
        var constraints: [NSLayoutConstraint] = []
        
        lblCaption.translatesAutoresizingMaskIntoConstraints = false
        let v_lblCaption = "V:|-0-[lblCaption]-0-|"
        let h_lblCaption = "H:|-5-[lblCaption]-5-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_lblCaption, options: .alignAllLeading, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_lblCaption, options: .alignAllTop, metrics: [:], views: views)
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension KeteranganImagePartCollectionViewCell {
    func setValue(value: LineDesc) {
        if value.type == .picture {
            
            if let getChild = value.child {
                if getChild.type == .captions {
                    lblCaption.text = getChild.text
                }
            }
        }
    }
    
    
}
