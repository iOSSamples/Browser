//
//  ViewController.swift
//  Browser
//
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UIWebViewDelegate
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.loading.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.loading.stopAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        self.loading.stopAnimating()
    }
    
    //MARK: - UISearchBarDelegate
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        var urlStr:String = searchBar.text
        if (urlStr.rangeOfString("http://", options: nil, range: nil, locale: nil) == nil &&
            urlStr.rangeOfString("https://", options: nil, range: nil, locale: nil) == nil) {
                urlStr = ("http://\(urlStr)")
        }
        if let url = NSURL(string: urlStr){
            let request = NSURLRequest(URL: url)
            
            self.myWebView.loadRequest(request)
            
        }
        
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
