//
//  NewsView.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct NewsView: View {
    @State private var articles: Array<ArticleModel> = [];
    @State private var fetching: Bool = true;
    
    var body: some View {
        VStack {
            if articles.isEmpty && !fetching {
                Text("No news is good news, they say.")
            } else if fetching {
                SpinnerWidget();
            } else {
                List(articles, id: \.text) { article in
                    ArticleCardWidget(article: article);
                }
            }
        }.task {
            fetching = true;
            await fetchData();
            fetching = false;
        }
    }
    
    func fetchData() async {
        articles = await WebService.getNews()?.results ?? [];
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
