//
//  BacaJugaViewHolder.swift
//  
//
//  Created by Jan Sebastian on 02/10/23.
//

import Foundation
import IGListKit

class BacaJugaViewHolder: ListSectionController {
    private var itemNews: LatestModel?
    
    override init() {
        super.init()
//        displayDelegate = self
    }
    
    override func didUpdate(to object: Any) {
        if let getValue = object as? ArticleMapping,
           let getData = getValue.value as? LatestModel,
           getValue.type == .BacaJuga {
            itemNews = getData
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let itemNews = self.itemNews else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
        
        guard let cell = collectionContext?.dequeueReusableCell(of: NewsCollectionViewCell.self, for: self, at: index) as? NewsCollectionViewCell else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
        
        cell.setValue(value: itemNews)
        
        cell.topikClicked = { [weak self] in
            guard let superSelf = self else {
                return
            }
            
        }
        
        cell.btnMoreClick = { [weak self] in
            
        }
        
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let _ = self.itemNews else {
            return .zero
        }
        
        if !DeviceType.current.isIPad {
            return CGSize(width: collectionContext!.containerSize.width, height: CGFloat(NewsCollectionViewCell.height))
        } else {
            return CGSize(width: (collectionContext!.containerSize.width / 2), height: CGFloat(NewsCollectionViewCell.height))
        }
    }
    
    override func didSelectItem(at index: Int) {
        
        guard let getItem = self.itemNews else {
            return
        }
        
        
    }
}
