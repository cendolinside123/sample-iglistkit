//
//  ArticleSourceViewHolder.swift
//  
//
//  Created by Jan Sebastian on 02/10/23.
//

import Foundation
import IGListKit


class ArticleSourceViewHolder: ListSectionController {
    private var articleData: [String: String] = [:]
    
    override func didUpdate(to object: Any) {
        if let getValue = object as? ArticleMapping,
           let getData = getValue.value as? ArticleData,
           getValue.type == .SourceArticle {
            let getPenulis = getData.author
            let getEditor = getData.publishedBy
            let getSumber = getData.source
            let listInfo = ["penulis": getPenulis,
                           "editor": getEditor,
                           "sumber": getSumber]
            articleData = listInfo.filter({$0.value != ""})
        }
    }
    
    override func numberOfItems() -> Int {
        return articleData.count
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        if index > articleData.count {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
        
        let getKeyIndex = articleData.index(articleData.startIndex, offsetBy: index)
        let getKey = articleData.keys[getKeyIndex]
        
        if getKey == "penulis" {
            guard let cell = collectionContext?.dequeueReusableCell(of: SourceArticlePenulisCollectionViewCell.self, for: self, at: index) as? SourceArticlePenulisCollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            if let getPenulis = articleData[getKey] {
                cell.setValue(namaPenulis: getPenulis)
                return cell
            } else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            
        } else if getKey == "editor" {
            guard let cell = collectionContext?.dequeueReusableCell(of: SourceArticleEditorCollectionViewCell.self, for: self, at: index) as? SourceArticleEditorCollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            if let getEditor = articleData[getKey] {
                cell.setValue(namaEditor: getEditor)
                return cell
            } else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
        } else if getKey == "sumber" {
            guard let cell = collectionContext?.dequeueReusableCell(of: SourceArticleSumberCollectionViewCell.self, for: self, at: index) as? SourceArticleSumberCollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            if let getSumber = articleData[getKey] {
                cell.setValue(namaSumber: getSumber)
                return cell
            } else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
        } else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        if index > articleData.count {
            return .zero
        }
        
        let getKeyIndex = articleData.index(articleData.startIndex, offsetBy: index)
        let getKey = articleData.keys[getKeyIndex]
        
        if getKey == "penulis" {
            if let getPenulis = articleData[getKey] {
                let namaPenulisSize = getPenulis.getSize(width: (UIScreen.main.bounds.width - 10), fontName: Constant.FontName.questrial, fontSize: FontSettings.smallFont)
                let totalHeight = (namaPenulisSize.height + CGFloat(FontSettings.smallFont * 2))
                return CGSize(width: collectionContext!.containerSize.width, height: totalHeight)
            } else {
                return .zero
            }
        } else if getKey == "editor" {
            if let getEditor = articleData[getKey] {
                let namaEditorSize = getEditor.getSize(width: (UIScreen.main.bounds.width - 10), fontName: Constant.FontName.questrial, fontSize: FontSettings.smallFont)
                let totalHeight = (namaEditorSize.height + CGFloat(FontSettings.smallFont * 2))
                return CGSize(width: collectionContext!.containerSize.width, height: totalHeight)
            } else {
                return .zero
            }
        } else if getKey == "sumber" {
            if let getSumber = articleData[getKey] {
                let namaSumberSize = getSumber.getSize(width: (UIScreen.main.bounds.width - 10), fontName: Constant.FontName.questrial, fontSize: FontSettings.smallFont)
                let totalHeight = (namaSumberSize.height + CGFloat(FontSettings.smallFont * 2))
                return CGSize(width: collectionContext!.containerSize.width, height: totalHeight)
            } else {
                return .zero
            }
        } else {
            return .zero
        }
    }
    
    
}
