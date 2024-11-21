//
//  TrendingItem.swift
//  Grid
//
//  Created by Aarnav Singh on 20/11/24.
//


import Foundation

// TrendingItem model to decode JSON response
struct TrendingItem: Decodable {
    let title: String
    let image: String
}
