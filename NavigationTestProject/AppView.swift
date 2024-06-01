//
//  AppView.swift
//  NavigationTestProject
//
//  Created by Julien Rahier on 01/06/2024.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct AppFeature {

    @ObservableState
    enum State {
        case signin(SigninFeature.State)
        case tab(TabFeature.State)
    }
    enum Action {
        case signin(SigninFeature.Action)
        case tab(TabFeature.Action)

    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .signin, .tab:
                return .none
            }
        }
        .ifCaseLet(/State.tab, action: /Action.tab) {
            TabFeature()
        }
        .ifCaseLet(/State.signin, action: /Action.signin) {
            SigninFeature()
        }
    }
}



struct AppView: View {
    var store: StoreOf<AppFeature>

    var body: some View {
        switch store.state {
        case .signin:
            if let store = store.scope(state: \.signin, action: \.signin) {
                SigninView(store: store)
            }
        case .tab:
            if let store = store.scope(state: \.tab, action: \.tab) {
                MyTabView(store: store)
            }
        }
    }
}

#Preview {
    AppView(store: Store(initialState: AppFeature.State.tab(TabFeature.State())) {
        AppFeature()
    })
}
