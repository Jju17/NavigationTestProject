//
//  SettingsView.swift
//  NavigationTestProject
//
//  Created by Julien Rahier on 01/06/2024.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct SettingsFeature {
    struct State {}
    enum Action {}

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {

            }
        }
    }
}

struct SettingsView: View {
    var store: StoreOf<SettingsFeature>

    var body: some View {
        Text("SettingsView")
    }
}

#Preview {
    SettingsView(store: Store(initialState: SettingsFeature.State()) {
        SettingsFeature()
    })
}
