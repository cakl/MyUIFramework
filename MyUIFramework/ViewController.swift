//
//  ViewController.swift
//  MyUIFramework
//
//  Created by sbo on 14.01.24.
//

import Foundation
import UIKit
@_implementationOnly import Inject


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = .red
    }
    
    func presentChildVC() {
        let childVC = Inject.ViewControllerHost(ChildViewController())
        present(childVC, animated: false)
    }
    
}

class ChildViewController: UIViewController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = .red
    }
    
}
