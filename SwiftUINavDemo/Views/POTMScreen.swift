//
//  POTMScreen.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 27.12.2020.
//

import SwiftUI

struct POTMScreen: View {
    
    @ObservedObject var playerListVM = PlayerListVM()
    @EnvironmentObject var router: Router
    
    private var playerOfTheMonth: Player {
        playerListVM.team.first(where: { $0.isPOTM })!
    }
    
    var body: some View {
        
        VStack {
            
            Text("Player of The Month")
                .font(.largeTitle)
            
            playerOfTheMonth.profilePic
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(red: 0.93, green: 0.94, blue: 0.95), lineWidth: 5))
                .shadow(radius: 20)
                .padding(30)
            
            Text(playerOfTheMonth.name)
            
            Button(action: {
                
                router.tabSelection = 1
                router.playerSelection = playerOfTheMonth.id
                
            }) {
                Text("Player Bio")
                    .padding(20)
            }
        }
    }
}
