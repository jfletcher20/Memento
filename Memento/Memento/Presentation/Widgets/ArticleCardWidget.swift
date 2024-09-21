//
//  ArticleCardWidget.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct ArticleCardWidget: View {
    let article: ArticleModel?;
    init(article: ArticleModel? = nil) { // to allow for preview
        self.article = article;
    }
    
    var body: some View {
        HStack {
            VStack {
                AsyncImage(url: WebService.imgUrl(imagePath: article?.imagePath ?? "images/celebration.jpg"), scale: 8)
                    .frame(width: 128 * (9 / 16), height: 128 * (7 / 16))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(.purple, lineWidth: 1))
                Text(
                    (article?.date ?? "21.9.2024. 02:38:11").split(separator: " ")[0]
                ).font(.caption)
            }
            VStack(alignment: .leading) {
                Text(article?.title ?? "Unknown title")
                    .font(.headline)
                    .foregroundColor(.purple)
                Text(article?.text ?? "Unknown article contents").font(.body)
                Spacer()
            }
        }
    }
}

struct ArticleCardWidget_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardWidget();
    }
}
