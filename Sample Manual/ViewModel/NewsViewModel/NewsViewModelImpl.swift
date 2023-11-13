//
//  NewsViewModelImpl.swift
//  Sample Manual
//
//  Created by Jan Sebastian on 13/10/23.
//

import Foundation


class NewsViewModelImpl: DummyNewsViewModelImpl<[LatestModel]> {
    
    
    override func fetchNews(input: Any, site: String, _ reFetch: Bool = false) {
        var nextNews: [LatestModel] = []
        
        for index in (listNews?.count ?? 0)...((listNews?.count ?? 0) + 5) {
            nextNews.append(LatestModel(guid: "",
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
        
        listNews! += nextNews
        onSucces?()
    }
    
}
