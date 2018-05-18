//
//  NewsDetailsPresenter.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 18/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import UIKit

protocol NewsDetailsPresentationLogic {
  func presentNewsDetails(response: NewsDetails.NewsDetails.Response)
}

class NewsDetailsPresenter: NewsDetailsPresentationLogic {

  typealias DisplayLogic = NewsDetailsDisplayLogic

  // MARK: - Properties

  weak var viewController: NewsDetailsDisplayLogic?

  // MARK: - Initialization

  init(viewController: NewsDetailsDisplayLogic) {
    self.viewController = viewController
  }

  // MARK: - NewsDetailsPresentationLogic

  func presentNewsDetails(response: NewsDetails.NewsDetails.Response) {
    let newsViewModel = NewsViewModel(news: response.news)
    let viewModel = NewsDetails.NewsDetails.ViewModel(newsViewModel: newsViewModel)
    viewController?.displayNewsDetails(viewModel: viewModel)
  }
}
