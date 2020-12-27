//
//  ContentView.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 08.12.2020.
//


import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        
        TabView(selection: $router.tabSelection) {
            POTMScreen().tabItem {
                Image(systemName: "person.crop.circle")
                Text("POTM")
            }.tag(0)
            
            TeamScreen().tabItem {
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

