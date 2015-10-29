//
//  ViewController.swift
//  izakaya-project
//
//  Created by 久松 由幸 on 2015/10/28.
//  Copyright © 2015年 hisasann. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.showWebView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ステータスバーを非表示にする
    // via http://www.sirochro.com/note/swift-statusbar-hidden/
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func showWebView() {
        print(UIScreen.mainScreen().applicationFrame)
        
        self.webview.delegate = self
        self.webview.frame = self.view.bounds
        
        // bounceさせない
        // via http://qiita.com/tyfkda/items/2ee4a7b95f4bfdcebf1d
        self.webview.scrollView.bounces = false
        
        let targetURL = "https://izakaya-project.herokuapp.com/ojisan"
        let url = NSURL(string: targetURL)
        let request = NSURLRequest(URL: url!)
        
        self.webview?.loadRequest(request)
    }
}

