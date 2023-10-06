//
//  FlashView.swift
//  Metro-Gnome
//
//  Created by Zach Eidenberger on 10/4/23.
//

import SwiftUI

struct FlashView: View {
    @ObservedObject var flashViewManager: FlashViewManager
    var body: some View {
        ZStack {
            flashViewManager.getColor()
            VStack {
                HStack {
                    Text("\(flashViewManager.currentBPM.rounded(.up))bpm")
                        .onTapGesture {
                            openManaulBPMView()
                        }
                    Spacer()
                        Button(action: {
                            openMenu()
                        }) {
                            Image(systemName: "line.3.horizontal")
                    }
                        .frame(width: 64, height: 64)
                }
                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            flashViewManager.flashHandler(didRecieveTap: true)
        }
    }
    func openMenu() {
        print("open options menu")
    }
    
    func openManaulBPMView() {
        
    }
}

struct FlashView_Previews: PreviewProvider {
    static var previews: some View {
        FlashView(flashViewManager: FlashViewManager())
    }
}
