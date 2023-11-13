//
//  YoutubeV2CollectionViewCell.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import UIKit
import WebKit

class YoutubeV2CollectionViewCell: UICollectionViewCell {
    
    static var height: Int {
        let getHeight = (UIScreen.main.bounds.width / 3) * 2.5
        return Int(getHeight)
    }
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        
        webView.backgroundColor =  .white
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
        let views: [String: Any] = ["webView": webView,]
        
        var constraints: [NSLayoutConstraint] = []
        webView.translatesAutoresizingMaskIntoConstraints = false
        let v_webView = "V:|-[webView]-|"
        let h_webView = "H:|-10-[webView]-10-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_webView, options: .alignAllLeading, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_webView, options: .alignAllTop, metrics: [:], views: views)
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension YoutubeV2CollectionViewCell {
    
    func setValue(value: LineDesc) {
        if value.type == .iFrame {
            if let url = URL(string: value.link) {
                if url.host == "www.youtube.com" {
                    let youtubeHTML = "<html><head><meta name=\"viewport\" content=\"width=device-width, initial-scale=0.5\"></head><body><iframe src=\"\(url)\" width=\"100%\" height=\"100%\" class=\"bor1\" scrolling=\"no\" frameborder=\"0\" loading=\"lazy\"></iframe></body></html>"
                    webView.loadHTMLString(youtubeHTML, baseURL: nil)
                    let lightDarkCSS = ":root { color-scheme: light dark; }"
                    let base64 = lightDarkCSS.data(using: .utf8)!.base64EncodedString()

                    let script = """
                        javascript:(function() {
                            var parent = document.getElementsByTagName('head').item(0);
                            var style = document.createElement('style');
                            style.type = 'text/css';
                            style.innerHTML = window.atob('\(base64)');
                            parent.appendChild(style);
                        })()
                    """

                    let cssScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
                    webView.configuration.userContentController.addUserScript(cssScript)
                }
            }
            
        }
    }
    
    func cancelLoad() {
        webView.stopLoading()
    }
}
