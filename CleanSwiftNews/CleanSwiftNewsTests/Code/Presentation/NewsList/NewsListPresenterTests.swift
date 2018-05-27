//
//  NewsListPresenterTests.swift
//  CleanSwiftNewsTests
//
//  Created by Andrei Ogorodnikov on 27/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov. All rights reserved.
//

import XCTest
@testable import CleanSwiftNews

final class NewsListPresenterTests: XCTestCase {

  // MARK: - Properties

  private var presenter: NewsListPresenter!
  private var viewController: MockNewsListViewController!
  private var news = News.mockNews

  // MARK: - XCTestCase

  override func setUp() {
    super.setUp()
    viewController = MockNewsListViewController()
    presenter = NewsListPresenter(viewController: viewController)
  }

  override func tearDown() {
    super.tearDown()
    presenter = nil
    viewController = nil
  }

  // MARK: - Tests

  func testDisplayNewsCalled() {
    // Given
    let response = NewsList.FetchNews.Response(news: news)
    // When
    presenter.presentNews(response: response)
    // Then
    XCTAssertEqual(viewController.displayNewsCalls, 1)
  }

  func testDisplayNewsViewModel() {
    // Given
    let expectedDisplaydNews = news.map(NewsViewModel.init(news:))
    let response = NewsList.FetchNews.Response(news: news)
    // When
    presenter.presentNews(response: response)
    // Then
    XCTAssertEqual(expectedDisplaydNews, viewController.displayNewsViewModel.displayedNews)
  }
}

private final class MockNewsListViewController: NewsListDisplayLogic {

  // MARK: - Properties

  var displayNewsCalls = 0
  var displayNewsViewModel: NewsList.FetchNews.ViewModel!

  var displaySelectNewsCalls = 0
  var displaySelectNewsViewModel: NewsList.SelectNews.ViewModel!

  // MARK: - NewsListDisplayLogic

  func displayNews(viewModel: NewsList.FetchNews.ViewModel) {
    displayNewsCalls += 1
    displayNewsViewModel = viewModel
  }

  func displaySelectNews(viewModel: NewsList.SelectNews.ViewModel) {
    displaySelectNewsCalls += 1
    displaySelectNewsViewModel = viewModel
  }
}
