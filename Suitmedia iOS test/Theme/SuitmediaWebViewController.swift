//
//  SuitmediaWebViewController.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 17/10/22.
//

import UIKit
import WebKit

class SuitmediaWebViewController: UIViewController {

    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)

        guard let url = URL(string: "https://suitmedia.com") else {
            return
        }

        webView.load(URLRequest(url: url))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        webView.frame = view.bounds
    }

}
