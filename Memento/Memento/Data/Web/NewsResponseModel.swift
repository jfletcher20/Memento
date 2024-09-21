//
//  NewsResponseModel.swift
//  Memento
//
//  Created by JoshuaLeeFletcher
//

import Foundation

struct NewsResponseModel: Codable {
    let count: Int?;
    let results: [ArticleModel]?;
}
