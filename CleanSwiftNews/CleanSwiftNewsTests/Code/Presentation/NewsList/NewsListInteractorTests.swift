//
//  NewsListInteractorTests.swift
//  CleanSwiftNewsTests
//
//  Created by Andrei Ogorodnikov on 27/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov. All rights reserved.
//

import XCTest
@testable import CleanSwiftNews

final class NewsListInteractorTests: XCTestCase {

  // MARK: - Properties

  private var interactor: NewsListInteractor!
  private var presenter: MockNewsListPresenter!
  private var news = News.mockNews

  // MARK: - XCTestCase

  override func setUp() {
    super.setUp()
    presenter = MockNewsListPresenter()
    interactor = NewsListInteractor(presenter: presenter, newsService: FakeNewsService(news: news))
  }

  override func tearDown() {
    super.tearDown()
    interactor = nil
    presenter = nil
  }

  // MARK: - Tests

  func testPresentNewsCalled() {
    // Given
    let request = NewsList.FetchNews.Request()
    // When
    interactor.fetchNews(request: request)
    // Then
    XCTAssertEqual(presenter.presentNewsCalls, 1)
  }

  func testPresentNewsResponse() {
    // Given
    let expectedNews = news
    let request = NewsList.FetchNews.Request()
    // When
    interactor.fetchNews(request: request)
    // Then
    XCTAssertEqual(expectedNews, presenter.presentNewsResponse.news)
  }
}

private final class MockNewsListPresenter: NewsListPresentationLogic {

  // MARK: - Properties

  var presentNewsCalls = 0
  var presentNewsResponse: NewsList.FetchNews.Response!

  var presentSelectNewsCalls = 0
  var presentSelectNewsResponse: NewsList.SelectNews.Response!

  // MARK: - NewsListPresentationLogic

  func presentNews(response: NewsList.FetchNews.Response) {
    presentNewsCalls += 1
    presentNewsResponse = response
  }

  func presentSelectNews(response: NewsList.SelectNews.Response) {
    presentSelectNewsCalls += 1
    presentSelectNewsResponse = response
  }
}

private final class FakeNewsService: NewsService {

  // MARK: - Private Properties

  private var news: [News]

  // MARK: - Initialization

  init(news: [News]) {
    self.news = news
  }

  // MARK: - NewsService

  func news(completion: @escaping ([News]) -> Void) {
    completion(news)
  }
}
