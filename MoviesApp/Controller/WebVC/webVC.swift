//
//  webVC.swift
//  Toys
//
//  Created by apple on 7/15/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import WebKit

class webVC: UIViewController  , WKNavigationDelegate{
    var webView : WKWebView!
    var link : String!
 
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        addRihgtBarBtn()
        // loading URL :
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .init(x: 0, y:64, width: self.view.frame.width, height: self.view.frame.height - 64), configuration: webConfiguration)
        if URL(string: link) == nil {
            
//            KMPoUp.ShowMessage(controller: self, message: "Error .. wrong request URL", image: #imageLiteral(resourceName: "warning"))
            
            
        }else{
            let request = URLRequest(url: URL(string: link)!)
            webView.navigationDelegate = self
            webView.load(request)
            self.view.addSubview(webView)
            self.view.sendSubviewToBack(webView)
            webView.goBack()
            webView.goForward()
            webView.allowsBackForwardNavigationGestures = true
            
            
        }
        btncreated()
        
        
        
        
        // init and load request in webview.
        // webView = WKWebView(frame: self.view.frame)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print(navigationAction.request.url?.absoluteString )
        print(webView.url!)
        decisionHandler(.allow)
     
    }
    
    
    @objc func cancel() { // remove @objc for Swift 3
       
        
        
    }
    func btncreated (){
        
    
    }
    
    
}
