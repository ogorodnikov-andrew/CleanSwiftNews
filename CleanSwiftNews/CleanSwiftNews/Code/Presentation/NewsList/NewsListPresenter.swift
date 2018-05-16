//
//  NewsListPresenter.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import UIKit

protocol NewsListPresentationLogic {
  func presentNews(response: NewsList.FetchNews.Response)
}

class NewsListPresenter: NewsListPresentationLogic {

  // MARK: - Properties

  weak var viewController: NewsListDisplayLogic?

  // MARK: - Initialization

  init(viewController: NewsListDisplayLogic) {
    self.viewController = viewController
  }

  // MARK: - NewsListPresentationLogic

  func presentNews(response: NewsList.FetchNews.Response) {
    let displayedNews = response.news.map(NewsViewModel.init(news:))
    let viewModel = NewsList.FetchNews.ViewModel(displayedNews: displayedNews)
    viewController?.displayNews(viewModel: viewModel)
  }
}
