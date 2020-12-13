//
//  ContentView.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 08.12.2020.
//


import SwiftUI

struct RootView: View {

    @State private var selectedTab = 1
    @State var selectedRow: Int? = 0
    


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

struct POTMScreen: View {

    @ObservedObject var playerListVM = PlayerListVM()
    @Binding var selection: Int
    @Binding var selectedPlayer: Int?

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
                selection = 1
                selectedPlayer = playerOfTheMonth.id
                
            }) {
                Text("Player Bio")
            }
        }
    }
}

struct TeamScreen: View {

    @ObservedObject var playerListVM = PlayerListVM()
    @State private var selectedView: Int?
//    @State private var myTag: String
    

     private let initialSelection: Int?
     
     init(selectedId: Int? = nil) {
         self.initialSelection = selectedId
     }

    var body: some View {
        NavigationView {
            
            List() {
                ForEach(playerListVM.team) { player in
//                    NavigationLink(destination: PlayerBioScreen(player: player)) {
//                        cell(player: player)
//                    }
                    
                    NavigationLink(destination: PlayerBioScreen(player: player), tag: player.id, selection: self.$selectedView) {
                        cell(player: player)
                        }
                }
            }

            .navigationBarTitle("Team Sheet")
        }
        
        .onAppear {

            // at the moment the most reliable way to set the default selection is inside onAppear
            if let initialSelection = self.initialSelection {
                self.selectedView = initialSelection
            } else {
                self.selectedView = self.playerListVM.team.first?.id
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
        Player(id: 1, name: "Bernd Leno", position: "GK", nationality: "🇩🇪", profilePic: Image("Leno"), isPOTM: false),
        Player(id: 2, name: "Héctor Bellerín", position: "DF", nationality: "🇪🇸", profilePic: Image("Bellerin"), isPOTM: false),
        Player(id: 3, name: "Kieran Tierney", position: "DF", nationality: "🏴󠁧󠁢󠁳󠁣󠁴󠁿", profilePic: Image("Tierney"), isPOTM: false),
        Player(id: 4, name: "Gabriel", position: "DF", nationality: "🇧🇷", profilePic: Image("Gabriel"), isPOTM: false),
        Player(id: 5, name: "Bukayo Saka", position: "MF", nationality: "🇬🇧", profilePic: Image("Saka"), isPOTM: false),
        Player(id: 6, name: "Willian", position: "MF", nationality: "🇧🇷", profilePic: Image("Willian"), isPOTM: false),
        Player(id: 7, name: "Ainsley Maitland-Niles", position: "MF", nationality: "🇬🇧", profilePic: Image("MaitlandNiles"), isPOTM: false),
        Player(id: 8, name: "Nicolas Pépé", position: "MF", nationality: "🇨🇮", profilePic: Image("Pepe"), isPOTM: false),
        Player(id: 9, name: "Pierre-Emerick Aubameyang", position: "FW", nationality: "🇬🇦", profilePic: Image("Aubameyang"), isPOTM: false),
        Player(id: 10, name: "Alexandre Lacazette", position: "FW", nationality: "🇫🇷", profilePic: Image("Lacazette"), isPOTM: true)
    ]
}

struct Player: Identifiable {
//    let id = UUID().uuidString
    let id: Int
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

