//
//  ArticleModel.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import Foundation

// the convention for this application will be that DataModels refer to Core entities,
// whereas Models refer to a simple data container
struct ArticleModel: Codable {
    let title: String?;
    let text: String?;
    let date: String?;
    let imagePath: String?;
    
    enum CodingKeys: String, CodingKey {
        case title
        case text
        case date
        case imagePath = "image_path"
    }
}
