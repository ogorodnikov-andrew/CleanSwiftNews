//
//  NewsService.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 15/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov. All rights reserved.
//

import Foundation

protocol NewsService {
  func news(completion: @escaping ([News]) -> Void)
}
