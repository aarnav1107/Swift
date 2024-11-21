//
//  NetworkManager.swift
//  Grid
//
//  Created by Aarnav Singh on 20/11/24.
//

import Foundation
import Alamofire

struct NetworkManager {
    /// fetch data from content.getTrending api and parse it in form of TrendingItem Model
    /// By URLSession
    static func fetchTrending(completion: @escaping (Result<[TrendingItem], Error>) -> Void) {
        /// API URL
        guard let url = URL(string: "https://www.saavn.com/api.php?app_version=9.14.0&v=1006&device_type=iPhone_Simulator&_marker=false&_format=json&ctx=iphoneapp&api_version=4&dolby_support=false&is_jio_user=false&r_device=false&network_type=WIFI&network_subtype=wifi&cc=91&__call=content.getTrending&n=24&type=more&p=1&tz=Asia/Kolkata") else { return }

        /// Perform the GET request
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode([TrendingItem].self, from: data)
                    /// Successfully parsed the response
                    /// Pass the fetched items in the success case
                    completion(.success(response))
                } catch {
                    /// Failed in parsing data into TrendingItem Model 
                    /// Pass the error in the failure case
                    print("Decoding Error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            } else if let error = error {
                /// Pass the error in the failure case
                print("Error fetching Items: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume()
    }
    
    /// fetch data from content.getTrending api and parse it in form of TrendingItem Model
    /// By Alamofire
    static func fetchTrendingByAF(completion: @escaping (Result<[TrendingItem], Error>) -> Void) {
        /// API URL String
        let url = "https://www.saavn.com/api.php?app_version=9.14.0&v=1006&device_type=iPhone_Simulator&_marker=false&_format=json&ctx=iphoneapp&api_version=4&dolby_support=false&is_jio_user=false&r_device=false&network_type=WIFI&network_subtype=wifi&cc=91&__call=content.getTrending&n=24&type=more&p=1&tz=Asia/Kolkata"
        
        /// Perform the GET request
        AF.request(url, method: .get).responseDecodable(of: [TrendingItem].self) { response in
            switch response.result {
            case .success(let trendingItems):
                /// Successfully parsed the response
                /// Pass the fetched items in the success case
                completion(.success(trendingItems))
            case .failure(let error):
                /// Pass the error in the failure case
                print("Error fetching Items: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
}
