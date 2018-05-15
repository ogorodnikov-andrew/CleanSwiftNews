//
//  NewsListInteractor.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import Foundation

protocol NewsListBusinessLogic {}

protocol NewsListDataStore {}

class NewsListInteractor: NewsListBusinessLogic, NewsListDataStore {

  // MARK: - Properties

  let presenter: NewsListPresentationLogic

  // MARK: - NewsListDataStore
  // MARK: - Initialization

  init(presenter: NewsListPresentationLogic) {
    self.presenter = presenter
  }

  // MARK: - NewsListBusinessLogic
}
