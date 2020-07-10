//
//  MarketChart.swift
//  
//
//  Created by Adrian Corscadden on 2020-07-09.
//

import Foundation

struct MarketChart: Codable {
    let prices: [[Double]]
}

extension MarketChart {
    var dataPoints: [PriceDataPoint] {
        prices.compactMap {
            guard $0.count == 2 else { return nil }
            return PriceDataPoint(timestamp: Int($0[0]), price: $0[1])
        }
    }
}

struct PriceDataPoint: Codable {
    let timestamp: Int
    let price: Double
}
