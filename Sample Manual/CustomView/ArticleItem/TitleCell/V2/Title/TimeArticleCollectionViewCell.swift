//
//  TimeArticleCollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit

class TimeArticleCollectionViewCell: UICollectionViewCell {
    
    static var height: Int {
        return 15
    }
    
    private let lblTime: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(9)
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    private let emptyLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
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
        self.contentView.addSubview(lblTime)
        self.contentView.addSubview(emptyLine)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["lblTime": lblTime,
                                    "emptyLine": emptyLine]
        
        var constraints: [NSLayoutConstraint] = []
        
        lblTime.translatesAutoresizingMaskIntoConstraints = false
        emptyLine.translatesAutoresizingMaskIntoConstraints = false
        
        let v_content = "V:|-0-[lblTime]-5-[emptyLine]-0-|"
        let h_lblTime = "H:|-5-[lblTime]-5-|"
        let h_emptyLine = "H:|-5-[emptyLine]-5-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_content, options: .alignAllLeading, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_lblTime, options: .alignAllTop, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_emptyLine, options: .alignAllTop, metrics: nil, views: views)
        
        constraints += [NSLayoutConstraint(item: emptyLine, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setValue(value: ArticleData?) {
        lblTime.text = value?.dateTime
    }
}
