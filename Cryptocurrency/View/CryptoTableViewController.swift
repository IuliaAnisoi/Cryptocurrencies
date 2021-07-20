//
//  CryptocurrenciesTableViewController.swift
//  Cryptocurrency
//
//  Created by Iulia Anisoi on 16.07.2021.
//

import UIKit
import RxSwift

class CryptocurrenciesTableViewController: UITableViewController {
    
    private var viewModel = CryptoViewModel()
    private let disposeBag = DisposeBag()
    private var currencies: [CoinData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cryptocurrencies"
        
        viewModel.currenciesObservable.observeOn(MainScheduler.instance).subscribe { responseEvent in
            self.currencies = responseEvent.element ?? []
            self.tableView.reloadData()
        }.disposed(by: disposeBag)
        
        viewModel.getCryptoInfo()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoTableViewCell
       
        let cryptocurrency = currencies[indexPath.row]
        cell.update(with: cryptocurrency)
        
        return cell
    }
    
    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = Bundle.main.loadNibNamed("HeaderTableViewCell", owner: self, options: nil)?.first as! HeaderTableViewCell
       
        return headerCell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        <#code#>
//    }

    
}
