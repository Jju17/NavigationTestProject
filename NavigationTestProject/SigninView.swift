//
//  SigninView.swift
//  NavigationTestProject
//
//  Created by Julien Rahier on 01/06/2024.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct SigninFeature {
    struct State {}
    enum Action {}

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {

            }
        }
    }
}

struct SigninView: View {
    var store: StoreOf<SigninFeature>

    var body: some View {
        Text("SigninView")
    }
}

#Preview {
    SigninView(store: Store(initialState: SigninFeature.State()) {
        SigninFeature()
    })
}
