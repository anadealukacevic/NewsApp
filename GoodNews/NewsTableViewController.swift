//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Anadea Lukačević on 20/01/2021.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    let identifier = "cell"
    let disposeBag = DisposeBag()
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Good news"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: identifier)
        populateNews()
    }
    
    private func populateNews() {
        URLRequest.load(resource: ArticlesList.all).subscribe(onNext: { [weak self] result in
            if let result = result {
                self?.articles = result.articles
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }).disposed(by: disposeBag)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ArticleTableViewCell else { fatalError("cell does not exist") }
        cell.titleLabel.text = self.articles[indexPath.row].title
        cell.descriptionLabel.text = self.articles[indexPath.row].description
        return cell
    }
}
