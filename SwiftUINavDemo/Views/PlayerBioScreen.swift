//
//  PlayerBioScreen.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 27.12.2020.
//

import SwiftUI
import UIComponents

struct PlayerBioScreen: View {
    
    let player: Player
    var body: some View {
        
        VStack{
            player.profilePic
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(red: 0.93, green: 0.94, blue: 0.95), lineWidth: 5))
                .shadow(radius: 20)
                .padding(30)
            
            HStack{
                Text(player.position)
                Text(player.nationality)
                Text(player.name).bold()
            }
            .padding(20)
            
            Text("Player attributes here...")
            ActivityIndicatorView()
        }
    }
}
