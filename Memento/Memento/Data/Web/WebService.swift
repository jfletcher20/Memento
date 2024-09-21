//
//  WebService.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import Foundation

// barebones web service class
class WebService {
    
    public static let root: String = "https://cortex.foi.hr/lav/memento/";
    public static let newsRoute: String = "news.php";
    
    public static func imgUrl(imagePath: String) -> URL? {
        return URL(string: root + imagePath);
    }
    
    public static func getNews() async -> NewsResponseModel? {
        
        guard let url = URL(string: "https://cortex.foi.hr/lav/memento/news.php") else {
            print("Invalid URL");
            return nil;
        }
        
        var newsResponse: NewsResponseModel?;
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url);
            let news = try? JSONDecoder().decode(NewsResponseModel.self, from: data);
            newsResponse = news;
        } catch { }
        
        return newsResponse;
    
    }
    
}
