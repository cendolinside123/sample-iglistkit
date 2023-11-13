//
//  NewsCollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 01/04/23.
//

import UIKit
import Kingfisher
import IGListKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    var btnMoreClick: (() -> Void)?
    var topikClicked: (() -> Void)?
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let stackViewAllContent: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private let coverImage: UIImageView = {
        let imageview = UIImageView()
        if !DeviceType.current.isIPad {
            imageview.contentMode = .scaleAspectFill
        } else {
            imageview.contentMode = .scaleAspectFit
            imageview.backgroundColor = .black
        }
        imageview.backgroundColor = UIColor(white: 1, alpha: 0.01)
        return imageview
    }()
    
    private let stackViewLeft: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let hStackImageInfo: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let imgCameraIcon: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "camera")
        return image
    }()
    
    private let hStackMidleInformation: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let lblNumberPic: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        if !DeviceType.current.isIPad {
            label.font = UIFont(name: Constant.FontName.OpenSans, size: 9)
        } else {
            label.font = UIFont(name: Constant.FontName.OpenSans, size: 12)
        }
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor(white: 1, alpha: 0.001)
        return label
    }()
    
    private let lblTitle: UILabel = {
        let label = UILabel()
//        label.text = ""
        label.font = UIFont(name: Constant.FontName.CrimsonTextBold, size: CGFloat(FontSettings.itemTitleFont))
        label.textColor = .black
        if !DeviceType.current.isIPad {
            label.numberOfLines = 3
        } else {
            label.numberOfLines = 3
        }
        
        label.backgroundColor = UIColor(white: 1, alpha: 0.001)
        label.lineBreakMode = .byTruncatingTail
//        label.sizeToFit()
        return label
    }()
    
    private let lblTopic: AutoLayoutButton = {
        let button = AutoLayoutButton()
        button.titleLabel?.font = UIFont(name: Constant.FontName.OpenSans,
                                         size: CGFloat(FontSettings.itemSmallFont))
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = UIColor(white: 1, alpha: 0.001)
        button.titleLabel?.numberOfLines = 1
        return button
    }()
    
    private let lblTime: UILabel = {
        let label = UILabel()
        label.text = ""
        if !DeviceType.current.isIPad {
            label.font = UIFont(name: Constant.FontName.OpenSans, size: 9)
        } else {
            label.font = UIFont(name: Constant.FontName.OpenSans, size: 12)
        }
        label.textColor = .gray
        label.backgroundColor = UIColor(white: 1, alpha: 0.001)
        return label
    }()
    
    private let btnMore: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "more"), for: .normal)
        button.tintColor = .gray
        button.backgroundColor = UIColor(white: 1, alpha: 0.001)
        button.sizeToFit()
        button.titleLabel?.sizeToFit()
        return button
    }()
    
    private let lineSparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    static let height: Int = {
        if !DeviceType.current.isIPad {
            return 160
        } else {
            return 250
        }
    }()
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        lblTitle.font = UIFont(name: Constant.FontName.CrimsonTextBold, size: CGFloat(FontSettings.itemTitleFont))
        lblTopic.titleLabel?.font = UIFont(name: Constant.FontName.OpenSans,
                                           size: CGFloat(FontSettings.itemSmallFont))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    override func prepareForReuse() {
        coverImage.kf.cancelDownloadTask()
        coverImage.image = nil
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.white.withAlphaComponent(0.001)
        self.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.001)
        self.contentView.addSubview(containerView)
        containerView.addSubview(stackViewAllContent)
        stackViewAllContent.addArrangedSubview(stackViewLeft)
        stackViewLeft.addArrangedSubview(lblTopic)
        stackViewLeft.addArrangedSubview(lblTitle)
        stackViewLeft.addArrangedSubview(hStackMidleInformation)
        hStackMidleInformation.addArrangedSubview(lblTime)
        hStackMidleInformation.addArrangedSubview(hStackImageInfo)
        hStackImageInfo.addArrangedSubview(imgCameraIcon)
        hStackImageInfo.addArrangedSubview(lblNumberPic)
        stackViewLeft.addArrangedSubview(btnMore)
        stackViewAllContent.addArrangedSubview(coverImage)
        self.addSubview(lineSparator)
        
    }
    
    private func setupConstraint() {
        let views: [String: Any] = ["containerView": containerView, "stackViewAllContent": stackViewAllContent]
        var constraints: [NSLayoutConstraint] = []
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        let vContainerView: String = "V:|-5-[containerView]-5-|"
        let hContainerView: String = "H:|-5-[containerView]-5-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vContainerView, options: .alignAllLeading, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hContainerView, options: .alignAllTop, metrics: [:], views: views)
        
        stackViewAllContent.translatesAutoresizingMaskIntoConstraints = false
        let vStackViewAllContent: String = "V:|-0-[stackViewAllContent]-0-|"
        let hStackViewAllContent: String = "H:|-5-[stackViewAllContent]-5-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: vStackViewAllContent, options: .alignAllLeading, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: hStackViewAllContent, options: .alignAllTop, metrics: [:], views: views)
        
        stackViewLeft.translatesAutoresizingMaskIntoConstraints = false
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: stackViewLeft, attribute: .width, relatedBy: .equal, toItem: coverImage, attribute: .width, multiplier: 3/2, constant: 0)]
        constraints += [NSLayoutConstraint(item: coverImage, attribute: .height, relatedBy: .equal, toItem: self.contentView, attribute: .height, multiplier: 1.5/2, constant: 0)]
        constraints += [NSLayoutConstraint(item: stackViewLeft, attribute: .height, relatedBy: .equal, toItem: self.stackViewAllContent, attribute: .height, multiplier: 1, constant: 0)]
//        lblTopic.translatesAutoresizingMaskIntoConstraints = false
//        constraints += [NSLayoutConstraint(item: lblTopic, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)]
        
        hStackMidleInformation.translatesAutoresizingMaskIntoConstraints = false
        btnMore.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: hStackMidleInformation, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)]
        constraints += [NSLayoutConstraint(item: btnMore, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)]
        constraints += [NSLayoutConstraint(item: btnMore, attribute: .width, relatedBy: .equal, toItem: btnMore, attribute: .height, multiplier: 1, constant: 0)]
        
        imgCameraIcon.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: imgCameraIcon, attribute: .width, relatedBy: .equal, toItem: hStackMidleInformation, attribute: .height, multiplier: 1, constant: 0)]
        
        lineSparator.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: lineSparator, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: lineSparator, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: lineSparator, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: lineSparator, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1)]
        
        lblTopic.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: lblTopic, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 17)]
        
        NSLayoutConstraint.activate(constraints)
    }

    private func setup() {
        setupView()
        setupConstraint()
        setupCorner()
        btnMore.addTarget(self, action: #selector(btnMoreClicker(sender:)), for: .touchDown)
        
        lblTopic.addTarget(self, action: #selector(gettopic), for: .touchDown)
    }
    
    @objc private func btnMoreClicker(sender: Any) {
        btnMoreClick?()
    }
    
    @objc private func gettopic() {
        topikClicked?()
    }
    
    private func setupCorner() {
        coverImage.layoutIfNeeded()
        coverImage.layer.cornerRadius = 3
        coverImage.clipsToBounds = true
    }
    
}

//extension NewsCollectionViewCell: ListBindable {
//    func bindViewModel(_ viewModel: Any) {
//        
//    }
//}

extension NewsCollectionViewCell {
    
    func buttonMore() -> UIButton {
        return btnMore
    }
    
    func setValue(value: Recommend) {
        
        lblTopic.setTitleColor(.red, for: .normal)
        lblTitle.textColor = .black
        lblTime.textColor = .black
        
        lineSparator.isHidden = false
        if let getTopic = value.topic, getTopic != "" {
            lblTopic.setTitle(getTopic, for: .normal)
            lblTopic.isHidden = false
        } else {
            lblTopic.isHidden = true
        }
        
//        lblTitle.text = value.title
        let attributeString = NSMutableAttributedString(string: value.title)
        let style = NSMutableParagraphStyle()
        
        style.lineHeightMultiple = 0.75
        style.lineSpacing = 0
        attributeString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                     value: style,
                                     range: NSMakeRange(0, value.title.count))
        lblTitle.attributedText = attributeString
        
        lblTime.text = value.dateAgo
        
        if let url = URL(string: value.thumb) {
            coverImage.kf.setImage(with: url)
        }
        
        if let numPhoto = value.numPhoto, numPhoto != "0" {
            lblNumberPic.text = "\(numPhoto) foto"
            hStackImageInfo.isHidden = false
        } else {
            hStackImageInfo.isHidden = true
        }
        
        
    }
    
    func setValue(value: LatestModel) {
        
        lblTopic.setTitleColor(.red, for: .normal)
        lblTitle.textColor = .black
        lblTime.textColor = .black
        
        lineSparator.isHidden = false
        if let getTopic = value.topic, getTopic != "" {
            lblTopic.setTitle(getTopic, for: .normal)
            lblTopic.isHidden = false
        } else {
            lblTopic.isHidden = true
        }
        btnMore.isHidden = false
        
//        lblTitle.text = value.title
        if let text = value.title {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineHeightMultiple = 0.75
            style.lineSpacing = 0
            style.lineBreakMode = .byTruncatingTail
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                         value: style,
                                         range: NSMakeRange(0, text.count))
            lblTitle.attributedText = attributeString
        }
        
        lblTime.text = value.dateAgo
        
        if let getThumb = value.thumb, let url = URL(string: getThumb) {
            coverImage.kf.setImage(with: url)
        }
        
        if let numPhoto = value.numPhoto, numPhoto > 0 {
            lblNumberPic.text = "\(numPhoto) foto"
            hStackImageInfo.isHidden = false
        } else {
            hStackImageInfo.isHidden = true
        }
        
        
        
    }
    
    func setValueBookmark(value: LatestModel) {
        
        lblTopic.setTitleColor(.red, for: .normal)
        lblTitle.textColor = .black
        lblTime.textColor = .black
        
        lineSparator.isHidden = false
        if let getTopic = value.topic, getTopic != "" {
            lblTopic.setTitle(getTopic, for: .normal)
            lblTopic.isHidden = false
        } else {
            lblTopic.isHidden = true
        }
        
        if let text = value.title {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineHeightMultiple = 0.75
            style.lineSpacing = 0
            style.lineBreakMode = .byTruncatingTail
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                         value: style,
                                         range: NSMakeRange(0, text.count))
            lblTitle.attributedText = attributeString
        }
        
        lblTime.text = value.dateAgo
        
        if let getThumb = value.thumb, let url = URL(string: getThumb) {
            coverImage.kf.setImage(with: url)
        }
        btnMore.isHidden = true
        
        if let numPhoto = value.numPhoto, numPhoto > 0 {
            lblNumberPic.text = "\(numPhoto) foto"
            hStackImageInfo.isHidden = false
        } else {
            hStackImageInfo.isHidden = true
        }
        
        
        
    }
    
    func getImageView() -> UIImageView {
        return coverImage
    }
    
}
