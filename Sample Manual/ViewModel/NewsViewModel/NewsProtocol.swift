//
//  NewsProtocol.swift
//  
//
//  Created by Jan Sebastian on 23/01/23.
//

import Foundation

protocol NewsViewModel {
    associatedtype ContainerNewsModel
    var listNews: ContainerNewsModel? { get set }
    var processEnd: (() -> Void)? { get set }
    var siteLocation: String? { get set }
    var messageLocation: ((String) -> Void)? { get set }
    var onSucces: (() -> Void)? { get set }
    var onError: ((Error) -> Void)? { get set }
    func fetchNews(input: Any, site: String, _ reFetch: Bool)
    func toggleNotifAlert()
    func setLimitPage(limit: Int)
}

class DummyNewsViewModelImpl<T>: NewsViewModel {
    typealias ContainerNewsModel = T
    var listNews: T?
    
    var processEnd: (() -> Void)?
    
    var onSucces: (() -> Void)?
    
    var onError: ((Error) -> Void)?
    
    var messageLocation: ((String) -> Void)?
    
    var siteLocation: String?
    
    func fetchNews(input: Any, site: String, _ reFetch: Bool = false) {
        
    }
    
    func toggleNotifAlert() {
        
    }
    
    func setLimitPage(limit: Int) {
        
    }
}
