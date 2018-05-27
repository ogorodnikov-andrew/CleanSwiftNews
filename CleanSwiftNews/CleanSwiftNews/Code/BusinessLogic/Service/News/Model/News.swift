//
//  News.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 15/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov. All rights reserved.
//

import Foundation

struct News: Equatable {
  let title: String
}

extension News {
  static var mockNews: [News] {
    return (1...50).map { return News(title: "News Title \($0)") }
  }
}
