//
//  UITableView+Dequeueing.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 15/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov. All rights reserved.
//

import UIKit

extension UITableViewCell: ReusableView {}

extension UITableView {
  func register<CellType: UITableViewCell>(_: CellType.Type) {
    register(CellType.self, forCellReuseIdentifier: CellType.reuseIdentifier)
  }

  func dequeue<CellType: UITableViewCell>(for indexPath: IndexPath) -> CellType {
    guard let cell = dequeueReusableCell(withIdentifier: CellType.reuseIdentifier, for: indexPath) as? CellType else {
      fatalError("Could not dequeue cell with identifier: \(CellType.reuseIdentifier)")
    }
    return cell
  }
}
