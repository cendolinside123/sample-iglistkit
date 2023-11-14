//
//  ArticleModel.swift
//  Sample Manual
//
//  Created by Jan Sebastian on 12/10/23.
//

import Foundation

struct ArticleModel: Codable {
    var site: String?
    let tag: [Tag]?
    let related: [LatestModel]?
    let recommend: LatestModel?
}

enum LineType {
    case paragraph, source, reference, picture, video, other, link, captions, iFrame, ads
}

class ArticleData {
    let title: String
    let content: [LineDesc]
    let dateTime: String
    let listBacaLagi: [LatestModel]
    let tag: [Tag]
    let recommend: LatestModel?
    let copyrightLine, author, publishedBy, source: String
    
    init(title: String, content: [LineDesc], dateTime: String, listBacaLagi: [LatestModel], sectionTitle: String, tag: [Tag], recommend: LatestModel?, copyrightLine: String, author: String, publishedBy: String, source: String) {
        self.title = title
        self.content = content
        self.dateTime = dateTime
        self.listBacaLagi = listBacaLagi
        self.tag = tag
        self.recommend = recommend
        self.copyrightLine = copyrightLine
        self.author = author
        self.publishedBy = publishedBy
        self.source = source
    }
    
    
}

class LineDesc {
    var text: String
    let link: String
    var child: LineDesc?
    let type: LineType
    var size: CGRect?
    
    init(text: String,
         link: String,
         child: LineDesc?,
         type: LineType,
         size: CGRect? = nil) {
        self.text = text
        self.link = link
        self.child = child
        self.type = type
        self.size = size
    }
}

struct Tag: Codable {
    let id, title, alias: String
}

struct Recommend: Codable {
    var site: String?
    let guid, title: String
    let link: String
    let alias: String
    let photo: String?
    let thumb: String
    let description, pubDate: String?
    let date: Int?
    let dateAgo: String?
    let topic, topicGUID, topicURL, sectionTitle: String?
    let sectionGUID, sectionURL: String?
    let youtube: String?
    let numPhoto, dataSource: String?
    var contentType: String?

    enum CodingKeys: String, CodingKey {
        case site, guid, title, link, alias, photo, thumb, description, pubDate, date, dateAgo, topic
        case topicGUID = "topic_guid"
        case topicURL = "topic_url"
        case sectionTitle = "section_title"
        case sectionGUID = "section_guid"
        case sectionURL = "section_url"
        case youtube
        case numPhoto = "num_photo"
        case dataSource = "data_source"
        case contentType = "content_type"
    }
}

enum Source: Codable {
    case bool(Bool)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Source.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Source"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}
