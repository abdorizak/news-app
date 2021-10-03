//
//  ArticleVc.swift
//  News App
//
//  Created by Abdirizak Hassan on 10/2/21.
//

import UIKit
import WebKit

class ArticleVc: UIViewController {
    
    @IBOutlet var articleWebview: WKWebView!
    
    var article: Article?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let articleUrl = article?.url, let url = URL(string: articleUrl) {
            let req = URLRequest(url: url)
            articleWebview.load(req)
        }
        
    }

}
