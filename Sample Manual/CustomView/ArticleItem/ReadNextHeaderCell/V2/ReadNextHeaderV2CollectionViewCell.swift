//
//  ReadNextHeaderV2CollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit

class ReadNextHeaderV2CollectionViewCell: UICollectionViewCell {
    
    static var height: Int {
        return 90
    }
    
    private let lblBacaSelanjutnya: HeaderViewSection = HeaderViewSection()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        lblBacaSelanjutnya.setupWording(firstWord: "read", secondWord: "next")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.contentView.addSubview(lblBacaSelanjutnya)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["lblBacaSelanjutnya": lblBacaSelanjutnya]
        
        var constraints: [NSLayoutConstraint] = []
        
        lblBacaSelanjutnya.translatesAutoresizingMaskIntoConstraints = false
        let v_lblBacaSelanjutnya = "V:|-[lblBacaSelanjutnya]-|"
        let h_lblBacaSelanjutnya = "H:|-5-[lblBacaSelanjutnya]-5-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_lblBacaSelanjutnya, options: .alignAllLeading, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_lblBacaSelanjutnya, options: .alignAllTop, metrics: nil, views: views)
        NSLayoutConstraint.activate(constraints)
    }
}
