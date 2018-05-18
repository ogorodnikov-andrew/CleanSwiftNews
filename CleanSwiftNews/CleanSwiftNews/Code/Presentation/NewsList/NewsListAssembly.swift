//
//  NewsListConfigurator.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import Foundation

class NewsListAssembly: Assembly {
  func configure(_ object: Any) {
    guard let viewController = object as? NewsListViewController else {
      fatalError("Invalid view controller type")
    }
    let presenter = NewsListPresenter(viewController: viewController)
    let newsService = NewsServiceImpl()
    let interactor = NewsListInteractor(presenter: presenter, newsService: newsService)
    viewController.interactor = interactor
    let router = NewsListRouter(viewController: viewController, dataStore: interactor)
    viewController.router = router
    viewController.segueHandler = router
  }
}
