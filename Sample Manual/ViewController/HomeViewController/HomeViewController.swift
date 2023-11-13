//
//  HomeViewController.swift
//  Sample Manual
//
//  Created by Jan Sebastian on 13/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let btnAticle: UIButton = {
        let button = UIButton()
        button.setTitle("To Article", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        btnAticle.translatesAutoresizingMaskIntoConstraints = false
        btnAticle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        btnAticle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        btnAticle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btnAticle.heightAnchor.constraint(equalToConstant: 25).isActive = true
        setupAction()
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
        self.view.addSubview(btnAticle)
    }
    
    private func setupAction() {
        btnAticle.addTarget(self, action: #selector(toArticlePage), for: .touchDown)
    }
    
    @objc private func toArticlePage() {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
