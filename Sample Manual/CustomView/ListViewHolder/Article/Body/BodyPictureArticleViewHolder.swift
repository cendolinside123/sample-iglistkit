//
//  BodyPictureArticleViewHolder.swift
//  
//
//  Created by Jan Sebastian on 02/10/23.
//

import Foundation
import IGListKit

class BodyPictureArticleViewHolder: ListSectionController {
    
    private var articleData: LineDesc?
    
    override init() {
        super.init()
    }
    
    
    override func didUpdate(to object: Any) {
        if let getValue = object as? ArticleMapping,
           let getData = getValue.value as? LineDesc,
           getValue.type == .Body,
           (getData.type == .picture) {
            articleData = getData
        }
    }
    
    override func numberOfItems() -> Int {
        guard let getData = articleData,
                getData.type == .picture else {
            return 0
        }
        return 2
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let articleData = articleData else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
        
        if index == 0 {
            guard let cell = collectionContext?.dequeueReusableCell(of: ImageArticlePartCollectionViewCell.self, for: self, at: index) as? ImageArticlePartCollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            cell.setValue(value: articleData)
            return cell
        } else if index == 1 {
            guard let cell = collectionContext?.dequeueReusableCell(of: KeteranganImagePartCollectionViewCell.self, for: self, at: index) as? KeteranganImagePartCollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            cell.setValue(value: articleData)
            return cell
        } else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let articleData = articleData else {
            return .zero
        }
        
        if index == 0 {
            return CGSize(width: collectionContext!.containerSize.width, height: CGFloat(ImageArticlePartCollectionViewCell.height))
        } else if index == 1 {
            if !DeviceType.current.isIPad {
                let getSizeTitle = NSString(string: articleData.child?.text ?? "").boundingRect(with: CGSize(width: (UIScreen.main.bounds.width - 10), height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.italicSystemFont(ofSize: 12)], context: nil)
                return CGSize(width: collectionContext!.containerSize.width, height: getSizeTitle.height + 5)
            } else {
                let getSizeTitle = NSString(string: articleData.child?.text ?? "").boundingRect(with: CGSize(width: (UIScreen.main.bounds.width - 10), height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.italicSystemFont(ofSize: 20)], context: nil)
                return CGSize(width: collectionContext!.containerSize.width, height: getSizeTitle.height + 5)
            }
        } else {
            return .zero
        }
        
    }
    
    override func didSelectItem(at index: Int) {
        guard let articleData = articleData else {
            return
        }
        
        if index == 0 {
            
        }
        
    }
    
}

