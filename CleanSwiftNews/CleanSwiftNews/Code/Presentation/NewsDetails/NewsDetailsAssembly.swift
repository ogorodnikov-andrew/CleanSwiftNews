//
//  NewsDetailsAssembly.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 18/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import UIKit

class NewsDetailsAssemblyImpl: Assembly {
  func configure(_ object: Any) {
    guard let viewController = object as? NewsDetailsViewController else {
      fatalError("Invalid view controller type")
    }
    let presenter = NewsDetailsPresenter(viewController: viewController)
    let interactor = NewsDetailsInteractor(presenter: presenter)
    viewController.interactor = interactor
    let router = NewsDetailsRouter(viewController: viewController, dataStore: interactor)
    viewController.router = router
    viewController.segueHandler = router
  }
}
