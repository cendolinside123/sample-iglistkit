//
//  TagArticleViewHolder.swift
//  
//
//  Created by Jan Sebastian on 02/10/23.
//

import Foundation
import IGListKit

class TagArticleViewHolder: ListSectionController {
    private var listTag: [Tag] = []
    var selectedTag: ((Tag) -> Void)?
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    override func didUpdate(to object: Any) {
        if let getValue = object as? ArticleMapping,
           let getData = getValue.value as? [Tag],
           getValue.type == .Tags {
            listTag.append(Tag(id: "head", title: "head", alias: "head"))
            listTag += getData
        }
    }
    
    override func numberOfItems() -> Int {
        return listTag.count
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let data = listTag[index]
        
        if data.id == "head" {
            guard let cell = collectionContext?.dequeueReusableCell(of: TagsHeaderCollectionViewCell.self, for: self, at: index) as? TagsHeaderCollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            return cell
        } else {
            guard let cell = collectionContext?.dequeueReusableCell(of: ItemTagV2CollectionViewCell.self, for: self, at: index) as? ItemTagV2CollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            cell.setValue(value: data)
            return cell
        }
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let data = listTag[index]
        
        if data.id == "head" {
            return CGSize(width: CGFloat((4 * FontSettings.standartFont) + 15), height: CGFloat(FontSettings.standartFont + 15))
        } else {
            let getSelectedTag = data
            
            var getWidth: CGFloat = 0
            let getSize = NSString(string: getSelectedTag.title).size(withAttributes: [.font: UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.standartFont)) ?? UIFont.systemFont(ofSize: CGFloat(FontSettings.standartFont))])
            let width = getSize.width + CGFloat(65)
            var getHeight = CGFloat(FontSettings.standartFont + 20)
            getWidth = width
            
            if getWidth > ((collectionContext?.containerSize.width ?? UIScreen.main.bounds.width) - 20) {
                getWidth = (collectionContext?.containerSize.width ?? UIScreen.main.bounds.width) - 20
                getHeight = CGFloat(getSize.height * 3.5)
            }
            
            return CGSize(width: getWidth, height: getHeight)
        }
    }
    
    override func didSelectItem(at index: Int) {
        let data = listTag[index]
        if data.id != "head" {
            selectedTag?(data)
        }
    }
    
}
