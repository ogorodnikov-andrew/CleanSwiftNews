//
//  NewsListViewController.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import UIKit

protocol NewsListDisplayLogic: AnyObject {
  func displayNews(viewModel: NewsList.FetchNews.ViewModel)
}

final class NewsListViewController: BaseModuleViewController {

  // MARK: - IBOutlets

  @IBOutlet var tableView: UITableView!

  // MARK: - Properties

  var interactor: NewsListBusinessLogic?
  var router: (NewsListRoutingLogic & NewsListDataPassing)?
  var displayedNews: [NewsViewModel] = []

  // MARK: - Assembly

  override func assembly() -> Assembly {
    return NewsListAssembly()
  }

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    interactor?.fetchNews(request: NewsList.FetchNews.Request())
  }

  // MARK: - Private Helpers

  private func setupTableView() {
    tableView.register(UITableViewCell.self)
  }
}

extension NewsListViewController: NewsListDisplayLogic {
  func displayNews(viewModel: NewsList.FetchNews.ViewModel) {
    self.displayedNews = viewModel.displayedNews
    tableView.reloadData()
  }
}

extension NewsListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return displayedNews.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeue(for: indexPath)
    cell.textLabel?.text = displayedNews[indexPath.row].title
    return cell
  }
}

extension NewsListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
