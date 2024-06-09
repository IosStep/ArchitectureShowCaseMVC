import UIKit
import SnapKit

protocol StockPresentationLogic {
    func presentStocks(_ data: [StockModel]?)
}

class ViewController: UIViewController {
    
    var controller: StockBusinessLogic?
    
    var stocks = [StockModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("tap me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonFunction), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonFunction() {
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        controller?.viewDidLoad()
    }
    
    func setup() {
        let view = self
        let controller = StockController()
        view.controller = controller
        controller.view = view
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()

        content.image = UIImage(systemName: "star")
        content.text = stocks[indexPath.row].ticker
        content.secondaryText = stocks[indexPath.row].price

        content.imageProperties.tintColor = .purple

        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(stocks[indexPath.row])
    }
    
    
}

extension ViewController: StockPresentationLogic {
    func presentStocks(_ data: [StockModel]?) {
        if let data = data {
            self.stocks = data
        }
    }
    
    
}
