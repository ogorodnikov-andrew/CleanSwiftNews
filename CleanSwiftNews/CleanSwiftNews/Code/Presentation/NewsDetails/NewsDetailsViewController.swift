//
//  NewsDetailsViewController.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 18/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import UIKit

protocol NewsDetailsDisplayLogic: AnyObject {
  func displayNewsDetails(viewModel: NewsDetails.NewsDetails.ViewModel)
}

final class NewsDetailsViewController: BaseModuleViewController {

  // MARK: - IBOutlets

  @IBOutlet var newsTitleLabel: UILabel!

  // MARK: - Properties

  var interactor: NewsDetailsBusinessLogic?
  var router: (NewsDetailsRoutingLogic & NewsDetailsDataPassing)?

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    interactor?.newsDetails(request: NewsDetails.NewsDetails.Request())
  }

  // MARK: - Assembly

  override func assembly() -> Assembly {
    return NewsDetailsAssemblyImpl()
  }
}

extension NewsDetailsViewController: NewsDetailsDisplayLogic {
  func displayNewsDetails(viewModel: NewsDetails.NewsDetails.ViewModel) {
    let newsTitle = viewModel.newsViewModel.title
    title = newsTitle
    newsTitleLabel.text = newsTitle
  }
}
