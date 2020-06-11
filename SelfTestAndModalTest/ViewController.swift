//
//  ViewController.swift
//  SelfTestAndModalTest
//
//  Created by 김재한 on 2020/06/11.
//  Copyright © 2020 jay. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    var action: (() -> Void)?
    var a: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


//MARK: - IB Actions
extension ViewController {
    @IBAction func push() {
        let newVC = UIViewController.viewControllerFromMainStoryboard(identifier: ViewController.storyboardIdentifier)
        if let nav = self.navigationController {
            nav.pushViewController(newVC, animated: true)
        }
    }
    
    @IBAction func modal() {
        let newVC = UIViewController.viewControllerFromMainStoryboard(identifier: ViewController.storyboardIdentifier)
        let nav = UINavigationController(rootViewController: newVC)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true) {
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                self.process { (value) in
                    self.a += value
                    print("a is : \(self.a)")
                }
            }
        }

    }
    
    @IBAction func dismissToRoot() {
        var targetVC = self
        var rootVC: UIViewController? = targetVC
        
        while let presentingVC = rootVC?.presentingViewController {
            rootVC = presentingVC
        }
        
        if let finalRootVC = rootVC {
            finalRootVC.dismiss(animated: true) {
                
            }
        }
        
    }
    
    func doSomething(then: @escaping () -> Void) {
        then()
        
    }
    
    func printPapa() {
        print("papa")
    }
    
    func process(completion: @escaping (Int) -> Void) {
        self.a = 5
        completion(self.a)
    }

}

