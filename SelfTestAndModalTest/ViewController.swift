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
    let urlIncludingSharp = "https://m.mizsarang.com/#/redirect?p=hpmz&utm_source=banksalad&utm_medium=display&utm_campaign=hpmz_mo&utm_term=%EB%A6%AC%EC%8A%A4%ED%8A%B8_cpc&utm_content=%EB%8B%A4%EC%9D%B4%EB%A0%89%ED%8A%B8%EC%97%B0%EA%B2%B0"
    let urlDaum = "https://www.daum.net"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
		if navigationItem.title == nil {
			self.navigationItem.title = "시작화면 타이틀"
		}
		
		if #available(iOS 12, *) {
			print("version : 12 or greater")
		} else {
			print("version : 11 or smaller")
		}
    }
}

//MARK: - Load WebView
extension ViewController {
    func loadURL(urlString: String?) {
        if let urlString = urlString, let url = URL(string: urlString) {
			let webVC: WebViewController = UIViewController.viewControllerFromMainStoryboard(type: WebViewController.self)
            
            webVC.targetUrl = url
            
            if let nav = self.navigationController {
                nav.pushViewController(webVC, animated: true)
            }
            
        }
    }
    
    func loadURL2(urlString: String?) {
        if let urlString = urlString, let url = URL(string: urlString) {
			let webVC = UIViewController.viewControllerFromMainStoryboard(type: WebViewController_2.self)
            
            webVC.targetUrl = url
            
            if let nav = self.navigationController {
                nav.pushViewController(webVC, animated: true)
            }
            
        }
    }
}


//MARK: - IB Actions
extension ViewController {
    @IBAction func pushWebVC() {
        loadURL(urlString: urlIncludingSharp)
    }
    
    @IBAction func pushWebVC2() {
        loadURL2(urlString: urlIncludingSharp)
    }
    
    
    @IBAction func push() {
        let newVC = UIViewController.viewControllerFromMainStoryboard(type: ViewController.self)
		newVC.navigationItem.title = "다음화면 타이틀"
		
        if let nav = self.navigationController {
            nav.pushViewController(newVC, animated: true)
        }
    }
    
    @IBAction func modal() {
        let newVC = UIViewController.viewControllerFromMainStoryboard(type: ViewController.self)
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
				if let nav = finalRootVC.navigationController {
					nav.popToRootViewController(animated: true)
				} else if let selfNav = finalRootVC as? UINavigationController {
					selfNav.popToRootViewController(animated: true)
				}
            }
        }
    }
    
    @IBAction func makeLeftButton() {
        self.navigationItem.setLeftBarButtonItems([UIBarButtonItem(barButtonSystemItem: .camera, target: nil, action: nil)], animated: true)
        
//        self.navigationItem.setRightBarButtonItems([UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)], animated: true)
    }
    
    @IBAction func clearLeftButton() {
        let fixed = [UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)]
        self.navigationItem.setLeftBarButtonItems(nil, animated: true)
//		self.navigationItem.setRightBarButtonItems(nil, animated: true)
    }
    
    func process(completion: @escaping (Int) -> Void) {
        self.a = 5
        completion(self.a)
    }

}

