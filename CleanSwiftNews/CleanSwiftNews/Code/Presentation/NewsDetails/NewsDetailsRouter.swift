//
//  NewsDetailsRouter.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 18/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import UIKit

@objc protocol NewsDetailsRoutingLogic {}

protocol NewsDetailsDataPassing {
  var dataStore: NewsDetailsDataStore { get }
}

@objc class NewsDetailsRouter: NSObject, NewsDetailsRoutingLogic, NewsDetailsDataPassing {

  // MARK: - Properties

  weak var viewController: NewsDetailsViewController?

  // MARK: - NewsDetailsDataPassing

  var dataStore: NewsDetailsDataStore

  // MARK: - Initialization

  init(viewController: NewsDetailsViewController, dataStore: NewsDetailsDataStore) {
    self.viewController = viewController
    self.dataStore = dataStore
    super.init()
  }

  // MARK: - Routing
  // MARK: - Navigation
  // MARK: - Passing data
}
