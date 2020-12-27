//
//  PlayerListVM.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 27.12.2020.
//

import SwiftUI

final class PlayerListVM: ObservableObject {
    
    @Published private(set) var team = [
        Player(id: 1, name: "Bernd Leno", position: "GK", nationality: "🇩🇪", profilePic: Image("Leno"), isPOTM: false),
        Player(id: 2, name: "Héctor Bellerín", position: "DF", nationality: "🇪🇸", profilePic: Image("Bellerin"), isPOTM: false),
        Player(id: 3, name: "Kieran Tierney", position: "DF", nationality: "🏴󠁧󠁢󠁳󠁣󠁴󠁿", profilePic: Image("Tierney"), isPOTM: false),
        Player(id: 4, name: "Gabriel", position: "DF", nationality: "🇧🇷", profilePic: Image("Gabriel"), isPOTM: false),
        Player(id: 5, name: "Bukayo Saka", position: "MF", nationality: "🇬🇧", profilePic: Image("Saka"), isPOTM: true),
        Player(id: 6, name: "Willian", position: "MF", nationality: "🇧🇷", profilePic: Image("Willian"), isPOTM: false),
        Player(id: 7, name: "Ainsley Maitland-Niles", position: "MF", nationality: "🇬🇧", profilePic: Image("MaitlandNiles"), isPOTM: false),
        Player(id: 8, name: "Nicolas Pépé", position: "MF", nationality: "🇨🇮", profilePic: Image("Pepe"), isPOTM: false),
        Player(id: 9, name: "Pierre-Emerick Aubameyang", position: "FW", nationality: "🇬🇦", profilePic: Image("Aubameyang"), isPOTM: false),
        Player(id: 10, name: "Alexandre Lacazette", position: "FW", nationality: "🇫🇷", profilePic: Image("Lacazette"), isPOTM: false)
    ]
}
