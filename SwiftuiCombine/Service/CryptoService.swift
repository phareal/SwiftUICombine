//
// Created by POTCHONA Essosolam Justin on 23/04/2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Combine

class CryptoService {

    var components:URLComponents{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coinranking.com"
        components.path = "/v1/public/coins"
        components.queryItems = [URLQueryItem(name: "base", value: "usd"),URLQueryItem(name: "timePeriod", value: "24h")]

        return  components
    }

    func fetchCoins() -> AnyPublisher<CrypToDataContainer, Error>{
        return  URLSession.shared.dataTaskPublisher(for: components.url!)
            .map{$0.data}
            .decode(type: CrypToDataContainer.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}

struct CrypToDataContainer: Decodable{
    let status: String
    let data: CryptoData
}

