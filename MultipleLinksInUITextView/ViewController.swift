//
//  ViewController.swift
//  MultipleLinksInUITextView
//
//  Created by Shota Nakagami on 2019/07/28.
//  Copyright © 2019 Shota Nakagami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextView()
        addLinks()
    }
    
    func setTextView() {
        textView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        textView.center = view.center
        textView.delegate = self
        textView.isSelectable = true
        textView.isEditable = false
        view.addSubview(textView)
    }

    func addLinks() {
        let text = "Qiitaのアカウントはこちらです。Twitterのアカウントはこちらです。GitHubのアカウントはこちらです。"
        let attributedString = NSMutableAttributedString(string: text)
        let links: [NSMutableAttributedString.Link] = [
            .init(text: "Qiita", urlString: "https://qiita.com/"),
            .init(text: "こちら", urlString: "https://qiita.com/shtnkgm"),
            .init(text: "Twitter", urlString: "https://twitter.com"),
            .init(text: "こちら", urlString: "https://twitter.com/shtnkgm"),
            .init(text: "GitHub", urlString: "https://github.com"),
            .init(text: "こちら", urlString: "https://github.com/shtnkgm")
        ]
        attributedString.add(links: links)
        textView.attributedText = attributedString
    }
}

extension UIViewController: UITextViewDelegate {
    public func textView(_ textView: UITextView,
                         shouldInteractWith URL: URL,
                         in characterRange: NSRange,
                         interaction: UITextItemInteraction) -> Bool {
        print(URL.absoluteString)
        
        //
        return false
    }
}

