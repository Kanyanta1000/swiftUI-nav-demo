//
//  ContentView.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 08.12.2020.
//


import SwiftUI

struct RootView: View {
    
    @State private var selectedTab = 1
    @State private var selectedRow: Int?
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            POTMScreen(selection: $selectedTab, selectedPlayer: $selectedRow).tabItem {
                Image(systemName: "person.crop.circle")
                Text("POTM")
            }.tag(0)
            
            TeamScreen(selectedId: selectedRow).tabItem {
                Image(systemName: "person.3.fill")
                Text("Team Sheet")
            }.tag(1)
            
            AboutScreen().tabItem {
                Image(systemName: "newspaper")
                Text("News")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

