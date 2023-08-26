//
//  ContentView2.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/25/23.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
            
            Button("Fetch Movies") {
                let fetchMovies = MovieTitlesRequest(year: 2023)
                
                fetchMovies.fetchMovies { result in
                    switch result {
                    case .success(let fetchResults):
                        print(fetchResults)
                    case .failure(let error):
                        print("Error in fetching movies: \(error)")
                    }
                }
            }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
