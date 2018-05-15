//
//  NewsListRouter.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import UIKit

@objc protocol NewsListRoutingLogic {}

protocol NewsListDataPassing {
  var dataStore: NewsListDataStore { get }
}

@objc class NewsListRouter: NSObject, NewsListRoutingLogic, NewsListDataPassing {

  // MARK: - Properties

  weak var viewController: NewsListViewController?

  // MARK: - NewsListDataPassing

  var dataStore: NewsListDataStore

  // MARK: - Initialization

  init(viewController: NewsListViewController, dataStore: NewsListDataStore) {
    self.viewController = viewController
    self.dataStore = dataStore
    super.init()
  }

  // MARK: - Routing
  // MARK: - Navigation
  // MARK: - Passing data
}
