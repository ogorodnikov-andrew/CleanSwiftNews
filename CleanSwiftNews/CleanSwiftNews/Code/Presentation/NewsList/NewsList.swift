//
//  NewsList.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov All rights reserved.
//

import Foundation

enum NewsList {
  enum FetchNews {
    struct Request {}
    struct Response {
      let news: [News]
    }
    struct ViewModel {
      let displayedNews: [NewsViewModel]
    }
  }

  enum SelectNews {
    struct Request {
      let index: Int
    }
    struct Response {}
    struct ViewModel {}
  }
}
