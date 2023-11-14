//
//  DetailViewController.swift
//  Sample Manual
//
//  Created by Jan Sebastian on 12/10/23.
//

import UIKit
import Kingfisher
import IGListKit
import PKHUD

class DetailViewController: UIViewController {
    
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    private let colectionContent: UICollectionView = {
        let layoutV2 = ListCollectionViewLayout(stickyHeaders: false, scrollDirection: .vertical, topContentInset: 0, stretchToEdge: false)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical

        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutV2)
        collectionView.backgroundColor = UIColor(white: 1, alpha: 0.01)
        
        collectionView.bounces = false
        return collectionView
    }()
    
    private var viewModel: DummyArticleViewModelImpl<ArticleData> = ArticleViewModelImpl()
    private var viewModelListNews: DummyNewsViewModelImpl<[LatestModel]> = NewsViewModelImpl()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupConstraints()
        setListener()
        
        
        adapter.collectionView = colectionContent
        adapter.dataSource = self
        
        HUD.show(.progress, onView: self.view)
        viewModel.loadArticle()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(colectionContent)
    }
    
    private func setupConstraints() {
        let views: [String: Any] = [
                                    "colectionContent": colectionContent
        ]
        
        var constraints: [NSLayoutConstraint] = []
        
        colectionContent.translatesAutoresizingMaskIntoConstraints = false
        let v_colectionContent = "V:|-[colectionContent]-|"
        let h_colectionContent = "H:|-1-[colectionContent]-1-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: h_colectionContent, options: .alignAllTop, metrics: [:], views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: v_colectionContent, options: .alignAllLeading, metrics: [:], views: views)
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setListener() {
        viewModel.onSucces = { [weak self] in
            HUD.hide()
            self?.viewModelListNews.listNews = self?.viewModel.contentComponent?.listBacaLagi
            self?.adapter.performUpdates(animated: true)
        }
        
        viewModelListNews.onSucces = { [weak self] in
            self?.adapter.performUpdates(animated: true)
        }
    }
    
}

extension DetailViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        
        var listData: [ListDiffable] = []
        
        if let getContent = viewModel.contentComponent {
            listData.append(ArticleMapping(value: getContent, type: .Title))
            
            listData += getContent
                .content
                .map({ (item) -> ArticleMapping in
                    return ArticleMapping(value: item, type: .Body)
            })
            
            listData.append(ArticleMapping(value: getContent, type: .SourceArticle))
            
            if let listTag = viewModel.contentComponent?.tag {
                listData.append(ArticleMapping(value: listTag, type: .Tags))
            }
            listData.append(ArticleMapping(value: "baca_juga", type: .OtherItem))
            if let listNews = viewModelListNews.listNews,
                listNews.count > 0 {
                
                listData += listNews.map({ (item) -> ArticleMapping in
                    return ArticleMapping(value: item, type: .BacaJuga)
                })
            }
            listData.append(ArticleMapping(value: "baca_juga_more", type: .OtherItem))
            listData.append(ArticleMapping(value: "footer_page", type: .OtherItem))
        }
        
        return listData
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let getData = object as? ArticleMapping {
            if getData.type == .Title {
                return TitleArticleViewHolder()
            } else if getData.type == .Body {
                if let getValue = getData.value as? LineDesc {
                    if getValue.type == .picture {
                        let bodyPic = BodyPictureArticleViewHolder()
                        
                        return bodyPic
                    } else if getValue.type == .reference {
                        return BodyReferenceArticleViewHolder()
                    } else {
                        return BodyGeneralArticleViewHolder()
                    }
                } else {
                    return ListSectionController()
                }
            } else if getData.type == .SourceArticle {
                return ArticleSourceViewHolder()
            } else if getData.type == .Tags {
                let tagViewHolder = TagArticleViewHolder()
                
                tagViewHolder.selectedTag = { [weak self] tag in
                    guard let superSelf = self else {
                        return
                    }
                    
                    
                }
                
                return tagViewHolder
            } else if getData.type == .OtherItem {
                let cell = OtherItemArticleViewHolder()
                
                cell.toCommentPage = { [weak self] in
                    
                }
                
                cell.loadNewNews = { [weak self] in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
                        self?.viewModelListNews.fetchNews(input: "", site: "")
                    })
                }
                
                return cell
            } else if getData.type == .BacaJuga {
                return BacaJugaViewHolder()
            } else {
                return ListSectionController()
            }
        } else {
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}
