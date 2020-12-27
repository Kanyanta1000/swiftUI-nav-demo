//
//  TeamScreen.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 27.12.2020.
//

import SwiftUI

struct TeamScreen: View {
    @ObservedObject var playerListVM = PlayerListVM()
    @State private var selectedView: Int?
    
    private let initialSelection: Int?
    
    init(selectedId: Int? = 1) {
        self.initialSelection = selectedId
    }
    
    var body: some View {
        
        NavigationView {
            List() {
                ForEach(playerListVM.team) { player in
                    NavigationLink(destination: PlayerBioScreen(player: player), tag: player.id, selection: self.$selectedView) {
                        cell(player: player)
                    }
                }
            }
            .navigationBarTitle("Team Sheet")
        }
        
        .onAppear {
            if let initialSelection = initialSelection {
                selectedView = initialSelection
            } else {
                selectedView = playerListVM.team.first?.id
            }
        }
    }
    
    func cell(player: Player) -> some View {
        
        HStack{
            Text(player.position)
            Text(player.nationality)
            Text(player.name).bold()
        }
    }
}
