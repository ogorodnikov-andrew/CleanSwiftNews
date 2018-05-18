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
  func selectNews(request: NewsList.SelectNews.Request)
}

protocol NewsListDataStore {
  var selectedNews: News? { get set }
}

class NewsListInteractor: NewsListBusinessLogic, NewsListDataStore {

  // MARK: - Properties

  let presenter: NewsListPresentationLogic
  let newsService: NewsService
  var news: [News] = []

  // MARK: - NewsListDataStore

  var selectedNews: News?

  // MARK: - Initialization

  init(presenter: NewsListPresentationLogic, newsService: NewsService) {
    self.presenter = presenter
    self.newsService = newsService
  }

  // MARK: - NewsListBusinessLogic

  func fetchNews(request: NewsList.FetchNews.Request) {
    newsService.news { [weak self] news in
      self?.news = news
      let response = NewsList.FetchNews.Response(news: news)
      self?.presenter.presentNews(response: response)
    }
  }

  func selectNews(request: NewsList.SelectNews.Request) {
    selectedNews = news[request.index]
    presenter.presentSelectNews(response: NewsList.SelectNews.Response())
  }
}
