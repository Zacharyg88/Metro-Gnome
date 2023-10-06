//
//  ContentView.swift
//  Metro-Gnome
//
//  Created by Zach Eidenberger on 9/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            FlashView(flashViewManager: FlashViewManager())
            Image("gnome_mint_solo")
                .allowsHitTesting(false)
                
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
