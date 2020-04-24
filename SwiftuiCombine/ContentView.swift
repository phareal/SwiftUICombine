//
//  ContentView.swift
//  SwiftuiCombine
//
//  Created by POTCHONA Essosolam Justin on 23/04/2020.
//  Copyright © 2020 POTCHONA Essosolam Justin. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var   viewModel = CoinListViewModel()
    var body: some View {
        NavigationView{
            List(viewModel.coinViewModel,id: \.self){coin in
                Text(coin.name + " - " + coin.formattedPrice)
            }.onAppear{
                self.viewModel.fetchCoins()
            }.navigationBarTitle("Coin")

        }
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ContentView())
    }
    #endif
}