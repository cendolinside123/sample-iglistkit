//
//  ImageArticlePartCollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit

class ImageArticlePartCollectionViewCell: UICollectionViewCell {
    
    static var height: Int {
        let getHeight = (UIScreen.main.bounds.width / 3) * 2
        return Int(getHeight)
    }
    
    private let imageArticle: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageArticle.kf.cancelDownloadTask()
        imageArticle.image = nil
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.contentView.addSubview(imageArticle)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = ["imageArticle": imageArticle]
        var constraints: [NSLayoutConstraint] = []
        
        imageArticle.translatesAutoresizingMaskIntoConstraints = false
        let v_imageArticle = "V:|-0-[imageArticle]-0-|"
        let h_imageArticle = "H:|-5-[imageArticle]-5-|"
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_imageArticle, options: .alignAllLeading, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_imageArticle, options: .alignAllTop, metrics: [:], views: views)
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension ImageArticlePartCollectionViewCell {
    func setValue(value: LineDesc) {
        if value.type == .picture {
            if let url = URL(string: value.link) {
                imageArticle.kf.setImage(with: url)
            }
        }
    }
    
    func getImage() -> UIImageView {
        return imageArticle
    }
    
    func cancelDownload() {
        imageArticle.image = nil
        imageArticle.kf.cancelDownloadTask()
    }
}
