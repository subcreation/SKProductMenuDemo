//
//  ContentView.swift
//  SKProductMenuDemo
//
//  Created by Nathanael Roberton on 2/6/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var store: Store = Store()
    
    private var hasStandard: Bool {
        var result = false
        for subscription in store.purchasedSubscriptions {
            if subscription.displayName == "Standard" {
                result = true
            }
        }
        return result
    }
    
    private var hasPremium: Bool {
        var result = false
        for subscription in store.purchasedSubscriptions {
            if subscription.displayName == "Premium" {
                result = true
            }
        }
        return result
    }
    
    private var hasPro: Bool {
        var result = false
        for subscription in store.purchasedSubscriptions {
            if subscription.displayName == "Pro" {
                result = true
            }
        }
        return result
    }
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: MyCarsView()) {
                    Label("My Cars", systemImage: "car.2")
                }
                NavigationLink(destination: StoreView()) {
                    Label("Shop", systemImage: "cart")
                }
                if hasStandard || hasPremium || hasPro {
                    NavigationLink(destination: Text("Standard")) {
                        Label("Standard", systemImage: "shippingbox.fill")
                    }
                }
                if hasPremium || hasPro {
                    NavigationLink(destination: Text("Premium")) {
                        Label("Premium", systemImage: "shippingbox.fill")
                    }
                }
                if hasPro {
                    NavigationLink(destination: Text("Pro")) {
                        Label("Pro", systemImage: "shippingbox.fill")
                    }
                }
                
            }
        }
        .environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
