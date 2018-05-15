//
//  NewsListViewController.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import UIKit

protocol NewsListDisplayLogic: AnyObject {}

final class NewsListViewController: BaseModuleViewController {

  // MARK: - Properties

  var interactor: NewsListBusinessLogic?
  var router: (NewsListRoutingLogic & NewsListDataPassing)?

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Assembly

  override func assembly() -> Assembly {
    return NewsListAssembly()
  }
}

extension NewsListViewController: NewsListDisplayLogic {}
