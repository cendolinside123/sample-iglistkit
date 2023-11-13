//
//  BodyReferenceArticleViewHolder.swift
//  
//
//  Created by Jan Sebastian on 02/10/23.
//

import Foundation
import IGListKit


class BodyReferenceArticleViewHolder: ListSectionController {
    private var articleData: LineDesc?
    
    
    override func didUpdate(to object: Any) {
        if let getValue = object as? ArticleMapping,
           let getData = getValue.value as? LineDesc,
           getValue.type == .Body,
           (getData.type == .reference) {
            articleData = getData
        }
    }
    
    override func numberOfItems() -> Int {
        guard let getData = articleData,
                getData.type == .reference else {
            return 0
        }
        return 2
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let articleData = articleData else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
        
        if index == 0 {
            guard let cell = collectionContext?.dequeueReusableCell(of: LabelBacaJugaCollectionViewCell.self, for: self, at: index) as? LabelBacaJugaCollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            cell.setValue(value: articleData)
            return cell
        } else if index == 1 {
            guard let cell = collectionContext?.dequeueReusableCell(of: ButtonLinkCollectionViewCell.self, for: self, at: index) as? ButtonLinkCollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            cell.setValue(value: articleData)
            
            cell.sendLink = { [weak self] url in
                
            }
            
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
            return CGSize(width: collectionContext!.containerSize.width, height: CGFloat((10 + FontSettings.standartFont)))
        } else if index == 1 {
            let getSizeTitle = NSString(string: articleData.text).boundingRect(with: CGSize(width: (UIScreen.main.bounds.width - 10), height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [.font: UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.standartFont))!], context: nil)
            return CGSize(width: collectionContext!.containerSize.width, height: getSizeTitle.height + CGFloat((2 * FontSettings.standartFont)))
        } else {
            return .zero
        }
        
    }
}
