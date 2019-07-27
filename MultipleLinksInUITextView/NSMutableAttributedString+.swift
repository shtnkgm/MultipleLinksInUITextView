//
//  NSMutableAttributedString+.swift
//  MultipleLinksInUITextView
//
//  Created by Shota Nakagami on 2019/07/28.
//  Copyright © 2019 Shota Nakagami. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    func add(links: [Link]) {
        // 付与済みのリンク
        var addedLinks = [Link]()
        links.forEach { link in
            let nsRanges = string.nsRanges(of: link.text)
            
            // 同じテキストのリンクが複数存在する可能性があるので、何番目のリンクか取得する
            let index = addedLinks.filter { $0.text == link.text }.count
            guard index < nsRanges.count else {
                // リンクを付与するテキストが元の文字列に存在しない場合は何もしない
                return
            }
            addAttribute(.link, value: link.urlString, range: nsRanges[index])
            addedLinks.append(link)
        }
    }
    
    struct Link {
        let text: String
        let urlString: String
    }
}
