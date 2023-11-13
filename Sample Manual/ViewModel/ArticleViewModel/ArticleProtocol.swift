//
//  ArticleProtocol.swift
//  Jan Sebastian Tatang
//
//  Created by Jan Sebastian on 19/01/23.
//

import Foundation
protocol ArticleViewModel {
    associatedtype ContainerArticle
    var contentComponent: ContainerArticle? { get set }
    var isBookmark: Bool { get set }
    var onSucces: (() -> Void)? { get set }
    var onError: ((Error) -> Void)? { get set }
    func loadArticle()
}

class DummyArticleViewModelImpl<T>: ArticleViewModel {
    typealias ContainerArticle = T
    var contentComponent: T?
    var isBookmark: Bool = false
    
    var onSucces: (() -> Void)?
    
    var onError: ((Error) -> Void)?
    
    func loadArticle() {
        
    }
    
}
