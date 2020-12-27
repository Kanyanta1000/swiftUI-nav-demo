//
//  AboutScreen.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 27.12.2020.
//

import SwiftUI

struct AboutScreen: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        
        Button(action: {
            showModal = true
        }) {
            Text("INJURIES")
        }.sheet(isPresented: $showModal) {
            Spacer()
            Text("No injuries at the moment. Everyone's fit!")
            Spacer()
            Button(
                "Tap to go back.",
                action: { self.showModal.toggle()}
            )
            Spacer()
        }
    }
}
