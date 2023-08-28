//
//  ContentView2.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/25/23.
//

import SwiftUI

struct ContentView2: View {
    @State private var isView: Int = 0
    @State private var navigationTitle: String = "Movie List"
    var body: some View {
        NavigationView {
            let tabItems = Self.tabItems(isView: $isView)
            TabView(selection: $isView) {
                ForEach(tabItems.indices, id: \.self) { index in
                    let item = tabItems[index]
                    item.view
                        .tabItem {
                            Image(systemName: item.icon)
                            Text(item.title)
                        }
                        .tag(item.id)
                }
            }
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(Color(.white).opacity(100))
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            .tint(Color(.red))
            .navigationTitle(navigationTitle)
            .onChange(of: isView) { newValue in
                navigationTitle = tabItems[newValue].navTitle
            }
            .navigationBarTitleDisplayMode(.automatic)
        }
        .tint(Color.red)
    }
}


extension ContentView2 {
    struct TabItem: Identifiable {
        let id = UUID()
        let title: String
        let navTitle: String
        let icon: String
        let view: AnyView
    }
    
    static func tabItems(isView: Binding<Int>) -> [TabItem] {
        [
        TabItem(title: "Movies", navTitle: "Movie List", icon: "house", view: AnyView(MovieListView(isView: isView))),
         TabItem(title: "Series", navTitle: "Series List", icon: "newspaper", view: AnyView(SeriesListView(isView: isView))),
        TabItem(title: "Episodes", navTitle: "Upcoming Episodes", icon: "square.3.layers.3d.down.right", view: AnyView(UpcomingEpisodesListView(isView: isView)))
        ]
    }

}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
