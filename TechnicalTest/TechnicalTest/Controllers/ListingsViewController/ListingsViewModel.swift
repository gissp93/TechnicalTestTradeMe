//
//  ListingsViewModel.swift
//  TechnicalTest
//
//  Created by Gisselle Sanchez on 26/06/22.
//

import Foundation
import Alamofire

class ListingsViewModel {
    
    var listings: [ListingItem] = []
    
    init() {
        
    }

    func getListings(completion: @escaping(Bool)-> Void) {
        let requestURL = "https://api.tmsandbox.co.nz/v1/listings/latest.json"
        let consumerKey = "A1AC63F0332A131A78FAC304D007E7D1"
        let consumerSecret = "EC7F18B17A062962C6930A8AE88B16C7"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "OAuth oauth_consumer_key=\(consumerKey),oauth_signature_method=PLAINTEXT,oauth_signature=\(consumerSecret)&",
        ]
        
        let params = [
            "rows": "20",
            "photo_size": "List"
        ]
        
        let request = AF.request(requestURL, method: .get, parameters: params, headers: headers)
        request.responseDecodable(of: ListingsData.self) { (response) in
            switch response.result {
            case .success(let listingsData):
                self.listings = listingsData.listings ?? []
                completion(true)
            case .failure(let error):
                print(error)
               completion(false)
            }
        }
    }
}
