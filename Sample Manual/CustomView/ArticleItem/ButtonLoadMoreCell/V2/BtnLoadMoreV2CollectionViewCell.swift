//
//  BtnLoadMoreV2CollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit

class BtnLoadMoreV2CollectionViewCell: UICollectionViewCell {
    
    static let height: Int = {
        return 100
    }()
    
    private let emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let lblBUtton: UILabel = {
        let label = UILabel()
        label.text = "Muat lagi "
        label.backgroundColor = UIColor(white: 1, alpha: 0.001)
        label.numberOfLines = 1
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    private let lblDropDown: UIButton = {
        let label = UIButton()
//        label.setImage(UIImage(named: "arrowDown"), for: .normal)
        label.imageView?.tintColor = .black
        label.backgroundColor = UIColor(white: 1, alpha: 0.001)
        return label
    }()
    
    private let hStackLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let hStackLoading: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let lblLoading: UILabel = {
        let label = UILabel()
        label.text = "Loading"
        label.numberOfLines = 1
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    private let loadingIndicator = LoadingView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraits()
        hStackLabel.isHidden = false
        hStackLoading.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.contentView.addSubview(emptyView)
        self.contentView.addSubview(hStackLabel)
        hStackLabel.addArrangedSubview(lblBUtton)
        hStackLabel.addArrangedSubview(lblDropDown)
        
        self.contentView.addSubview(hStackLoading)
        hStackLoading.addArrangedSubview(loadingIndicator)
        hStackLoading.addArrangedSubview(lblLoading)
        loadingIndicator.backgroundColor = .white
    }
    
    private func setupConstraits() {
        let views: [String: Any] = ["emptyView": emptyView]
        var constraints: [NSLayoutConstraint] = []
        
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        let h_emptyView = "H:|-0-[emptyView]-0-|"
        let v_emptyView = "V:|-0-[emptyView]-0-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_emptyView, options: .alignAllTop, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_emptyView, options: .alignAllLeading, metrics: nil, views: views)
        
        hStackLabel.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: hStackLabel, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: hStackLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)]
        
        lblDropDown.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: lblDropDown, attribute: .width, relatedBy: .equal, toItem: hStackLabel, attribute: .height, multiplier: 1, constant: 0)]
        
        hStackLoading.translatesAutoresizingMaskIntoConstraints = false
        
        constraints += [NSLayoutConstraint(item: hStackLoading, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)]
        constraints += [NSLayoutConstraint(item: hStackLoading, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)]
        
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        constraints += [NSLayoutConstraint(item: loadingIndicator, attribute: .width, relatedBy: .equal, toItem: hStackLoading, attribute: .height, multiplier: 1, constant: 0)]
        
        NSLayoutConstraint.activate(constraints)
    }
    

    func showLoading() {
        hStackLoading.isHidden = false
        hStackLabel.isHidden = true
        loadingIndicator.startAnimate()
    }
    
    func hideLoading() {
        hStackLoading.isHidden = true
        hStackLabel.isHidden = false
        loadingIndicator.stopAnimate()
    }
    
    func setStatus(isLoading: Bool) {
        if !isLoading {
            hideLoading()
        } else {
            showLoading()
        }
    }
}
