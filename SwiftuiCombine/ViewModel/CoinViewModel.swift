//
// Created by POTCHONA Essosolam Justin on 23/04/2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct CoinViewModel {
    private let coin: Coin

    var name: String {
        return  coin.name
    }

    var formattedPrice: String{
        return coin.price
    }

    init(coin: Coin) {
        self.coin = coin
    }
}
