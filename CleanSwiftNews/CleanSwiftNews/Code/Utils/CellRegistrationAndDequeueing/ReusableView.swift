//
//  ReusableView.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 15/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov. All rights reserved.
//

import UIKit

// https://gist.github.com/andreaantonioni/0a8e7b07e7d62ade71a4a05bdb6367bf
protocol ReusableView: class {
  static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
  static var reuseIdentifier: String {
    return String(describing: Self.self)
  }
}
