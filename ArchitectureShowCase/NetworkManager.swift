import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let api = "https://www.alphavantage.co/query?function=TOP_GAINERS_LOSERS&apikey=FJQ3GRQ9QBERZOK0"
    
    func getCompanies(completion: @escaping((StockResponseModel?)->())) {
        let url = URL(string: api)!
        AF.request(url).response { data in
            let decoder = JSONDecoder()
            guard let data = data.data else { return }
            do {
                let model = try decoder.decode(StockResponseModel.self, from: data)
                completion(model)
            } catch(let error) {
                print(error)
            }
        }
    }
}
