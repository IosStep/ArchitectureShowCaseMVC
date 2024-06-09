import Foundation

protocol StockBusinessLogic {
    func viewDidLoad()
}

class StockController: StockBusinessLogic {
    let manager = NetworkManager.shared
    
    var view: StockPresentationLogic?
    
    func viewDidLoad() {
        manager.getCompanies { model in
            self.view?.presentStocks(model?.top_gainers)
        }
    }
    
}
