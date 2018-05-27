//
//  NewsListViewControllerTests.swift
//  CleanSwiftNewsTests
//
//  Created by Andrei Ogorodnikov on 27/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov. All rights reserved.
//

import XCTest
@testable import CleanSwiftNews

final class NewsListViewControllerTests: XCTestCase {

  // MARK: - Properties

  private var viewController: NewsListViewController!
  private var displayedNews = News.mockNews.map(NewsViewModel.init(news:))

  // MARK: - XCTestCase

  override func setUp() {
    super.setUp()
    let storyboard = UIStoryboard(name: String(describing: NewsList.self), bundle: nil)
    let identifier = String(describing: NewsListViewController.self)
    viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? NewsListViewController
    _ = viewController.view
  }

  override func tearDown() {
    super.tearDown()
    viewController = nil
  }

  // MARK: - Tests

  func testDisplayNews() {
    // Given
    let expectedDisplayedNews = displayedNews
    let viewModel = NewsList.FetchNews.ViewModel(displayedNews: expectedDisplayedNews)
    // When
    viewController.displayNews(viewModel: viewModel)
    // Then
    XCTAssertEqual(expectedDisplayedNews, viewController.displayedNews)
    XCTAssertEqual(viewController.tableView.numberOfRows(inSection: 0), displayedNews.count)
  }
}
