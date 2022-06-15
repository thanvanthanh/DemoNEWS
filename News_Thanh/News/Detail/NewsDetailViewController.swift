//
//  NewsDetailViewController.swift
//  News_Thanh
//
//  Created by Thanh - iOS on 15/06/2022.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController {
    private let url: URL
    
    @IBOutlet weak var webView: WKWebView!

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: url))
        // Do any additional setup after loading the view.
    }
}
