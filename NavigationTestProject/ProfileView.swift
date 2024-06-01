//
//  ProfileView.swift
//  NavigationTestProject
//
//  Created by Julien Rahier on 01/06/2024.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct ProfileFeature {
    struct State {}
    enum Action {}

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {

            }
        }
    }
}

struct ProfileView: View {
    var store: StoreOf<ProfileFeature>

    var body: some View {
        Text("ProfileView")
    }
}

#Preview {
    ProfileView(store: Store(initialState: ProfileFeature.State()) {
        ProfileFeature()
    })
}
