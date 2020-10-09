//
//  MainViewController.swift
//  SowingoChallenge
//
//  Created by Ryniere dos Santos Silva on 2020-10-07.
//

import UIKit
import RxSwift

class ProductsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ProductsListViewModel!
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        setupBinding()
    }
    
    func setupBinding() {
        
        viewModel = ProductsListViewModel(productService: ProductService.shared)
        
        viewModel.products
            .drive(onNext: {[unowned self] (_) in
                self.tableView.reloadData()
            }).disposed(by: disposeBag)
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfProducts
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 17
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        
        if let product = viewModel.product(at: indexPath.section) {
            cell.configure(product: product)
        }
        return cell
    }
}
