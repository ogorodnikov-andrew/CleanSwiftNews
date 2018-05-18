//
//  NewsListRouter.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import UIKit

@objc protocol NewsListRoutingLogic {
  func routeToNewsDetails(segue: UIStoryboardSegue?)
}

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

  func routeToNewsDetails(segue: UIStoryboardSegue?) {
    guard
      let destination = segue?.destination as? NewsDetailsViewController,
      var destinationDataStore = destination.router?.dataStore
    else {
      return
    }
    passDataToNewsDetails(source: dataStore, destination: &destinationDataStore)
  }

  // MARK: - Navigation
  // MARK: - Passing data

  func passDataToNewsDetails(source: NewsListDataStore, destination: inout NewsDetailsDataStore) {
    destination.news = source.selectedNews
  }
}
