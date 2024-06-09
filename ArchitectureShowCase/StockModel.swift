import Foundation

struct StockResponseModel: Codable {
    var metadata: String
    var last_updated: String
    var top_gainers: [StockModel]
    var top_losers: [StockModel]
}

struct StockModel: Codable{
    var ticker: String
    var price: String
    var change_amount: String
    var change_percentage: String
    var volume: String
}
