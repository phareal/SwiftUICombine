//
// Created by POTCHONA Essosolam Justin on 23/04/2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Combine

class CoinListViewModel: ObservableObject {
    private let cryptoService = CryptoService()
    @Published var coinViewModel = [CoinViewModel]()

    var cancellable: AnyCancellable?

    func fetchCoins(){
        cancellable = cryptoService.fetchCoins().sink(receiveCompletion: {_ in

        }, receiveValue: { cointainer in
            self.coinViewModel = cointainer.data.coins.map { CoinViewModel($0) }
            print(self.coinViewModel)
        })
    }
}
