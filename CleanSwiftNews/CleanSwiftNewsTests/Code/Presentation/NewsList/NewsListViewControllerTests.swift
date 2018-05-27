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
  private var interactor: MockNewsListInteractor!
  private var displayedNews = News.mockNews.map(NewsViewModel.init(news:))

  // MARK: - XCTestCase

  override func setUp() {
    super.setUp()
    interactor = MockNewsListInteractor()
    let storyboard = UIStoryboard(name: String(describing: NewsList.self), bundle: nil)
    let identifier = String(describing: NewsListViewController.self)
    viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? NewsListViewController
    viewController.interactor = interactor
    _ = viewController.view
  }

  override func tearDown() {
    super.tearDown()
    viewController = nil
    interactor = nil
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

  func testFetchNewsCalledOnLoad() {
    // Given
    // When
    // Then
    XCTAssertEqual(interactor.fetchNewsCalls, 1)
  }

  func testSelectNewsCalledOnCellSelection() {
    // Given
    let indexPath = IndexPath(row: 0, section: 0)
    // When
    viewController.tableView.delegate?.tableView?(viewController.tableView, didSelectRowAt: indexPath)
    // Then
    XCTAssertEqual(interactor.selectNewsCalls, 1)
  }
}

private final class MockNewsListInteractor: NewsListBusinessLogic {

  // MARK: - Properties

  var fetchNewsCalls = 0
  var fetchNewsRequest: NewsList.FetchNews.Request!

  var selectNewsCalls = 0
  var selectNewsRequest: NewsList.SelectNews.Request!

  // MARK: - NewsListBusinessLogic

  func fetchNews(request: NewsList.FetchNews.Request) {
    fetchNewsCalls += 1
    fetchNewsRequest = request
  }

  func selectNews(request: NewsList.SelectNews.Request) {
    selectNewsCalls += 1
    selectNewsRequest = request
  }
}
