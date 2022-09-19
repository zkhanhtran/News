//
//  NewsModel.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import Foundation

struct NewsModel: Codable {
    let status: String
    let totalResults: Int?
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
