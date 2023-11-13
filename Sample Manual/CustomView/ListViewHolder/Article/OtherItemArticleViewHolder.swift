//
//  OtherItemArticleViewHolder.swift
//  
//
//  Created by Jan Sebastian on 03/10/23.
//

import Foundation
import IGListKit

class OtherItemArticleViewHolder: ListSectionController {
    private var item: Any?
    private var isLoading: Bool = false
    var toCommentPage: (() -> Void)?
    var loadNewNews: (() -> Void)?
    
    override func didUpdate(to object: Any) {
        if let getValue = object as? ArticleMapping,
           getValue.type == .OtherItem {
            self.item = getValue.value
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let item = self.item else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
        
        if let valueString = item as? String {
            if valueString == "header_comment" {
                return collectionContext!.dequeueReusableCell(of: KomenHeaderV2CollectionViewCell.self, for: self, at: index)
            } else if valueString == "footer_page" {
                return collectionContext!.dequeueReusableCell(of: FooterV2CollectionViewCell.self, for: self, at: index)
            } else if valueString == "baca_juga" {
                return collectionContext!.dequeueReusableCell(of: ReadNextHeaderV2CollectionViewCell.self, for: self, at: index)
            } else if valueString == "baca_juga_more" {
                guard let cell = collectionContext!.dequeueReusableCell(of: BtnLoadMoreV2CollectionViewCell.self, for: self, at: index) as? BtnLoadMoreV2CollectionViewCell else {
                    return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
                }
                if isLoading {
                    cell.showLoading()
                } else {
                    cell.hideLoading()
                }
                return cell
            } else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
        } else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let item = self.item else {
            return .zero
        }
        
        if let valueString = item as? String {
            if valueString == "header_comment" {
                return CGSize(width: collectionContext!.containerSize.width, height: CGFloat(KomenHeaderV2CollectionViewCell.height))
            } else if valueString == "footer_page" {
                return CGSize(width: collectionContext!.containerSize.width, height: CGFloat(150))
            } else if valueString == "baca_juga_more" {
                return CGSize(width: collectionContext!.containerSize.width, height: CGFloat(BtnLoadMoreV2CollectionViewCell.height))
            } else if valueString == "baca_juga" {
                return CGSize(width: collectionContext!.containerSize.width, height: CGFloat(ReadNextHeaderV2CollectionViewCell.height))
            } else {
                return .zero
            }
        } else {
            return .zero
        }
    }
    
    override func didSelectItem(at index: Int) {
        guard let item = self.item else {
            return
        }
        
        if let valueString = item as? String {
            if valueString == "baca_juga_more" {
                collectionContext?.performBatch(animated: true, updates: { [weak self] batchContext in
                    guard let superSelf = self else {
                        return
                    }
                    superSelf.isLoading.toggle()
                    batchContext.reload(superSelf)
                }, completion: { [weak self] _ in
                    self?.loadNewNews?()
                })
            }
        }
    }
    
}
