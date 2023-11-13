//
//  HeaderViewSection.swift
//  
//
//  Created by Jan Sebastian on 28/01/23.
//

import UIKit

class HeaderViewSection: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private let lblFirstWord: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.04, green: 0.35, blue: 0.67, alpha: 1.00)
        label.numberOfLines = 1
        label.font = UIFont(name: Constant.FontName.OpenSans, size: 24)
        label.textAlignment = .center
        label.backgroundColor = UIColor(white: 1, alpha: 0.001)
        label.sizeToFit()
        return label
    }()
    
    private let lblSecondWord: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont(name: Constant.FontName.OpenSans, size: 24)
        label.numberOfLines = 1
        label.backgroundColor = UIColor(white: 1, alpha: 0.001)
        label.sizeToFit()
        return label
    }()
    
    private let hStackContent: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor(white: 1, alpha: 0.001)
        stackView.spacing = 3
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
    
    private func setupView() {
        self.backgroundColor = UIColor(white: 1, alpha: 0.001)
        self.addSubview(hStackContent)
        hStackContent.addArrangedSubview(lblFirstWord)
        hStackContent.addArrangedSubview(lblSecondWord)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["hStackContent": hStackContent]
        
        var constraints: [NSLayoutConstraint] = []
        
        hStackContent.translatesAutoresizingMaskIntoConstraints = false
        let v_hStackContent = "V:|-1-[hStackContent]-1-|"
        let h_hStackContent = "H:|-5-[hStackContent]-5-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_hStackContent, options: .alignAllLeading, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_hStackContent, options: .alignAllTop, metrics: nil, views: views)
        
        lblFirstWord.translatesAutoresizingMaskIntoConstraints = false
        lblSecondWord.translatesAutoresizingMaskIntoConstraints = false
        
        constraints += [NSLayoutConstraint(item: lblFirstWord, attribute: .width, relatedBy: .equal, toItem: lblSecondWord, attribute: .width, multiplier: 1/4, constant: 0)]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func setupWording(firstWord: String, secondWord: String, _ wordingBtnMore: String = "") {
        self.lblFirstWord.text = firstWord
        self.lblSecondWord.text = secondWord.uppercased()
    }
    
}

