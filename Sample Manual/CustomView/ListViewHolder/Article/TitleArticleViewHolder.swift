//
//  TitleArticleViewHolder.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import Foundation
import IGListKit


class TitleArticleViewHolder: ListSectionController {
    var articleData: ArticleData?
    
    override func didUpdate(to object: Any) {
        if let getValue = object as? ArticleMapping,
           let getData = getValue.value as? ArticleData,
            getValue.type == .Title {
            articleData = getData
        }
    }
    
    override func numberOfItems() -> Int {
        if let _ = articleData {
            return 2
        } else {
            return 0
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let articleData = articleData else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
        
        if index == 0 {
            guard let cell = collectionContext!.dequeueReusableCell(of: TitleArticleCollectionViewCell.self, for: self, at: index) as? TitleArticleCollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            cell.setValue(value: articleData)
            return cell
        } else if index == 1 {
            guard let cell = collectionContext!.dequeueReusableCell(of: TimeArticleCollectionViewCell.self, for: self, at: index) as? TimeArticleCollectionViewCell else {
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
        
        /*
         
         fix title height confogure
         
         1. I fix lblTitleLabel by remove buttom constraint contraint setup for remove top and bottom space, because I dont find information about the size of top and bottom space:
         (
                https://stackoverflow.com/questions/1054558/vertically-align-text-to-top-within-a-uilabel ,
                https://stackoverflow.com/a/1054681/6734130
         )
         
         2. fix width size input for better boundingRect calculation
         
         3. (boundingRect height) + (top constraint lblTitleLabel)
         
         */
        
        if index == 0 {
            let getSizeTitle = NSString(string: articleData.title).boundingRect(with: CGSize(width: (UIScreen.main.bounds.width - 10), height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [.font: UIFont(name: Constant.FontName.CrimsonTextBold, size: CGFloat(FontSettings.titleFont))!], context: nil)
            return CGSize(width: collectionContext!.containerSize.width, height: getSizeTitle.height + 5)
        } else if index == 1 {
            return CGSize(width: collectionContext!.containerSize.width, height: CGFloat(TimeArticleCollectionViewCell.height))
        } else {
            return .zero
        }
    }
}
