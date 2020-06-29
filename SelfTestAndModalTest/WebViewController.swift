//
//  WebViewController.swift
//  SelfTestAndModalTest
//
//  Created by 김재한 on 2020/06/17.
//  Copyright © 2020 jay. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {
    
    @IBOutlet var webView: WKWebView!
    
    var targetUrl: URL?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("target url : \(targetUrl)")
        
        if let url = targetUrl {
            webView.load(URLRequest(url: url))
            
            print("why???")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
