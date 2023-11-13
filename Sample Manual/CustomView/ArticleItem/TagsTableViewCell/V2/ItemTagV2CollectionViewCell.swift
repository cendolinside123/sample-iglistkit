//
//  ItemTagV2CollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 27/09/23.
//

import UIKit

class ItemTagV2CollectionViewCell: UICollectionViewCell {
    private let viewWarna: UIView = {
        let view = UIView()
        return view
    }()
    
    private let viewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.08, green: 0.08, blue: 0.08, alpha: 1.00)
        return view
    }()
    
    private let lblTags: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.FontName.questrial,
                            size: CGFloat(FontSettings.standartFont))
        label.backgroundColor = UIColor(white: 1, alpha: 0.01)
        label.textColor = .white
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        viewWarna.backgroundColor = Constant.listColor.randomElement()
        setupConstraints()
        setCorner()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        lblTags.font = UIFont(name: Constant.FontName.questrial,
                              size: CGFloat(FontSettings.standartFont))
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(white: 1, alpha: 0.001)
        self.contentView.backgroundColor = UIColor(white: 1, alpha: 0.001)
        
        self.contentView.addSubview(viewContainer)
        viewContainer.addSubview(viewWarna)
        viewContainer.addSubview(lblTags)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["viewWarna": viewWarna,
                                    "viewContainer": viewContainer,
                                    "lblTags": lblTags]
        
        var constraints: [NSLayoutConstraint] = []
        
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let h_viewContainer = "H:|-1-[viewContainer]-1-|"
        
        let v_viewContainer = "V:|-1-[viewContainer]-1-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_viewContainer, options: .alignAllTop, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_viewContainer, options: .alignAllCenterY, metrics: nil, views: views)
        
        
        lblTags.translatesAutoresizingMaskIntoConstraints = false
        viewWarna.translatesAutoresizingMaskIntoConstraints = false
        let v_viewWarna = "V:|-0-[viewWarna]-0-|"
        let v_lblTags = "V:|-[lblTags]-|"
        let h_content = "H:|-10-[lblTags]-1-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_content, options: .alignAllCenterY, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_lblTags, options: .alignAllCenterX, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_viewWarna, options: .alignAllCenterX, metrics: nil, views: views)
        constraints += [NSLayoutConstraint(item: viewWarna, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 5)]
        constraints += [NSLayoutConstraint(item: viewWarna, attribute: .leading, relatedBy: .equal, toItem: viewContainer, attribute: .leading, multiplier: 1, constant: 0)]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setCorner() {
        viewContainer.layoutIfNeeded()
        viewContainer.layer.cornerRadius = 3
        viewContainer.clipsToBounds = true
    }
}

extension ItemTagV2CollectionViewCell {
    func setValue(value: Tag) {
        let text = value.title
        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        
        style.lineHeightMultiple = 0.75
        style.lineSpacing = 0
        style.lineBreakMode = .byTruncatingTail
        attributeString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                     value: style,
                                     range: NSMakeRange(0, text.count))
        lblTags.attributedText = attributeString
        
        lblTags.layoutIfNeeded()
    }
    
    func getCellHeight() -> Double {
        return lblTags.intrinsicContentSize.height
    }
    
    func getCellWidth() -> Double {
        return lblTags.intrinsicContentSize.width
    }
    
    func printSize() {
        print("lblTags.intrinsicContentSize.width: \(lblTags.intrinsicContentSize.width)")
        print("lblTags.intrinsicContentSize.height: \(lblTags.intrinsicContentSize.height)")
    }
}
