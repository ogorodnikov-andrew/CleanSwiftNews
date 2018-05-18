//
//  NewsDetailsInteractor.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 18/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import Foundation

protocol NewsDetailsBusinessLogic {
  func newsDetails(request: NewsDetails.NewsDetails.Request)
}

protocol NewsDetailsDataStore {
  var news: News? { get set }
}

class NewsDetailsInteractor: NewsDetailsBusinessLogic, NewsDetailsDataStore {

  // MARK: - Properties

  private let presenter: NewsDetailsPresentationLogic

  // MARK: - NewsDetailsDataStore

  var news: News?

  // MARK: - Initialization

  init(presenter: NewsDetailsPresentationLogic) {
    self.presenter = presenter
  }

  // MARK: - NewsDetailsBusinessLogic

  func newsDetails(request: NewsDetails.NewsDetails.Request) {
    guard let news = news else {
      return
    }
    let response = NewsDetails.NewsDetails.Response(news: news)
    presenter.presentNewsDetails(response: response)
  }
}
