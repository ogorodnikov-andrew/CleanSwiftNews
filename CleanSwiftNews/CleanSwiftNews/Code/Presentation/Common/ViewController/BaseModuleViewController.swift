//
//  BaseModuleViewController.swift
//  CleanSwiftNews
//
//  Created by Andrei Ogorodnikov on 14/05/2018.
//  Copyright © 2018 Andrei Ogorodnikov. All rights reserved.
//

import UIKit

/// Base class for clean swift module view controllers.
/// Clean swift module view controllers should inherit from this class to support module configuration.
class BaseModuleViewController: UIViewController {

  // MARK: Initialization

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    assembly().configure(self)
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    assembly().configure(self)
  }

  // MARK: - Assembly

  /// Provides an instance of module assembly used for configuring the module.
  /// The default implementation of this method crashes with fatal error.
  /// Clean swift module view controllers should override this method and return an instance of module assembly.
  ///
  /// - Returns: Module configurator instance.
  func assembly() -> Assembly {
    fatalError("Modules should override assembly() to return module assembly instance")
  }
}
