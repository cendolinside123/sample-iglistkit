//
//  ArticleMapping.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import Foundation
import IGListKit

class ArticleMapping: NSObject {
    let value: Any
    let type: ArticleMap
    
    init(value: Any, type: ArticleMap) {
        self.value = value
        self.type = type
    }
}

extension ArticleMapping: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }

}
