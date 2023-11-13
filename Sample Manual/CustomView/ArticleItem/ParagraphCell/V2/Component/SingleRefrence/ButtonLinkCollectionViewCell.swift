//
//  ButtonLinkCollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit

class ButtonLinkCollectionViewCell: UICollectionViewCell {
    
    private var urlLink: String = ""
    
    private let btnLink: AutoLayoutButton = {
        let buttonRefrence = AutoLayoutButton()
        buttonRefrence.backgroundColor = .white
        buttonRefrence.titleLabel?.font = UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.standartFont))
        buttonRefrence.setTitleColor(.blue, for: .normal)
        buttonRefrence.titleLabel?.numberOfLines = 0
        buttonRefrence.contentHorizontalAlignment = .left
        buttonRefrence.titleLabel?.sizeToFit()
        buttonRefrence.sizeToFit()
        return buttonRefrence
    }()
    
    var sendLink: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
        setupAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        btnLink.titleLabel?.font = UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.standartFont))
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.contentView.addSubview(btnLink)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["btnLink": btnLink]
        var constraints: [NSLayoutConstraint] = []
        
        btnLink.translatesAutoresizingMaskIntoConstraints = false
        let v_btnLink = "V:|-0-[btnLink]-0-|"
        let h_btnLink = "H:|-10-[btnLink]-10-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_btnLink, options: .alignAllLeading, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_btnLink, options: .alignAllTop, metrics: [:], views: views)
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupAction() {
        btnLink.addTarget(self, action: #selector(referenceClick), for: .touchDown)
    }

    @objc private func referenceClick() {
        sendLink?(urlLink)
    }
}

extension ButtonLinkCollectionViewCell {
    func setValue(value: LineDesc) {
        if value.type == .reference {
            if let getChild = value.child {
                if getChild.type == .link {
                    urlLink = getChild.link
                    btnLink.setTitle(getChild.text, for: .normal)
                    btnLink.layoutIfNeeded()
                }
            }
        }
    }
}
