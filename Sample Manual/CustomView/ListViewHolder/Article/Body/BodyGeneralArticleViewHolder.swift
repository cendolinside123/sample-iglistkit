//
//  BodyGeneralArticleViewHolder.swift
//  
//
//  Created by Jan Sebastian on 29/09/23.
//

import Foundation
import IGListKit

class BodyGeneralArticleViewHolder: ListSectionController {
    private var articleData: LineDesc?
    
    
    override func didUpdate(to object: Any) {
        if let getValue = object as? ArticleMapping,
           let getData = getValue.value as? LineDesc,
           getValue.type == .Body,
           (getData.type == .paragraph
            || getData.type == .iFrame
            || getData.type == .ads) {
            articleData = getData
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let articleData = articleData else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
        
        if articleData.type == .paragraph {
            guard let cell = collectionContext?.dequeueReusableCell(of: ParagraphV2CollectionViewCell.self, for: self, at: index) as? ParagraphV2CollectionViewCell else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
            
            cell.setValue(value: articleData)
            
            cell.cickableURL = { [weak self] url in
                print("click an URL \(url)")
                
                guard let superSelf = self else {
                    return
                }
                
                
            }
            return cell
        } else if articleData.type == .iFrame {
            if let url = URL(string: articleData.link) {
                guard let cell = collectionContext?.dequeueReusableCell(of: InstagramV2CollectionViewCell.self, for: self, at: index) as? InstagramV2CollectionViewCell else {
                    return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
                }
                cell.setValue(value: articleData)
                return cell
                
            } else {
                return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
            }
        } else if articleData.type == .ads {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        } else {
            return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        }
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let articleData = articleData else {
            return .zero
        }
        
        if articleData.type == .paragraph {
            
            /* UIScreen.main.bounds.width - 30 is just a estimate calculate of width size.
             
             constraint left UITextView = 5
             constraint right UITextView = 5
             
             left padding of UITextView = (I dont have actual size, so I set it to 10)
             right padding of UITextView = (I dont have actual size, so I set it to 10)
             
             
             UIScreen.main.bounds.width - (( (constraint left UITextView) + (constraint right UITextView) ) + ((left padding of UITextView) + (right padding of UITextView)))
             
             
             UPDATE:
             
             after some research I found some better way to calculate
             
             so on UITextView inside ParagraphV2CollectionViewCell I set:
             
             
             label.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
             label.textContainer.lineFragmentPadding = 0
             
             
             so I don't need to the width result is:
             
             UIScreen.main.bounds.width - 30
             
             constraint left UITextView = 5
             constraint right UITextView = 5
             
             UIScreen.main.bounds.width - ( (constraint left UITextView) + (constraint right UITextView) )
             
             the result of boundingRect height I doing calculate
             
             constraint top UITextView = 5
             constraint bottom UITextView = 5
             
             
             (boundingRect height) + ( (constraint top UITextView) + (constraint bottom UITextView) )
             
             */
            
            if let height = articleData.size?.height {
                return CGSize(width: collectionContext!.containerSize.width, height: height + 10)
            } else {
                let getSizeTitle = NSString(string: articleData.text).boundingRect(with: CGSize(width: (UIScreen.main.bounds.width - 10), height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: UIFont(name: Constant.FontName.questrial, size: CGFloat(FontSettings.standartFont))!], context: nil)
                return CGSize(width: collectionContext!.containerSize.width, height: getSizeTitle.height + 10)
            }
            
            
        } else if articleData.type == .iFrame {
            if let url = URL(string: articleData.link) {
                return CGSize(width: collectionContext!.containerSize.width, height: CGFloat(InstagramV2CollectionViewCell.height))
                
            } else {
                return .zero
            }
        } else if articleData.type == .ads {
            return .zero
        } else {
            return .zero
        }
    }
}
