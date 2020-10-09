//
//  ProductListViewModel.swift
//  SowingoChallenge
//
//  Created by Ryniere dos Santos Silva on 2020-10-08.
//

import Foundation
import RxSwift
import RxCocoa


public class ProductsListViewModel {
    
    
    private let productService: ProductService
    private let disposeBag = DisposeBag()
    
    init(productService: ProductService) {
        self.productService = productService
        
        self.fetchProducts()
    }
    
    private let _products = BehaviorRelay<[Product]>(value: [])
    
    var products: Driver<[Product]> {
        return _products.asDriver()
    }
    
    var numberOfProducts: Int {
        return _products.value.count
    }
    
    func product(at index: Int) -> Product? {
        guard index < _products.value.count else {
            return nil
        }
        return _products.value[index]
    }
    
    
    func fetchProducts() {
        
        ProductService.shared.fetchProducts { result in
            
            self._products.accept(result.hits)
            
        } errorHandler: { error in
            
            
        }

    }
    
}
