//
//  WebViewController_2.swift
//  SelfTestAndModalTest
//
//  Created by 김재한 on 2020/06/17.
//  Copyright © 2020 jay. All rights reserved.
//

import UIKit

class WebViewController_2: BaseViewController {
    
    @IBOutlet var webView: UIWebView!
    
    var targetUrl: URL?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        print("target url 222 : \(targetUrl)")
        
        if let url = targetUrl {
            webView.loadRequest(URLRequest(url: url))
            
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
