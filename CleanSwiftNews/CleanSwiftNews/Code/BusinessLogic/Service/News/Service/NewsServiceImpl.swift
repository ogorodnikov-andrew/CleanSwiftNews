//
//  NewsServiceImpl.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 15/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov. All rights reserved.
//

import Foundation

final class NewsServiceImpl: NewsService {
  func news(completion: @escaping ([News]) -> Void) {
    completion(News.mockNews)
  }
}
