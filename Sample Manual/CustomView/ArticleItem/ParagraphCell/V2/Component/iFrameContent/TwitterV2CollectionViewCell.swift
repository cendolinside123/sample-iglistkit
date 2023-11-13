//
//  TwitterV2CollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit
import WebKit

class TwitterV2CollectionViewCell: UICollectionViewCell {
    
    static var height: Int {
        let getHeight = UIScreen.main.bounds.width * 1.7
        return Int(getHeight)
    }
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        
        webView.backgroundColor = .white
        webView.allowsLinkPreview = true
        webView.scrollView.isScrollEnabled = false
        webView.sizeToFit()
        return webView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.backgroundColor = .white
        self.contentView.addSubview(webView)
    }
    
    private func setConstraint() {
        let views: [String: Any] = ["webView": webView]
        
        var constraints: [NSLayoutConstraint] = []
        webView.translatesAutoresizingMaskIntoConstraints = false
        let v_webView = "V:|-[webView]-|"
        let h_webView = "H:|-10-[webView]-10-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_webView, options: .alignAllLeading, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_webView, options: .alignAllTop, metrics: [:], views: views)
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension TwitterV2CollectionViewCell {
    
    func setValue(value: LineDesc) {
        if value.type == .iFrame {
            
        }
    }
    
    func cancelLoad() {
        webView.stopLoading()
    }
}
