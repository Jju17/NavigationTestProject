//
//  TabView.swift
//  NavigationTestProject
//
//  Created by Julien Rahier on 01/06/2024.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct TabFeature {

    @Reducer
    enum Path {
        case profile(ProfileFeature)
    }

    @ObservableState
    struct State {
        var selectedTab: Tab = .home
        var path = StackState<Path.State>()
        var home = HomeFeature.State()
        var settings = SettingsFeature.State()
    }
    enum Action {
        case tabChanged(Tab)
        case home(HomeFeature.Action)
        case settings(SettingsFeature.Action)
        case path(StackActionOf<Path>)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .tabChanged(tab):
                state.selectedTab = tab
                return .none
            case .home, .settings, .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}

enum Tab {
    case home, settings
}

struct MyTabView: View {
    @Perception.Bindable var store: StoreOf<TabFeature>

    var body: some View {
        WithPerceptionTracking {
            TabView(selection: $store.selectedTab.sending(\.tabChanged)) {
                NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                    HomeView(
                        store: self.store.scope(
                            state: \.home,
                            action: \.home
                        )
                    )
                } destination: { store in
                    switch store.case {
                    case let .profile(store):
                        ProfileView(store: store)
                    }
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tab.home)
                SettingsView(
                    store: self.store.scope(
                        state: \.settings,
                        action: \.settings
                    )
                )
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.settings)
            }
        }
    }
}

#Preview {
    MyTabView(store: Store(initialState: TabFeature.State()) {
        TabFeature()
    })
}
