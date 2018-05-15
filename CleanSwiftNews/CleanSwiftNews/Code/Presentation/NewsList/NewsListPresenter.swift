//
//  NewsListPresenter.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import UIKit

protocol NewsListPresentationLogic {}

class NewsListPresenter: NewsListPresentationLogic {

  // MARK: - Properties

  weak var viewController: NewsListDisplayLogic?

  // MARK: - Initialization

  init(viewController: NewsListDisplayLogic) {
    self.viewController = viewController
  }

  // MARK: - NewsListPresentationLogic
}
