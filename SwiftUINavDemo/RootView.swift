//
//  ContentView.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 08.12.2020.
//

import SwiftUI


struct RootView: View {
    
    @State private var selectedTab = 1
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            POTMScreen(selection: $selectedTab).tabItem {
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

struct POTMScreen: View {
    
    @State var showModal: Bool = false
    
    @Binding var selection: Int
    
    var body: some View {
        
        VStack {
            
            Text("Player of The Month")
                .font(.largeTitle)
            
            Image("Aubameyang")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(red: 0.93, green: 0.94, blue: 0.95), lineWidth: 5))
                .shadow(radius: 20)
                .padding(30)
            
            Button(action: {
                selection = 1
            }) {
                Text("Player Bio")
            }
            
        }
    }
}


struct TeamScreen: View {
    
    @ObservedObject var playerListVM = PlayerListVM()
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(playerListVM.team) { player in
                    NavigationLink(destination: PlayerBioScreen(player: player)) {
                        cell(player: player)
                    }
                }
            }
            
            .navigationBarTitle("Team Sheet")
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


struct PlayerBioScreen: View {
    
    let player: Player
    
    var body: some View {
        
        HStack{
            Text(player.position)
            Text(player.nationality)
            Text(player.name).bold()
        }
    }
}

struct AboutScreen: View {
    
    @State var showModal: Bool = false

    var body: some View {
        Button(action: {
            showModal = true
        }) {
            Text("Injuries")
        }.sheet(isPresented: $showModal) {
            Text("No injuries at the moment. Everyone's fit!")
            Button(
                "Tap to go back.",
                action: { self.showModal = false}
            )
        }
    }
}

final class PlayerListVM: ObservableObject {
    
    @Published private(set) var team = [
        Player(name: "Bernd Leno", position: "GK", nationality: "🇩🇪", profilePic: Image("Leno"), isPOTM: false),
        Player(name: "Héctor Bellerín", position: "DF", nationality: "🇪🇸", profilePic: Image("Bellerin"), isPOTM: false),
        Player(name: "Kieran Tierney", position: "DF", nationality: "🏴󠁧󠁢󠁳󠁣󠁴󠁿", profilePic: Image("Tierney"), isPOTM: false),
        Player(name: "Gabriel", position: "DF", nationality: "🇧🇷", profilePic: Image("Gabriel"), isPOTM: false),
        Player(name: "Bukayo Saka", position: "MF", nationality: "🇬🇧", profilePic: Image("Saka"), isPOTM: false),
        Player(name: "Willian", position: "MF", nationality: "🇧🇷", profilePic: Image("Willian"), isPOTM: false),
        Player(name: "Ainsley Maitland-Niles", position: "MF", nationality: "🇬🇧", profilePic: Image("MaitlandNiles"), isPOTM: false),
        Player(name: "Nicolas Pépé", position: "MF", nationality: "🇨🇮", profilePic: Image("Pepe"), isPOTM: false),
        Player(name: "Pierre-Emerick Aubameyang", position: "FW", nationality: "🇬🇦", profilePic: Image("Aubameyang"), isPOTM: true),
        Player(name: "Alexandre Lacazette", position: "FW", nationality: "🇫🇷", profilePic: Image("Lacazette"), isPOTM: false)
    ]
    
}

struct Player: Identifiable {
    let id = UUID().uuidString
    let name: String
    let position: String
    let nationality: String
    let profilePic: Image
    let isPOTM: Bool
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}