//
//  NewsViewModel.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 15/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov. All rights reserved.
//

import Foundation

struct NewsViewModel: Equatable {
  let title: String
}

extension NewsViewModel {
  init(news: News) {
    title = news.title
  }
}
