//
//  ArticleViewModelImpl.swift
//  Sample Manual
//
//  Created by Jan Sebastian on 13/10/23.
//

import Foundation
import SwiftSoup

class ArticleViewModelImpl: DummyArticleViewModelImpl<ArticleData> {
    
    
    override func loadArticle() {
        
        var listNews: [LatestModel] = []
        
        for index in 0...5 {
            listNews.append(LatestModel(guid: "",
                                        title: "\(index) Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
                                        link: "",
                                        alias: "",
                                        photo: "",
                                        thumb: "https://www.webfx.com/assets/global/img/header/webfx-logo.png",
                                        description: "",
                                        pubDate: "",
                                        date: 0,
                                        dateAgo: "19 jam yang lalu",
                                        topic: "", topicGUID: "",
                                        topicURL: "",
                                        sectionTitle: "",
                                        sectionGUID: "",
                                        sectionURL: "",
                                        youtube: nil,
                                        numPhoto: nil))
        }
        
        self.contentComponent = mappingArticle(
            content: Constant.lorenIpsum,
            data:
                ArticleModel(
                    tag: [
                        Tag(id: "642288",
                            title: "Lorem ipsum",
                            alias: "Lorem-ipsum"),
                        Tag(id: "201551",
                            title: "Dolor",
                            alias: "Dolor"),
                        Tag(id: "8811",
                            title: "Sit",
                            alias: "sit"),
                        Tag(id: "916472",
                            title: "Amet",
                            alias: "Amet")
                    ],
                    related: listNews,
                    recommend: nil
                )
        )
        
        self.onSucces?()
    }
    
}

extension ArticleViewModelImpl {
    private func mappingArticle(content: String, data: ArticleModel) -> ArticleData? {
        do {
            
            let title = "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."
            let dateTime = "22 Jam yang lalu"
            let sectionTitle = "Lorem ipsum"
            let listBacaLgi = data.related ?? []
            let tag = data.tag ?? []
            let copyrightLine = ""
            let recommended = data.recommend
            let author = "webfx.com"
            let published = "webfx.com"
            let sumber = "webfx.com"
            
            
            var listArticle: [LatestModel] = []
            
            for item in listBacaLgi {
                listArticle.append(item)
            }
            
            
            let doc: Document = try SwiftSoup.parseBodyFragment(content)
            let getParagraph: Elements = try doc.select("p, figure, table, ul, h1, div, div")
            var contentComponent: [LineDesc] = []
            
            if getParagraph.count == 0 {
                
                return ArticleData(title: title, content: [LineDesc(text: content, link: "", child: nil, type: .paragraph)], dateTime: dateTime, listBacaLagi: listArticle, sectionTitle: sectionTitle, tag: tag, recommend: recommended, copyrightLine: copyrightLine, author: author, publishedBy: published, source: sumber)
            }
            
            for item in getParagraph {
                let getItem = try? item.outerHtml()
                let getLink = try? item.select("a")
                let getPicture = try? item.select("img")
                let get_iFrame = try? item.select("iframe")
                let get_tabel = try? item.select("table")
                
                if getLink?.count != 0 {
                    if let getLink, item.hasClass("baca") {
                        var getItemText = (try? item.text()) ?? ""
                        let headLink = LineDesc(text: getItem ?? "", link: "", child: nil, type: .reference)
                        var currentChild: LineDesc? = headLink
                        for item in getLink {
                            
                            let getLinkText: String = (try? item.text()) ?? ""
                            let getHtmlLink: String = (try? item.outerHtml()) ?? ""
                            let getURLLink: String = (try? item.attr("href")) ?? ""
                            getItemText = getItemText.replacingOccurrences(of: getLinkText, with: "")
                            headLink.text = headLink.text.replacingOccurrences(of: getHtmlLink, with: "")
                            let getLinkDisplayText = getLinkText.replacingOccurrences(of: "<p>", with: "").replacingOccurrences(of: "</p>", with: "")
                            currentChild?.child = LineDesc(text: getLinkDisplayText, link: getURLLink, child: nil, type: .link)
                            currentChild = currentChild?.child
                        }
                        headLink.text = headLink.text.replacingOccurrences(of: "<p class=\"baca\">", with: "").replacingOccurrences(of: "</p>", with: "")
                        headLink.size = headLink.text.replacingOccurrences(of: "<p class=\"baca\">", with: "").replacingOccurrences(of: "</p>", with: "").toHtml()?.boundingRect(with: CGSize(width: (UIScreen.main.bounds.width - 10), height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
                        if getItemText != "Baca: " && getItemText != "Baca juga: "{
                            let textParagraph = getItemText.replacingOccurrences(of: "<p class=\"baca\">", with: "").replacingOccurrences(of: "</p>", with: "")
                            let getSizeP = textParagraph.toHtml()?.boundingRect(with: CGSize(width: (UIScreen.main.bounds.width - 10), height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
                            contentComponent.append(LineDesc(text: textParagraph, link: "", child: nil, type: .paragraph, size: getSizeP))
                        } else {
                            contentComponent.append(headLink)
                        }
                    } else {
                        let textParagraph = (getItem ?? "").replacingOccurrences(of: "\\240", with: "").replacingOccurrences(of: "<p>", with: "").replacingOccurrences(of: "</p>", with: "")
                        let getSizeP = textParagraph.toHtml()?.boundingRect(with: CGSize(width: (UIScreen.main.bounds.width - 10), height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
                        let result = LineDesc(text: textParagraph, link: "", child: nil, type: .paragraph, size: getSizeP)
                        contentComponent.append(result)
                    }
                    
                } else if getPicture?.count != 0 {
                    if let getPicture {
                        
                        for index in 0...(getPicture.count - 1) {
                            let getURLLink: String = (try? getPicture[index].attr("src")) ?? ""
                            var caption: String = ""
                            if let getFigcaption = try? item.select("figcaption"), getFigcaption.count > index {
                                caption = (try? getFigcaption[index].text()) ?? ""
                            }
                            
                            let captionText = LineDesc(text: caption, link: "", child: nil, type: .captions)
                            let headImage = LineDesc(text: "", link: getURLLink, child: captionText, type: .picture)
                            contentComponent.append(headImage)
                        }
                        
                    }
                } else if get_iFrame?.count != 0 {
                    if let get_iFrame {
                        for item in get_iFrame {
                            let getHtml_iFrame: String = (try? item.outerHtml()) ?? ""
                            let getLink_iFrame: String = (try? item.attr("src")) ?? ""
                            var getFinalHtml = getHtml_iFrame.replacingOccurrences(of: "&amp;capck=yes", with: "")
                            
                            getFinalHtml = "<html><head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></head><body>\(getFinalHtml)</body></html>"
                            contentComponent.append(LineDesc(text: getFinalHtml, link: getLink_iFrame, child: nil, type: .iFrame))
                        }
                    }
                    
                } else if get_tabel?.count != 0 {
                    let removeBorder = (getItem ?? "").replacingOccurrences(of: "<table border=\"1\">", with: "<table>")
                    let getSizeTable = removeBorder.toHtml()?.boundingRect(with: CGSize(width: (UIScreen.main.bounds.width - 10), height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
                    let result = LineDesc(text: removeBorder, link: "", child: nil, type: .paragraph, size: getSizeTable)
                    contentComponent.append(result)
                } else {
                    let textParagraph = (getItem ?? "").replacingOccurrences(of: "\\240", with: "").replacingOccurrences(of: "<p>", with: "").replacingOccurrences(of: "</p>", with: "")
                    
                    let getSizeP = textParagraph.toHtml()?.boundingRect(with: CGSize(width: (UIScreen.main.bounds.width - 10), height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
                    
                    let result = LineDesc(text: textParagraph, link: "", child: nil, type: .paragraph, size: getSizeP)
                    contentComponent.append(result)
                }
            }
            
            return ArticleData(title: title, content: contentComponent, dateTime: dateTime, listBacaLagi: listArticle, sectionTitle: sectionTitle, tag: tag, recommend: recommended, copyrightLine: copyrightLine, author: author, publishedBy: published, source: sumber)
        } catch {
            return nil
        }
    }
}
