//
//  FirstViewController.swift
//  DemoWebview
//
//  Created by Điệp Nguyễn on 5/25/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webview: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let request = NSURLRequest(URL: NSURL(string: "http://dantri.com.vn/")!)
        
        
        self.webview.delegate = self
//        self.webview.loadRequest(request)
        
        self.webview.loadHTMLString("<a href='http://dantri.com.vn/'> click here </a>", baseURL: nil)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
    }
    
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
