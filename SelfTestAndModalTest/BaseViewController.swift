//
//  BaseViewController.swift
//  PearTest
//
//  Created by jay on 2020/02/11.
//  Copyright © 2020 jay. All rights reserved.
//

import UIKit

//MARK: - View Stack Print
extension UIViewController {
    func printViewName() {
        return
        var navigationStackString: String = "none"
        if let navigationStack = self.navigationController?.viewControllers {
            navigationStackString = navigationStack.map({ "\($0)" }).joined(separator: "\n")
        }
        dLog("[View Title]", self.title ?? self.navigationItem.title ?? "none" as Any,
             "\n[Navigation Stack]", navigationStackString as Any,
             "\n[Root VC]", UIApplication.shared.keyWindow?.rootViewController as Any)
    }
    
    // static variable
     static var storyboardIdentifier: String {
         return NSStringFromClass(Self.classForCoder()).components(separatedBy: ".").last!
     }
     
     // instance variable
     var storyboardIdentifier: String {
         return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
     }
     
     
     static func initialViewControllerFromStoryboard(name: String) -> UIViewController? {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         return storyboard.instantiateInitialViewController() ?? nil
     }
     
     static func viewControllerFromMainStoryboard(identifier: String) -> UIViewController {
         return viewController(storyboardName: "Main", identifiler: identifier)
     }
     
     static func viewController(storyboardName: String, identifiler: String) -> UIViewController {
         let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
         if #available(iOS 13.0, *) {
             return storyboard.instantiateViewController(identifier: identifiler)
         } else {
             // Fallback on earlier versions
             return storyboard.instantiateViewController(withIdentifier: identifiler)
         }
     }
     
     static func viewController<T: UIViewController>(storyboardName: String, type: T.Type) -> T {
         let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
         if #available(iOS 13.0, *) {
             return storyboard.instantiateViewController(identifier: T.storyboardIdentifier) as! T
         } else {
             // Fallback on earlier versions
             return storyboard.instantiateViewController(withIdentifier: T.storyboardIdentifier) as! T
         }
     }
     
     static func viewControllerFromMainStoryboard<T: UIViewController>(type: T.Type) -> T {
         return viewController(storyboardName: "Main", type: type)
     }
}


class BaseViewController: UIViewController {


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.printViewName()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        dLog("deinit : \(self)")
    }
}


//MARK: - Navigation Item 관련 기능 추가
extension BaseViewController {
    func makeTitle(_ title: String) {
        #if SERVER_DEV
        self.navigationItem.title = "\(title)(D)"
        #else
        self.navigationItem.title = title
        #endif
    }
    

}


//MARK: - View Dismiss/Pop 관련
extension BaseViewController {

    @IBAction func dismissAnimated() {
        self.dismiss(animated: true, completion: nil
//            { [weak self] in
//            if let sself = self {
//                print("dismiss completion : \(sself)")
//            }
            
//        }
    )
    }
}
