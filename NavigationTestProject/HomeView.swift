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

    @Reducer
    enum Path {
        case profile(ProfileFeature)
    }

    @ObservableState
    struct State {
        var path = StackState<Path.State>()
    }
    enum Action {
        case path(StackActionOf<Path>)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}

struct HomeView: View {
    @Perception.Bindable var store: StoreOf<HomeFeature>

    var body: some View {
        WithPerceptionTracking {
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                Text("HomeView")
                .padding()
                .navigationTitle("Home")
                .toolbar {
                    NavigationLink(
                        state: HomeFeature.Path.State.profile(ProfileFeature.State())
                    ) {
                        Image(systemName: "person.crop.circle.fill")
                    }
                }
            } destination: { store in
                switch store.case {
                case let .profile(store):
                    ProfileView(store: store)
                }
            }
        }
    }
}

#Preview {
    HomeView(store: Store(initialState: HomeFeature.State()) {
        HomeFeature()
    })
}
