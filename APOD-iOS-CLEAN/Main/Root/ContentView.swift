//
//  ContentView.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar().setup(backgroundColor: UIColor(red: 0.052, green: 0.141, blue: 0.245, alpha: 1))
    }
    
    var body: some View {
        ApodListFactory.getApodListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
