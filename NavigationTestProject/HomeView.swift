//
//  HomeView.swift
//  NavigationTestProject
//
//  Created by Julien Rahier on 01/06/2024.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct HomeFeature {
    @ObservableState
    struct State {

    }
    enum Action {

    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {

            }
        }
    }
}

struct HomeView: View {
    @Perception.Bindable var store: StoreOf<HomeFeature>

    var body: some View {
        Text("HomeView")
            .padding()
            .navigationTitle("Home")
            .toolbar {
                NavigationLink(
                    state: TabFeature.Path.State.profile(ProfileFeature.State())
                ) {
                    Image(systemName: "person.crop.circle.fill")
                }
            }
    }
}

#Preview {
    HomeView(store: Store(initialState: HomeFeature.State()) {
        HomeFeature()
    })
}
