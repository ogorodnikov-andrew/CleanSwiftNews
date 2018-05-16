//
//  NewsListInteractor.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import Foundation

protocol NewsListBusinessLogic {
  func fetchNews(request: NewsList.FetchNews.Request)
}

protocol NewsListDataStore {}

class NewsListInteractor: NewsListBusinessLogic, NewsListDataStore {

  // MARK: - Properties

  let presenter: NewsListPresentationLogic
  let newsService: NewsService

  // MARK: - NewsListDataStore
  // MARK: - Initialization

  init(presenter: NewsListPresentationLogic, newsService: NewsService) {
    self.presenter = presenter
    self.newsService = newsService
  }

  // MARK: - NewsListBusinessLogic

  func fetchNews(request: NewsList.FetchNews.Request) {
    newsService.news { [weak self] news in
      let response = NewsList.FetchNews.Response(news: news)
      self?.presenter.presentNews(response: response)
    }
  }
}
