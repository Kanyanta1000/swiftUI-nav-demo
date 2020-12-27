//
//  TeamScreen.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 27.12.2020.
//

import SwiftUI

struct TeamScreen: View {
    @EnvironmentObject var router: Router
    
    @ObservedObject var playerListVM = PlayerListVM()
    
    init () {}
    
    var body: some View {
        
        let layout = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 15) {
                    ForEach(playerListVM.team) { player in
                        NavigationLink(destination: PlayerBioScreen(player: player), tag: player.id, selection: $router.playerSelection) {
                            cell(player: player)
                        }.onTapGesture {
                            router.playerSelection = player.id
                        }
                    }
                    .padding()
                }
            }

            
            .navigationBarTitle("Team Sheet")
        }
    }
    
    func cell(player: Player) -> some View {
        VStack{
            player.profilePic 
                .resizable()
                .scaledToFit()
                //                .frame(height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(red: 0.93, green: 0.94, blue: 0.95), lineWidth: 5))
                .shadow(radius: 20)
            
            HStack{
                Text(player.position)
                Text(player.nationality)
            }
            Text(player.name).bold()
        }
    }
}

