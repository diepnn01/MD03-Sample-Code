//
//  ViewController.swift
//  DemoWebview
//
//  Created by Điệp Nguyễn on 5/25/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. cách 1 load request
        let request = NSURLRequest(URL: NSURL(string: "http://dantri.com.vn/")!)
        self.webview.loadRequest(request)
        
        //2. cách 2 load text html
        self.webview.loadHTMLString("<a href='http://dantri.com.vn/'> click here </a>", baseURL: nil)
        
        //3. cách 3 load file .html
        let htmlFile = NSBundle.mainBundle().pathForResource("test", ofType: "html")
        let html = try? String(contentsOfFile: htmlFile!, encoding: NSUTF8StringEncoding)
        webview.loadHTMLString(html!, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UIWebViewDelegate {
    func webViewDidStartLoad(webView: UIWebView) {
        //
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        //
    }
}

