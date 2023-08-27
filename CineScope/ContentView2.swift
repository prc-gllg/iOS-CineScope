//
//  ContentView2.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/25/23.
//

import SwiftUI

struct ContentView2: View {
    @StateObject private var viewModel = MediaListViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.mediaList, id: \.id) { media in
                VStack {
                    MediaListCell(media: media)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Movie List")
        }
//        ScrollView {
//            VStack {
//                Text("Media List")
//                ForEach(viewModel.mediaList) { media in
//                    Text(media.titleText?.text ?? "unknown")
//                }
//            }
//        }
        .onAppear {
            viewModel.fetchMedia()
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
