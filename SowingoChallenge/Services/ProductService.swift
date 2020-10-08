//
//  ApiService.swift
//  SowingoChallenge
//
//  Created by Ryniere dos Santos Silva on 2020-10-08.
//

import Foundation


class ProductService {
    
    public static let shared = ProductService()
    
    private let baseAPIURL = "https://demo5514996.mockable.io"
    
    private let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    public func fetchProducts( successHandler: @escaping (_ response: Result) -> Void, errorHandler: @escaping(_ error: Error) -> Void) {
        
        guard let urlComponents = URLComponents(string: "\(baseAPIURL)/products") else {
            errorHandler(ToDoError.invalidEndpoint)
            return
        }
        
        guard let url = urlComponents.url else {
            errorHandler(ToDoError.invalidEndpoint)
            return
        }
        
        urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.handleError(errorHandler: errorHandler, error: ToDoError.apiError)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.handleError(errorHandler: errorHandler, error: ToDoError.invalidResponse)
                return
            }
            
            guard let data = data else {
                self.handleError(errorHandler: errorHandler, error: ToDoError.noData)
                return
            }
            
            do {
                let result = try self.jsonDecoder.decode(Result.self, from: data)
                DispatchQueue.main.async {
                    successHandler(result)
                }
            } catch {
                self.handleError(errorHandler: errorHandler, error: ToDoError.serializationError)
            }
        }.resume()
        
    }
    
    
    private func handleError(errorHandler: @escaping(_ error: Error) -> Void, error: Error) {
        DispatchQueue.main.async {
            errorHandler(error)
        }
    }
}

public enum ToDoError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
}
