//
//  LatestModel.swift
//  Sample Manual
//
//  Created by Jan Sebastian on 12/10/23.
//

import Foundation


struct LatestModel: Codable, Hashable {
    var site: String?
    let guid, title: String?
    let link: String?
    let alias: String?
    let photo, thumb: String?
    let description: String?
    let pubDate: String?
    let date: Int?
    let dateAgo: String?
    let topic, topicGUID: String?
    let topicURL: String?
    let sectionTitle: String?
    let sectionGUID: String?
    let sectionURL, youtube: String?
    let numPhoto: Int?
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
        case contentType = "content_type"
    }
    
    static func == (lhs: LatestModel, rhs: LatestModel) -> Bool {
        return lhs.guid == rhs.guid && lhs.site == rhs.site
    }

    func hash(into hasher: inout Hasher) {
        
    }
}
